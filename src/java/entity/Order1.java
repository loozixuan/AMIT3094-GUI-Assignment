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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
@Table(name = "ORDER")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Order1.findAll", query = "SELECT o FROM Order1 o")
    , @NamedQuery(name = "Order1.findById", query = "SELECT o FROM Order1 o WHERE o.id = :id")
    , @NamedQuery(name = "Order1.findByCustomerId", query = "SELECT o FROM Order1 o WHERE o.customerId = :customerId")
    , @NamedQuery(name = "Order1.findByDate", query = "SELECT o FROM Order1 o WHERE o.date = :date")
    , @NamedQuery(name = "Order1.findByTotalAmount", query = "SELECT o FROM Order1 o WHERE o.totalAmount = :totalAmount")
    , @NamedQuery(name = "Order1.findByDiscount", query = "SELECT o FROM Order1 o WHERE o.discount = :discount")
    , @NamedQuery(name = "Order1.findByStatus", query = "SELECT o FROM Order1 o WHERE o.status = :status")})
public class Order1 implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 12)
    @Column(name = "ID")
    private String id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 12)
    @Column(name = "CUSTOMER_ID")
    private String customerId;
    @Basic(optional = false)
    @NotNull
    @Column(name = "DATE")
    @Temporal(TemporalType.DATE)
    private Date date;
    @Basic(optional = false)
    @NotNull
    @Column(name = "TOTAL_AMOUNT")
    private double totalAmount;
    @Basic(optional = false)
    @NotNull
    @Column(name = "DISCOUNT")
    private double discount;
    @Size(max = 15)
    @Column(name = "STATUS")
    private String status;
    @JoinColumn(name = "PAYMENT_ID", referencedColumnName = "ID")
    @ManyToOne
    private Payment paymentId;
    @JoinColumn(name = "PROMOTION_CODE", referencedColumnName = "CODE")
    @ManyToOne
    private PromotionCode promotionCode;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "order1")
    private List<OrderDetail> orderDetailList;

    public Order1() {
    }

    public Order1(String id) {
        this.id = id;
    }

    public Order1(String id, String customerId, Date date, double totalAmount, double discount) {
        this.id = id;
        this.customerId = customerId;
        this.date = date;
        this.totalAmount = totalAmount;
        this.discount = discount;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCustomerId() {
        return customerId;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Payment getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(Payment paymentId) {
        this.paymentId = paymentId;
    }

    public PromotionCode getPromotionCode() {
        return promotionCode;
    }

    public void setPromotionCode(PromotionCode promotionCode) {
        this.promotionCode = promotionCode;
    }

    @XmlTransient
    public List<OrderDetail> getOrderDetailList() {
        return orderDetailList;
    }

    public void setOrderDetailList(List<OrderDetail> orderDetailList) {
        this.orderDetailList = orderDetailList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Order1)) {
            return false;
        }
        Order1 other = (Order1) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Order1[ id=" + id + " ]";
    }

}
