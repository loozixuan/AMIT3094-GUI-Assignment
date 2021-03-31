/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.io.Serializable;
import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Chrisann Lee
 */
@Entity
@Table(name = "PROMOTION_CODE")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "PromotionCode.findAll", query = "SELECT p FROM PromotionCode p")
    , @NamedQuery(name = "PromotionCode.findByCode", query = "SELECT p FROM PromotionCode p WHERE p.code = :code")
    , @NamedQuery(name = "PromotionCode.findByDiscount", query = "SELECT p FROM PromotionCode p WHERE p.discount = :discount")
    , @NamedQuery(name = "PromotionCode.findByMinimumOrderAmount", query = "SELECT p FROM PromotionCode p WHERE p.minimumOrderAmount = :minimumOrderAmount")
    , @NamedQuery(name = "PromotionCode.findByStartDate", query = "SELECT p FROM PromotionCode p WHERE p.startDate = :startDate")
    , @NamedQuery(name = "PromotionCode.findByEnddateDate", query = "SELECT p FROM PromotionCode p WHERE p.enddateDate = :enddateDate")})
public class PromotionCode implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "DISCOUNT_RATE")
    private double discountRate;
    @Basic(optional = false)
    @NotNull
    @Column(name = "EXPIRED_DATE")
    @Temporal(TemporalType.DATE)
    private Date expiredDate;

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 12)
    @Column(name = "CODE")
    private String code;
    @Basic(optional = false)
    @NotNull
    @Column(name = "DISCOUNT")
    private double discount;
    @Basic(optional = false)
    @NotNull
    @Column(name = "MINIMUM_ORDER_AMOUNT")
    private double minimumOrderAmount;
    @Basic(optional = false)
    @NotNull
    @Column(name = "START_DATE")
    @Temporal(TemporalType.DATE)
    private Date startDate;
    @Basic(optional = false)
    @NotNull
    @Column(name = "ENDDATE_DATE")
    @Temporal(TemporalType.DATE)
    private Date enddateDate;
    @OneToMany(mappedBy = "promotionCode")
    private List<CustomerOrder> customerOrderList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "promotionCode1")
    private List<PromotionUpdate> promotionUpdateList;

    public PromotionCode() {
    }

    public PromotionCode(String code) {
        this.code = code;
    }

    public PromotionCode(String code, double discount, double minimumOrderAmount, Date startDate, Date enddateDate) {
        this.code = code;
        this.discount = discount;
        this.minimumOrderAmount = minimumOrderAmount;
        this.startDate = startDate;
        this.enddateDate = enddateDate;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public double getMinimumOrderAmount() {
        return minimumOrderAmount;
    }

    public void setMinimumOrderAmount(double minimumOrderAmount) {
        this.minimumOrderAmount = minimumOrderAmount;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEnddateDate() {
        return enddateDate;
    }

    public void setEnddateDate(Date enddateDate) {
        this.enddateDate = enddateDate;
    }

    @XmlTransient
    public List<CustomerOrder> getCustomerOrderList() {
        return customerOrderList;
    }

    public void setCustomerOrderList(List<CustomerOrder> customerOrderList) {
        this.customerOrderList = customerOrderList;
    }

    @XmlTransient
    public List<PromotionUpdate> getPromotionUpdateList() {
        return promotionUpdateList;
    }

    public void setPromotionUpdateList(List<PromotionUpdate> promotionUpdateList) {
        this.promotionUpdateList = promotionUpdateList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (code != null ? code.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof PromotionCode)) {
            return false;
        }
        PromotionCode other = (PromotionCode) object;
        if ((this.code == null && other.code != null) || (this.code != null && !this.code.equals(other.code))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.PromotionCode[ code=" + code + " ]";
    }

    public double getDiscountRate() {
        return discountRate;
    }

    public void setDiscountRate(double discountRate) {
        this.discountRate = discountRate;
    }

    public Date getExpiredDate() {
        return expiredDate;
    }

    public void setExpiredDate(Date expiredDate) {
        this.expiredDate = expiredDate;
    }

}
