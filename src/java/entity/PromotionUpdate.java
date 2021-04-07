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
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
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
 * @author user
 */
@Entity
@Table(name = "PROMOTION_UPDATE")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "PromotionUpdate.findAll", query = "SELECT p FROM PromotionUpdate p")
    , @NamedQuery(name = "PromotionUpdate.findByPromotionUpdateId", query = "SELECT p FROM PromotionUpdate p WHERE p.promotionUpdateId = :promotionUpdateId")
    , @NamedQuery(name = "PromotionUpdate.findByDate", query = "SELECT p FROM PromotionUpdate p WHERE p.date = :date")})
public class PromotionUpdate implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "PROMOTION_UPDATE_ID")
    private Integer promotionUpdateId;
    @Basic(optional = false)
    @NotNull
    @Column(name = "DATE")
    @Temporal(TemporalType.DATE)
    private Date date;
    @JoinColumn(name = "ADMIN_ID", referencedColumnName = "ID")
    @ManyToOne(optional = false)
    private Onlineadmin adminId;
    @JoinColumn(name = "PROMOTION_CODE", referencedColumnName = "CODE")
    @ManyToOne(optional = false)
    private PromotionCode promotionCode;

    public PromotionUpdate() {
    }

    public PromotionUpdate(Date date, Onlineadmin adminId, PromotionCode promotionCode) {
        this.date = date;
        this.adminId = adminId;
        this.promotionCode = promotionCode;
    }

    public PromotionUpdate(Integer promotionUpdateId) {
        this.promotionUpdateId = promotionUpdateId;
    }

    public PromotionUpdate(Integer promotionUpdateId, Date date) {
        this.promotionUpdateId = promotionUpdateId;
        this.date = date;
    }

    public Integer getPromotionUpdateId() {
        return promotionUpdateId;
    }

    public void setPromotionUpdateId(Integer promotionUpdateId) {
        this.promotionUpdateId = promotionUpdateId;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Onlineadmin getAdminId() {
        return adminId;
    }

    public void setAdminId(Onlineadmin adminId) {
        this.adminId = adminId;
    }

    public PromotionCode getPromotionCode() {
        return promotionCode;
    }

    public void setPromotionCode(PromotionCode promotionCode) {
        this.promotionCode = promotionCode;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (promotionUpdateId != null ? promotionUpdateId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof PromotionUpdate)) {
            return false;
        }
        PromotionUpdate other = (PromotionUpdate) object;
        if ((this.promotionUpdateId == null && other.promotionUpdateId != null) || (this.promotionUpdateId != null && !this.promotionUpdateId.equals(other.promotionUpdateId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.PromotionUpdate[ promotionUpdateId=" + promotionUpdateId + " ]";
    }
    
}
