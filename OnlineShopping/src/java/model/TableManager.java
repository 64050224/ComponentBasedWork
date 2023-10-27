package model;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */


import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

/**
 *
 * @author AreYouG
 */
public class TableManager {

    public static int postCartDetail(String[] ids, String[] qty){
        //AtomicInteger cartCounter = new AtomicInteger(getNextCartIdFromDatabase());
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("OnlineShoppingPU");
        EntityManager em = emf.createEntityManager();
        int cartId = getNextCartIdFromDatabase();
        em.getTransaction().begin();
        try {
            for(int i = 0; i < ids.length; i ++){
                ShoppingcartPK pk = new ShoppingcartPK(cartId,Integer.parseInt(ids[i]));
                Shoppingcart cart = new Shoppingcart(pk, Integer.valueOf(qty[i]));
                em.persist(cart);
            }
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
        } finally {
            em.close();
        }
        return cartId;
    }

    public static int getNextCartIdFromDatabase(){
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("OnlineShoppingPU");
        EntityManager em = emf.createEntityManager();
        Query query = em.createNativeQuery("SELECT MAX(cart_id) FROM Shoppingcart");
        int maxId;
        try{
            maxId = (int) query.getSingleResult() +1;
        }catch(Exception e){
            maxId = 1;
        }
        
        return maxId;
    }
    public static List<Products> getAllProducts(){
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("OnlineShoppingPU");
        EntityManager em = emf.createEntityManager();
        Query query = em.createNamedQuery("Products.findAll");
        List<Products> list = (List<Products>) query.getResultList();
        em.close();
        return list;
    }
    public static Products getProductById(int Id){
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("OnlineShoppingPU");
        EntityManager em = emf.createEntityManager();
        Query query = em.createNamedQuery("Products.findById");
        query.setParameter("id", Id);
        Products product = (Products)query.getSingleResult();
        em.close();
        return product;
    }
   
}
