/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author zixua
 */
@Embeddable
public class PromotionUpdatePK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 12)
    @Column(name = "PROMOTION_CODE")
    private String promotionCode;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 12)
    @Column(name = "ADMIN_ID")
    private String adminId;

    public PromotionUpdatePK() {
    }

    public PromotionUpdatePK(String promotionCode, String adminId) {
        this.promotionCode = promotionCode;
        this.adminId = adminId;
    }

    public String getPromotionCode() {
        return promotionCode;
    }

    public void setPromotionCode(String promotionCode) {
        this.promotionCode = promotionCode;
    }

    public String getAdminId() {
        return adminId;
    }

    public void setAdminId(String adminId) {
        this.adminId = adminId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (promotionCode != null ? promotionCode.hashCode() : 0);
        hash += (adminId != null ? adminId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof PromotionUpdatePK)) {
            return false;
        }
        PromotionUpdatePK other = (PromotionUpdatePK) object;
        if ((this.promotionCode == null && other.promotionCode != null) || (this.promotionCode != null && !this.promotionCode.equals(other.promotionCode))) {
            return false;
        }
        if ((this.adminId == null && other.adminId != null) || (this.adminId != null && !this.adminId.equals(other.adminId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.PromotionUpdatePK[ promotionCode=" + promotionCode + ", adminId=" + adminId + " ]";
    }

}
