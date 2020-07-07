package model.to;

import java.io.Serializable;
import java.sql.Timestamp;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class OrderInfo implements Serializable {

    @Id
    private long orderId;

    @Column(length = 100)
    private String orderStatus;

    @Column(length = 1000)
    private String shippingAddress;

    private Timestamp orderDate;

    private Timestamp shippingDate;

    @Column(length = 500)
    private String payment;

    @ManyToOne
    @JoinColumn(name = "cartId")
    private CartInfo cart;

    @ManyToOne
    @JoinColumn(name = "userName")
    private LoginInfo user;

    public long getOrderId() {
        return orderId;
    }

    public void setOrderId(long orderId) {
        this.orderId = orderId;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    public String getShippingAddress() {
        return shippingAddress;
    }

    public void setShippingAddress(String shippingAddress) {
        this.shippingAddress = shippingAddress;
    }

    public Timestamp getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Timestamp orderDate) {
        this.orderDate = orderDate;
    }

    public Timestamp getShippingDate() {
        return shippingDate;
    }

    public void setShippingDate(Timestamp shippingDate) {
        this.shippingDate = shippingDate;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public CartInfo getCart() {
        return cart;
    }

    public void setCart(CartInfo cart) {
        this.cart = cart;
    }

    public LoginInfo getUser() {
        return user;
    }

    public void setUser(LoginInfo user) {
        this.user = user;
    }

}
