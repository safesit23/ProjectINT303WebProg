/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import controller.exceptions.IllegalOrphanException;
import controller.exceptions.NonexistentEntityException;
import controller.exceptions.RollbackFailureException;
import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import model.Account;
import model.OrderDetail;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.transaction.UserTransaction;
import model.Orders;

/**
 *
 * @author jatawatsafe
 */
public class OrdersJpaController implements Serializable {

    public OrdersJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Orders orders) throws RollbackFailureException, Exception {
        if (orders.getOrderDetailList() == null) {
            orders.setOrderDetailList(new ArrayList<OrderDetail>());
        }
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Account accountid = orders.getAccountid();
            if (accountid != null) {
                accountid = em.getReference(accountid.getClass(), accountid.getAccountid());
                orders.setAccountid(accountid);
            }
            List<OrderDetail> attachedOrderDetailList = new ArrayList<OrderDetail>();
            for (OrderDetail orderDetailListOrderDetailToAttach : orders.getOrderDetailList()) {
                orderDetailListOrderDetailToAttach = em.getReference(orderDetailListOrderDetailToAttach.getClass(), orderDetailListOrderDetailToAttach.getOrderDetailPK());
                attachedOrderDetailList.add(orderDetailListOrderDetailToAttach);
            }
            orders.setOrderDetailList(attachedOrderDetailList);
            em.persist(orders);
            if (accountid != null) {
                accountid.getOrdersList().add(orders);
                accountid = em.merge(accountid);
            }
            for (OrderDetail orderDetailListOrderDetail : orders.getOrderDetailList()) {
                Orders oldOrdersOfOrderDetailListOrderDetail = orderDetailListOrderDetail.getOrders();
                orderDetailListOrderDetail.setOrders(orders);
                orderDetailListOrderDetail = em.merge(orderDetailListOrderDetail);
                if (oldOrdersOfOrderDetailListOrderDetail != null) {
                    oldOrdersOfOrderDetailListOrderDetail.getOrderDetailList().remove(orderDetailListOrderDetail);
                    oldOrdersOfOrderDetailListOrderDetail = em.merge(oldOrdersOfOrderDetailListOrderDetail);
                }
            }
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

    public void edit(Orders orders) throws IllegalOrphanException, NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Orders persistentOrders = em.find(Orders.class, orders.getOrderid());
            Account accountidOld = persistentOrders.getAccountid();
            Account accountidNew = orders.getAccountid();
            List<OrderDetail> orderDetailListOld = persistentOrders.getOrderDetailList();
            List<OrderDetail> orderDetailListNew = orders.getOrderDetailList();
            List<String> illegalOrphanMessages = null;
            for (OrderDetail orderDetailListOldOrderDetail : orderDetailListOld) {
                if (!orderDetailListNew.contains(orderDetailListOldOrderDetail)) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("You must retain OrderDetail " + orderDetailListOldOrderDetail + " since its orders field is not nullable.");
                }
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            if (accountidNew != null) {
                accountidNew = em.getReference(accountidNew.getClass(), accountidNew.getAccountid());
                orders.setAccountid(accountidNew);
            }
            List<OrderDetail> attachedOrderDetailListNew = new ArrayList<OrderDetail>();
            for (OrderDetail orderDetailListNewOrderDetailToAttach : orderDetailListNew) {
                orderDetailListNewOrderDetailToAttach = em.getReference(orderDetailListNewOrderDetailToAttach.getClass(), orderDetailListNewOrderDetailToAttach.getOrderDetailPK());
                attachedOrderDetailListNew.add(orderDetailListNewOrderDetailToAttach);
            }
            orderDetailListNew = attachedOrderDetailListNew;
            orders.setOrderDetailList(orderDetailListNew);
            orders = em.merge(orders);
            if (accountidOld != null && !accountidOld.equals(accountidNew)) {
                accountidOld.getOrdersList().remove(orders);
                accountidOld = em.merge(accountidOld);
            }
            if (accountidNew != null && !accountidNew.equals(accountidOld)) {
                accountidNew.getOrdersList().add(orders);
                accountidNew = em.merge(accountidNew);
            }
            for (OrderDetail orderDetailListNewOrderDetail : orderDetailListNew) {
                if (!orderDetailListOld.contains(orderDetailListNewOrderDetail)) {
                    Orders oldOrdersOfOrderDetailListNewOrderDetail = orderDetailListNewOrderDetail.getOrders();
                    orderDetailListNewOrderDetail.setOrders(orders);
                    orderDetailListNewOrderDetail = em.merge(orderDetailListNewOrderDetail);
                    if (oldOrdersOfOrderDetailListNewOrderDetail != null && !oldOrdersOfOrderDetailListNewOrderDetail.equals(orders)) {
                        oldOrdersOfOrderDetailListNewOrderDetail.getOrderDetailList().remove(orderDetailListNewOrderDetail);
                        oldOrdersOfOrderDetailListNewOrderDetail = em.merge(oldOrdersOfOrderDetailListNewOrderDetail);
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
                Integer id = orders.getOrderid();
                if (findOrders(id) == null) {
                    throw new NonexistentEntityException("The orders with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(Integer id) throws IllegalOrphanException, NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Orders orders;
            try {
                orders = em.getReference(Orders.class, id);
                orders.getOrderid();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The orders with id " + id + " no longer exists.", enfe);
            }
            List<String> illegalOrphanMessages = null;
            List<OrderDetail> orderDetailListOrphanCheck = orders.getOrderDetailList();
            for (OrderDetail orderDetailListOrphanCheckOrderDetail : orderDetailListOrphanCheck) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Orders (" + orders + ") cannot be destroyed since the OrderDetail " + orderDetailListOrphanCheckOrderDetail + " in its orderDetailList field has a non-nullable orders field.");
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            Account accountid = orders.getAccountid();
            if (accountid != null) {
                accountid.getOrdersList().remove(orders);
                accountid = em.merge(accountid);
            }
            em.remove(orders);
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

    public List<Orders> findOrdersEntities() {
        return findOrdersEntities(true, -1, -1);
    }

    public List<Orders> findOrdersEntities(int maxResults, int firstResult) {
        return findOrdersEntities(false, maxResults, firstResult);
    }

    private List<Orders> findOrdersEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Orders.class));
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

    public Orders findOrders(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Orders.class, id);
        } finally {
            em.close();
        }
    }

    public int getOrdersCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Orders> rt = cq.from(Orders.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
