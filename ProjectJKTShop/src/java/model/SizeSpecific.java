/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author jatawatsafe
 */
@Entity
@Table(name = "SIZESPECIFIC")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "SizeSpecific.findAll", query = "SELECT s FROM SizeSpecific s")
    , @NamedQuery(name = "SizeSpecific.findByShoeid", query = "SELECT s FROM SizeSpecific s WHERE s.sizeSpecificPK.shoeid = :shoeid")
    , @NamedQuery(name = "SizeSpecific.findByShoesize", query = "SELECT s FROM SizeSpecific s WHERE s.sizeSpecificPK.shoesize = :shoesize")})
public class SizeSpecific implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected SizeSpecificPK sizeSpecificPK;
    @JoinColumn(name = "SHOEID", referencedColumnName = "SHOEID", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Shoe shoe;

    public SizeSpecific() {
    }

    public SizeSpecific(SizeSpecificPK sizeSpecificPK) {
        this.sizeSpecificPK = sizeSpecificPK;
    }

    public SizeSpecific(String shoeid, int shoesize) {
        this.sizeSpecificPK = new SizeSpecificPK(shoeid, shoesize);
    }

    public SizeSpecificPK getSizeSpecificPK() {
        return sizeSpecificPK;
    }

    public void setSizeSpecificPK(SizeSpecificPK sizeSpecificPK) {
        this.sizeSpecificPK = sizeSpecificPK;
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
        hash += (sizeSpecificPK != null ? sizeSpecificPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof SizeSpecific)) {
            return false;
        }
        SizeSpecific other = (SizeSpecific) object;
        if ((this.sizeSpecificPK == null && other.sizeSpecificPK != null) || (this.sizeSpecificPK != null && !this.sizeSpecificPK.equals(other.sizeSpecificPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.SizeSpecific[ sizeSpecificPK=" + sizeSpecificPK + " ]";
    }
    
}
