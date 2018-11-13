/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author jatawatsafe
 */
@Entity
@Table(name = "VOUCHER")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Voucher.findAll", query = "SELECT v FROM Voucher v")
    , @NamedQuery(name = "Voucher.findByVoucherid", query = "SELECT v FROM Voucher v WHERE v.voucherid = :voucherid")
    , @NamedQuery(name = "Voucher.findByVouchervalue", query = "SELECT v FROM Voucher v WHERE v.vouchervalue = :vouchervalue")
    , @NamedQuery(name = "Voucher.findByMinspend", query = "SELECT v FROM Voucher v WHERE v.minspend = :minspend")
    , @NamedQuery(name = "Voucher.findByValidate", query = "SELECT v FROM Voucher v WHERE v.validate = :validate")
    , @NamedQuery(name = "Voucher.findByComment", query = "SELECT v FROM Voucher v WHERE v.comment = :comment")})
public class Voucher implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "VOUCHERID")
    private String voucherid;
    @Basic(optional = false)
    @NotNull
    @Column(name = "VOUCHERVALUE")
    private int vouchervalue;
    @Column(name = "MINSPEND")
    private Integer minspend;
    @Size(max = 5)
    @Column(name = "VALIDATE")
    private String validate;
    @Size(max = 40)
    @Column(name = "COMMENT")
    private String comment;

    public Voucher() {
    }

    public Voucher(String voucherid) {
        this.voucherid = voucherid;
    }

    public Voucher(String voucherid, int vouchervalue) {
        this.voucherid = voucherid;
        this.vouchervalue = vouchervalue;
    }

    public String getVoucherid() {
        return voucherid;
    }

    public void setVoucherid(String voucherid) {
        this.voucherid = voucherid;
    }

    public int getVouchervalue() {
        return vouchervalue;
    }

    public void setVouchervalue(int vouchervalue) {
        this.vouchervalue = vouchervalue;
    }

    public Integer getMinspend() {
        return minspend;
    }

    public void setMinspend(Integer minspend) {
        this.minspend = minspend;
    }

    public String getValidate() {
        return validate;
    }

    public void setValidate(String validate) {
        this.validate = validate;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (voucherid != null ? voucherid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Voucher)) {
            return false;
        }
        Voucher other = (Voucher) object;
        if ((this.voucherid == null && other.voucherid != null) || (this.voucherid != null && !this.voucherid.equals(other.voucherid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Voucher[ voucherid=" + voucherid + " ]";
    }
    
}
