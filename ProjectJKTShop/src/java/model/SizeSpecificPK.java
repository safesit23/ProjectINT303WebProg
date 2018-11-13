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
public class SizeSpecificPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "SHOEID")
    private String shoeid;
    @Basic(optional = false)
    @NotNull
    @Column(name = "SHOESIZE")
    private int shoesize;

    public SizeSpecificPK() {
    }

    public SizeSpecificPK(String shoeid, int shoesize) {
        this.shoeid = shoeid;
        this.shoesize = shoesize;
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
        hash += (shoeid != null ? shoeid.hashCode() : 0);
        hash += (int) shoesize;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof SizeSpecificPK)) {
            return false;
        }
        SizeSpecificPK other = (SizeSpecificPK) object;
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
        return "model.SizeSpecificPK[ shoeid=" + shoeid + ", shoesize=" + shoesize + " ]";
    }
    
}
