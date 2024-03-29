/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.math.BigDecimal;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author jatawatsafe
 */
@Entity
@Table(name = "ORDERDETAIL")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "OrderDetail.findAll", query = "SELECT o FROM OrderDetail o")
    , @NamedQuery(name = "OrderDetail.findByOrderid", query = "SELECT o FROM OrderDetail o WHERE o.orderDetailPK.orderid = :orderid")
    , @NamedQuery(name = "OrderDetail.findByShoeid", query = "SELECT o FROM OrderDetail o WHERE o.orderDetailPK.shoeid = :shoeid")
    , @NamedQuery(name = "OrderDetail.findByShoesize", query = "SELECT o FROM OrderDetail o WHERE o.orderDetailPK.shoesize = :shoesize")
    , @NamedQuery(name = "OrderDetail.findByQuantity", query = "SELECT o FROM OrderDetail o WHERE o.quantity = :quantity")
    , @NamedQuery(name = "OrderDetail.findByPrice", query = "SELECT o FROM OrderDetail o WHERE o.price = :price")})
public class OrderDetail implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected OrderDetailPK orderDetailPK;
    @Basic(optional = false)
    @NotNull
    @Column(name = "QUANTITY")
    private int quantity;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Column(name = "PRICE")
    private BigDecimal price;
    @JoinColumn(name = "ORDERID", referencedColumnName = "ORDERID", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Orders orders;
    @JoinColumn(name = "SHOEID", referencedColumnName = "SHOEID", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Shoe shoe;

    public OrderDetail() {
    }

    public OrderDetail(OrderDetailPK orderDetailPK) {
        this.orderDetailPK = orderDetailPK;
    }

    public OrderDetail(Orders order,Shoe shoe, int quantity, BigDecimal price, int size) {
        this.orders = order;
        this.shoe = shoe;
        this.quantity = quantity;
        this.price = price;
        this.orderDetailPK = new OrderDetailPK(order.getOrderid(), shoe.getShoeid(), size);
    }

    public OrderDetail(int orderid, String shoeid, int shoesize) {
        this.orderDetailPK = new OrderDetailPK(orderid, shoeid, shoesize);
    }
    
    public OrderDetail(int orderid, String shoeid, int shoesize,int quantity, double price) {
        this.orderDetailPK = new OrderDetailPK(orderid, shoeid, shoesize);
        this.quantity = quantity;
        this.price = BigDecimal.valueOf(price);
    }

    public OrderDetailPK getOrderDetailPK() {
        return orderDetailPK;
    }

    public void setOrderDetailPK(OrderDetailPK orderDetailPK) {
        this.orderDetailPK = orderDetailPK;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Orders getOrders() {
        return orders;
    }

    public void setOrders(Orders orders) {
        this.orders = orders;
    }

    public Shoe getShoe() {
        return shoe;
    }

    public void setShoe(Shoe shoe) {
        this.shoe = shoe;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (orderDetailPK != null ? orderDetailPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof OrderDetail)) {
            return false;
        }
        OrderDetail other = (OrderDetail) object;
        if ((this.orderDetailPK == null && other.orderDetailPK != null) || (this.orderDetailPK != null && !this.orderDetailPK.equals(other.orderDetailPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "OrderDetail [ orderDetailPK=" + orderDetailPK + ", Quantity: "+quantity+", Price="+price+"]";
    }
    
}
