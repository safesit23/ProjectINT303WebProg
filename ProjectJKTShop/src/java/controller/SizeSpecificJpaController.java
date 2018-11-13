/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import controller.exceptions.NonexistentEntityException;
import controller.exceptions.PreexistingEntityException;
import controller.exceptions.RollbackFailureException;
import java.io.Serializable;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import javax.transaction.UserTransaction;
import model.Shoe;
import model.SizeSpecific;
import model.SizeSpecificPK;

/**
 *
 * @author jatawatsafe
 */
public class SizeSpecificJpaController implements Serializable {

    public SizeSpecificJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(SizeSpecific sizeSpecific) throws PreexistingEntityException, RollbackFailureException, Exception {
        if (sizeSpecific.getSizeSpecificPK() == null) {
            sizeSpecific.setSizeSpecificPK(new SizeSpecificPK());
        }
        sizeSpecific.getSizeSpecificPK().setShoeid(sizeSpecific.getShoe().getShoeid());
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Shoe shoe = sizeSpecific.getShoe();
            if (shoe != null) {
                shoe = em.getReference(shoe.getClass(), shoe.getShoeid());
                sizeSpecific.setShoe(shoe);
            }
            em.persist(sizeSpecific);
            if (shoe != null) {
                shoe.getSizeSpecificList().add(sizeSpecific);
                shoe = em.merge(shoe);
            }
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            if (findSizeSpecific(sizeSpecific.getSizeSpecificPK()) != null) {
                throw new PreexistingEntityException("SizeSpecific " + sizeSpecific + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(SizeSpecific sizeSpecific) throws NonexistentEntityException, RollbackFailureException, Exception {
        sizeSpecific.getSizeSpecificPK().setShoeid(sizeSpecific.getShoe().getShoeid());
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            SizeSpecific persistentSizeSpecific = em.find(SizeSpecific.class, sizeSpecific.getSizeSpecificPK());
            Shoe shoeOld = persistentSizeSpecific.getShoe();
            Shoe shoeNew = sizeSpecific.getShoe();
            if (shoeNew != null) {
                shoeNew = em.getReference(shoeNew.getClass(), shoeNew.getShoeid());
                sizeSpecific.setShoe(shoeNew);
            }
            sizeSpecific = em.merge(sizeSpecific);
            if (shoeOld != null && !shoeOld.equals(shoeNew)) {
                shoeOld.getSizeSpecificList().remove(sizeSpecific);
                shoeOld = em.merge(shoeOld);
            }
            if (shoeNew != null && !shoeNew.equals(shoeOld)) {
                shoeNew.getSizeSpecificList().add(sizeSpecific);
                shoeNew = em.merge(shoeNew);
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
                SizeSpecificPK id = sizeSpecific.getSizeSpecificPK();
                if (findSizeSpecific(id) == null) {
                    throw new NonexistentEntityException("The sizeSpecific with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(SizeSpecificPK id) throws NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            SizeSpecific sizeSpecific;
            try {
                sizeSpecific = em.getReference(SizeSpecific.class, id);
                sizeSpecific.getSizeSpecificPK();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The sizeSpecific with id " + id + " no longer exists.", enfe);
            }
            Shoe shoe = sizeSpecific.getShoe();
            if (shoe != null) {
                shoe.getSizeSpecificList().remove(sizeSpecific);
                shoe = em.merge(shoe);
            }
            em.remove(sizeSpecific);
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

    public List<SizeSpecific> findSizeSpecificEntities() {
        return findSizeSpecificEntities(true, -1, -1);
    }

    public List<SizeSpecific> findSizeSpecificEntities(int maxResults, int firstResult) {
        return findSizeSpecificEntities(false, maxResults, firstResult);
    }

    private List<SizeSpecific> findSizeSpecificEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(SizeSpecific.class));
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

    public SizeSpecific findSizeSpecific(SizeSpecificPK id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(SizeSpecific.class, id);
        } finally {
            em.close();
        }
    }

    public int getSizeSpecificCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<SizeSpecific> rt = cq.from(SizeSpecific.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
