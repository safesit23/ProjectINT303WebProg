/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import controller.exceptions.IllegalOrphanException;
import controller.exceptions.NonexistentEntityException;
import controller.exceptions.PreexistingEntityException;
import controller.exceptions.RollbackFailureException;
import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import model.OrderDetail;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.transaction.UserTransaction;
import model.Shoe;

/**
 *
 * @author jatawatsafe
 */
public class ShoeJpaController implements Serializable {

    public ShoeJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Shoe shoe) throws PreexistingEntityException, RollbackFailureException, Exception {
        if (shoe.getOrderDetailList() == null) {
            shoe.setOrderDetailList(new ArrayList<OrderDetail>());
        }
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            List<OrderDetail> attachedOrderDetailList = new ArrayList<OrderDetail>();
            for (OrderDetail orderDetailListOrderDetailToAttach : shoe.getOrderDetailList()) {
                orderDetailListOrderDetailToAttach = em.getReference(orderDetailListOrderDetailToAttach.getClass(), orderDetailListOrderDetailToAttach.getOrderDetailPK());
                attachedOrderDetailList.add(orderDetailListOrderDetailToAttach);
            }
            shoe.setOrderDetailList(attachedOrderDetailList);
            em.persist(shoe);
            for (OrderDetail orderDetailListOrderDetail : shoe.getOrderDetailList()) {
                Shoe oldShoeOfOrderDetailListOrderDetail = orderDetailListOrderDetail.getShoe();
                orderDetailListOrderDetail.setShoe(shoe);
                orderDetailListOrderDetail = em.merge(orderDetailListOrderDetail);
                if (oldShoeOfOrderDetailListOrderDetail != null) {
                    oldShoeOfOrderDetailListOrderDetail.getOrderDetailList().remove(orderDetailListOrderDetail);
                    oldShoeOfOrderDetailListOrderDetail = em.merge(oldShoeOfOrderDetailListOrderDetail);
                }
            }
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            if (findShoe(shoe.getShoeid()) != null) {
                throw new PreexistingEntityException("Shoe " + shoe + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Shoe shoe) throws IllegalOrphanException, NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Shoe persistentShoe = em.find(Shoe.class, shoe.getShoeid());
            List<OrderDetail> orderDetailListOld = persistentShoe.getOrderDetailList();
            List<OrderDetail> orderDetailListNew = shoe.getOrderDetailList();
            List<String> illegalOrphanMessages = null;
            for (OrderDetail orderDetailListOldOrderDetail : orderDetailListOld) {
                if (!orderDetailListNew.contains(orderDetailListOldOrderDetail)) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("You must retain OrderDetail " + orderDetailListOldOrderDetail + " since its shoe field is not nullable.");
                }
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            List<OrderDetail> attachedOrderDetailListNew = new ArrayList<OrderDetail>();
            for (OrderDetail orderDetailListNewOrderDetailToAttach : orderDetailListNew) {
                orderDetailListNewOrderDetailToAttach = em.getReference(orderDetailListNewOrderDetailToAttach.getClass(), orderDetailListNewOrderDetailToAttach.getOrderDetailPK());
                attachedOrderDetailListNew.add(orderDetailListNewOrderDetailToAttach);
            }
            orderDetailListNew = attachedOrderDetailListNew;
            shoe.setOrderDetailList(orderDetailListNew);
            shoe = em.merge(shoe);
            for (OrderDetail orderDetailListNewOrderDetail : orderDetailListNew) {
                if (!orderDetailListOld.contains(orderDetailListNewOrderDetail)) {
                    Shoe oldShoeOfOrderDetailListNewOrderDetail = orderDetailListNewOrderDetail.getShoe();
                    orderDetailListNewOrderDetail.setShoe(shoe);
                    orderDetailListNewOrderDetail = em.merge(orderDetailListNewOrderDetail);
                    if (oldShoeOfOrderDetailListNewOrderDetail != null && !oldShoeOfOrderDetailListNewOrderDetail.equals(shoe)) {
                        oldShoeOfOrderDetailListNewOrderDetail.getOrderDetailList().remove(orderDetailListNewOrderDetail);
                        oldShoeOfOrderDetailListNewOrderDetail = em.merge(oldShoeOfOrderDetailListNewOrderDetail);
                    }
                }
            }
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                String id = shoe.getShoeid();
                if (findShoe(id) == null) {
                    throw new NonexistentEntityException("The shoe with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(String id) throws IllegalOrphanException, NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Shoe shoe;
            try {
                shoe = em.getReference(Shoe.class, id);
                shoe.getShoeid();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The shoe with id " + id + " no longer exists.", enfe);
            }
            List<String> illegalOrphanMessages = null;
            List<OrderDetail> orderDetailListOrphanCheck = shoe.getOrderDetailList();
            for (OrderDetail orderDetailListOrphanCheckOrderDetail : orderDetailListOrphanCheck) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Shoe (" + shoe + ") cannot be destroyed since the OrderDetail " + orderDetailListOrphanCheckOrderDetail + " in its orderDetailList field has a non-nullable shoe field.");
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            em.remove(shoe);
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Shoe> findShoeEntities() {
        return findShoeEntities(true, -1, -1);
    }

    public List<Shoe> findShoeEntities(int maxResults, int firstResult) {
        return findShoeEntities(false, maxResults, firstResult);
    }

    private List<Shoe> findShoeEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Shoe.class));
            Query q = em.createQuery(cq);
            if (!all) {
                q.setMaxResults(maxResults);
                q.setFirstResult(firstResult);
            }
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public Shoe findShoe(String id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Shoe.class, id);
        } finally {
            em.close();
        }
    }

    public int getShoeCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Shoe> rt = cq.from(Shoe.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
