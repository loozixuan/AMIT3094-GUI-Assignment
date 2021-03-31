/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Chrisann Lee
 */
@Entity
@Table(name = "ORDER_DETAIL")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "OrderDetail.findAll", query = "SELECT o FROM OrderDetail o")
    , @NamedQuery(name = "OrderDetail.findByProductId", query = "SELECT o FROM OrderDetail o WHERE o.orderDetailPK.productId = :productId")
    , @NamedQuery(name = "OrderDetail.findByOrderId", query = "SELECT o FROM OrderDetail o WHERE o.orderDetailPK.orderId = :orderId")
    , @NamedQuery(name = "OrderDetail.findByProductQuantity", query = "SELECT o FROM OrderDetail o WHERE o.productQuantity = :productQuantity")})
public class OrderDetail implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected OrderDetailPK orderDetailPK;
    @Basic(optional = false)
    @NotNull
    @Column(name = "PRODUCT_QUANTITY")
    private int productQuantity;
    @JoinColumn(name = "ORDER_ID", referencedColumnName = "ID", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private CustomerOrder customerOrder;
    @JoinColumn(name = "PRODUCT_ID", referencedColumnName = "ID", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Product product;

    public OrderDetail() {
    }

    public OrderDetail(OrderDetailPK orderDetailPK) {
        this.orderDetailPK = orderDetailPK;
    }

    public OrderDetail(OrderDetailPK orderDetailPK, int productQuantity) {
        this.orderDetailPK = orderDetailPK;
        this.productQuantity = productQuantity;
    }

    public OrderDetail(String productId, String orderId) {
        this.orderDetailPK = new OrderDetailPK(productId, orderId);
    }

    public OrderDetailPK getOrderDetailPK() {
        return orderDetailPK;
    }

    public void setOrderDetailPK(OrderDetailPK orderDetailPK) {
        this.orderDetailPK = orderDetailPK;
    }

    public int getProductQuantity() {
        return productQuantity;
    }

    public void setProductQuantity(int productQuantity) {
        this.productQuantity = productQuantity;
    }

    public CustomerOrder getCustomerOrder() {
        return customerOrder;
    }

    public void setCustomerOrder(CustomerOrder customerOrder) {
        this.customerOrder = customerOrder;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public double getSubtotal() {
        return this.product.getPrice() * this.productQuantity;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (orderDetailPK != null ? orderDetailPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof OrderDetail)) {
            return false;
        }
        OrderDetail other = (OrderDetail) object;
        if ((this.orderDetailPK == null && other.orderDetailPK != null) || (this.orderDetailPK != null && !this.orderDetailPK.equals(other.orderDetailPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.OrderDetail[ orderDetailPK=" + orderDetailPK + " ]";
    }

}
