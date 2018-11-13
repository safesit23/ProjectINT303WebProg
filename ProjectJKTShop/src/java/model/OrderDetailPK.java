/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author jatawatsafe
 */
@Embeddable
public class OrderDetailPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "ORDERID")
    private int orderid;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "SHOEID")
    private String shoeid;
    @Basic(optional = false)
    @NotNull
    @Column(name = "SHOESIZE")
    private int shoesize;

    public OrderDetailPK() {
    }

    public OrderDetailPK(int orderid, String shoeid, int shoesize) {
        this.orderid = orderid;
        this.shoeid = shoeid;
        this.shoesize = shoesize;
    }

    public int getOrderid() {
        return orderid;
    }

    public void setOrderid(int orderid) {
        this.orderid = orderid;
    }

    public String getShoeid() {
        return shoeid;
    }

    public void setShoeid(String shoeid) {
        this.shoeid = shoeid;
    }

    public int getShoesize() {
        return shoesize;
    }

    public void setShoesize(int shoesize) {
        this.shoesize = shoesize;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) orderid;
        hash += (shoeid != null ? shoeid.hashCode() : 0);
        hash += (int) shoesize;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof OrderDetailPK)) {
            return false;
        }
        OrderDetailPK other = (OrderDetailPK) object;
        if (this.orderid != other.orderid) {
            return false;
        }
        if ((this.shoeid == null && other.shoeid != null) || (this.shoeid != null && !this.shoeid.equals(other.shoeid))) {
            return false;
        }
        if (this.shoesize != other.shoesize) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.OrderDetailPK[ orderid=" + orderid + ", shoeid=" + shoeid + ", shoesize=" + shoesize + " ]";
    }
    
}
