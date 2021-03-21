/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Chrisann Lee
 */
@Entity
@Table(name = "PROMOTION_UPDATE")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "PromotionUpdate.findAll", query = "SELECT p FROM PromotionUpdate p")
    , @NamedQuery(name = "PromotionUpdate.findByPromotionCode", query = "SELECT p FROM PromotionUpdate p WHERE p.promotionUpdatePK.promotionCode = :promotionCode")
    , @NamedQuery(name = "PromotionUpdate.findByAdminId", query = "SELECT p FROM PromotionUpdate p WHERE p.promotionUpdatePK.adminId = :adminId")
    , @NamedQuery(name = "PromotionUpdate.findByDate", query = "SELECT p FROM PromotionUpdate p WHERE p.date = :date")})
public class PromotionUpdate implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected PromotionUpdatePK promotionUpdatePK;
    @Basic(optional = false)
    @NotNull
    @Column(name = "DATE")
    @Temporal(TemporalType.DATE)
    private Date date;
    @JoinColumn(name = "ADMIN_ID", referencedColumnName = "ID", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Onlineadmin onlineadmin;
    @JoinColumn(name = "PROMOTION_CODE", referencedColumnName = "CODE", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private PromotionCode promotionCode1;

    public PromotionUpdate() {
    }

    public PromotionUpdate(PromotionUpdatePK promotionUpdatePK) {
        this.promotionUpdatePK = promotionUpdatePK;
    }

    public PromotionUpdate(PromotionUpdatePK promotionUpdatePK, Date date) {
        this.promotionUpdatePK = promotionUpdatePK;
        this.date = date;
    }

    public PromotionUpdate(String promotionCode, String adminId) {
        this.promotionUpdatePK = new PromotionUpdatePK(promotionCode, adminId);
    }

    public PromotionUpdatePK getPromotionUpdatePK() {
        return promotionUpdatePK;
    }

    public void setPromotionUpdatePK(PromotionUpdatePK promotionUpdatePK) {
        this.promotionUpdatePK = promotionUpdatePK;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Onlineadmin getOnlineadmin() {
        return onlineadmin;
    }

    public void setOnlineadmin(Onlineadmin onlineadmin) {
        this.onlineadmin = onlineadmin;
    }

    public PromotionCode getPromotionCode1() {
        return promotionCode1;
    }

    public void setPromotionCode1(PromotionCode promotionCode1) {
        this.promotionCode1 = promotionCode1;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (promotionUpdatePK != null ? promotionUpdatePK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof PromotionUpdate)) {
            return false;
        }
        PromotionUpdate other = (PromotionUpdate) object;
        if ((this.promotionUpdatePK == null && other.promotionUpdatePK != null) || (this.promotionUpdatePK != null && !this.promotionUpdatePK.equals(other.promotionUpdatePK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.PromotionUpdate[ promotionUpdatePK=" + promotionUpdatePK + " ]";
    }

}
