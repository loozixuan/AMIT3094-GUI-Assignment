/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.io.Serializable;
import java.util.ArrayList;
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
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author user
 */
@Entity
@Table(name = "CUSTOMER_ORDER")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "CustomerOrder.findAll", query = "SELECT c FROM CustomerOrder c")
    , @NamedQuery(name = "CustomerOrder.findById", query = "SELECT c FROM CustomerOrder c WHERE c.id = :id")
    , @NamedQuery(name = "CustomerOrder.findByCustomerID", query = "SELECT c FROM CustomerOrder c WHERE c.customerId = :customer")
    , @NamedQuery(name = "CustomerOrder.findByDate", query = "SELECT c FROM CustomerOrder c WHERE c.date = :date")
    , @NamedQuery(name = "CustomerOrder.findByName", query = "SELECT c FROM CustomerOrder c WHERE c.name = :name")
    , @NamedQuery(name = "CustomerOrder.findByEmail", query = "SELECT c FROM CustomerOrder c WHERE c.email = :email")
    , @NamedQuery(name = "CustomerOrder.findByAddress", query = "SELECT c FROM CustomerOrder c WHERE c.address = :address")
    , @NamedQuery(name = "CustomerOrder.findByContactNumber", query = "SELECT c FROM CustomerOrder c WHERE c.contactNumber = :contactNumber")
    , @NamedQuery(name = "CustomerOrder.findByDelivery", query = "SELECT c FROM CustomerOrder c WHERE c.delivery = :delivery")
    , @NamedQuery(name = "CustomerOrder.findByStatus", query = "SELECT c FROM CustomerOrder c WHERE c.status = :status")})
public class CustomerOrder implements Serializable {

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "customerOrderId")
    private List<Payment> paymentList;
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 12)
    @Column(name = "ID")
    private String id;
    @Basic(optional = false)
    @NotNull
    @Column(name = "DATE")
    @Temporal(TemporalType.DATE)
    private Date date;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "NAME")
    private String name;
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @Size(max = 50)
    @Column(name = "EMAIL")
    private String email;
    @Size(max = 250)
    @Column(name = "ADDRESS")
    private String address;
    @Size(max = 15)
    @Column(name = "CONTACT_NUMBER")
    private String contactNumber;
    @Basic(optional = false)
    @NotNull
    @Column(name = "DELIVERY")
    private final double delivery = 12.00;
    @Size(max = 15)
    @Column(name = "STATUS")
    private String status;
    @JoinColumn(name = "CUSTOMER_ID", referencedColumnName = "ID")
    @ManyToOne(optional = false)
    private Customer customerId;
    @JoinColumn(name = "PROMOTION_CODE", referencedColumnName = "CODE")
    @ManyToOne
    private PromotionCode promotionCode;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "customerOrder")
    private List<OrderDetail> orderDetailList;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "customerOrderId")
    private Payment payment;

    public CustomerOrder() {
        
    }

    public CustomerOrder(String id) {
        this.id = id;
        this.status = "Order Confirmed";
    }
    
    public CustomerOrder(String id, Date date, String name, String email, String address, String contactNumber) {
        this.id = id;
        this.date = date;
        this.name = name;
        this.email = email;
        this.address = address;
        this.contactNumber = contactNumber;
        this.status = "Order Confirmed";
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getContactNumber() {
        return contactNumber;
    }

    public void setContactNumber(String contactNumber) {
        this.contactNumber = contactNumber;
    }

    public double getDelivery() {
        return delivery;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Customer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Customer customerId) {
        this.customerId = customerId;
    }

    @XmlTransient
    public Payment getPayment() {
        return payment;
    }

    public void setPayment(Payment paymentList) {
        this.payment = paymentList;
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
    
    public double getOrderSubtotal(){
        double subtotal = 0;
        for (int i = 0; i < orderDetailList.size(); i++) {
            subtotal += orderDetailList.get(i).getSubtotal();
        }
        return subtotal;
    }
    
    public double getDiscount(){
        if(this.promotionCode != null){
            return (this.getOrderSubtotal() + this.getDelivery()) * this.promotionCode.getDiscountRate();
        }else{
            return 0.00;
        }
    }
    
    public double getOrderTotal(){
        double total = this.getOrderSubtotal() + this.getDelivery();
        if(this.promotionCode != null){
            total -= this.getDiscount();
        }
        return total;
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
        if (!(object instanceof CustomerOrder)) {
            return false;
        }
        CustomerOrder other = (CustomerOrder) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.CustomerOrder[ id=" + id + " ]";
    }

    @XmlTransient
    public List<Payment> getPaymentList() {
        return paymentList;
    }

    public void setPaymentList(List<Payment> paymentList) {
        this.paymentList = paymentList;
    }
    
}
