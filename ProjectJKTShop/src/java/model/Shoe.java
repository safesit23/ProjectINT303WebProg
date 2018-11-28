/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author jatawatsafe
 */
@Entity
@Table(name = "SHOE")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Shoe.findAll", query = "SELECT s FROM Shoe s")
    , @NamedQuery(name = "Shoe.findByShoeid", query = "SELECT s FROM Shoe s WHERE s.shoeid = :shoeid")
    , @NamedQuery(name = "Shoe.findByShoename", query = "SELECT s FROM Shoe s WHERE upper(s.shoename) like :shoename")
    , @NamedQuery(name = "Shoe.findByColor", query = "SELECT s FROM Shoe s WHERE s.color = :color")
    , @NamedQuery(name = "Shoe.findByShoetype", query = "SELECT s FROM Shoe s WHERE s.shoetype = :shoetype")
    , @NamedQuery(name = "Shoe.findByShoetype2", query = "SELECT s FROM Shoe s WHERE upper(s.shoetype2) like :shoetype2")
    , @NamedQuery(name = "Shoe.findByBrand", query = "SELECT s FROM Shoe s WHERE lower(s.brand)like :brand")
    , @NamedQuery(name = "Shoe.findByPrice", query = "SELECT s FROM Shoe s WHERE s.price = :price")})
public class Shoe implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "SHOEID")
    private String shoeid;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 70)
    @Column(name = "SHOENAME")
    private String shoename;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 15)
    @Column(name = "COLOR")
    private String color;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "SHOETYPE")
    private String shoetype;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "SHOETYPE2")
    private String shoetype2;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "BRAND")
    private String brand;
    @Basic(optional = false)
    @NotNull
    @Column(name = "PRICE")
    private int price;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "shoe")
    private List<OrderDetail> orderDetailList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "shoe")
    private List<SizeSpecific> sizeSpecificList;

    public Shoe() {
    }

    public Shoe(String shoeid) {
        this.shoeid = shoeid;
    }

    public Shoe(String shoeid, String shoename, String color, String shoetype, String shoetype2, String brand, int price) {
        this.shoeid = shoeid;
        this.shoename = shoename;
        this.color = color;
        this.shoetype = shoetype;
        this.shoetype2 = shoetype2;
        this.brand = brand;
        this.price = price;
    }

    public String getShoeid() {
        return shoeid;
    }

    public void setShoeid(String shoeid) {
        this.shoeid = shoeid;
    }

    public String getShoename() {
        return shoename;
    }

    public void setShoename(String shoename) {
        this.shoename = shoename;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getShoetype() {
        return shoetype;
    }

    public void setShoetype(String shoetype) {
        this.shoetype = shoetype;
    }

    public String getShoetype2() {
        return shoetype2;
    }

    public void setShoetype2(String shoetype2) {
        this.shoetype2 = shoetype2;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    @XmlTransient
    public List<OrderDetail> getOrderDetailList() {
        return orderDetailList;
    }

    public void setOrderDetailList(List<OrderDetail> orderDetailList) {
        this.orderDetailList = orderDetailList;
    }

    @XmlTransient
    public List<SizeSpecific> getSizeSpecificList() {
        return sizeSpecificList;
    }

    public void setSizeSpecificList(List<SizeSpecific> sizeSpecificList) {
        this.sizeSpecificList = sizeSpecificList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (shoeid != null ? shoeid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Shoe)) {
            return false;
        }
        Shoe other = (Shoe) object;
        if ((this.shoeid == null && other.shoeid != null) || (this.shoeid != null && !this.shoeid.equals(other.shoeid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Shoe[ shoeid=" + shoeid + " ]";
    }
    
}
