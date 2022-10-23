package com.example.model;

import java.sql.Date;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Column;

@Table
@Entity
public class Orders {
    @Id
    @Column(name = "order_id")
    int order_id;

    @Column(name = "user_id")
    int user_id;

    @Column(name = "address_id")
    int address_id;

    @Column(name = "price")
    double price;

    @Column(name = "credit_card_id")
    int credit_card_id;

    // To change to different data type if it doesn't support the Time part?
    @Column(name = "date_ordered")
    Date date_ordered;

    @Column(name = "date_shipped")
    Date date_shipped;

    @Column(name = "order_status")
    String order_status;

    public Orders() {
        super();
    }

    public Orders(int order_id, int user_id, int address_id, double price, int credit_card_id,
                  Date date_ordered, Date date_shipped, String order_status) {
        super();
        this.order_id = order_id;
        this.user_id = user_id;
        this.address_id = address_id;
        this.price = price;
        this.credit_card_id = credit_card_id;
        this.date_ordered = date_ordered;
        this.date_shipped = date_shipped;
        this.order_status = order_status;
    }

    public int getOrderId() {
        return order_id;
    }

    public void setOrderId(int order_id) {
        this.order_id = order_id;
    }

    public int getUserId() {
        return user_id;
    }

    public void setUserId(int user_id) {
        this.user_id = user_id;
    }

    public int getAddressId() {
        return address_id;
    }

    public void setAddressId(int address_id) {
        this.address_id = address_id;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getCreditCardId() {
        return credit_card_id;
    }

    public void setCreditCardId(int credit_card_id) {
        this.credit_card_id = credit_card_id;
    }

    public Date getDateOrdered() {
        return date_ordered;
    }

    public void setDateOrdered(Date date_ordered) {
        this.date_ordered = date_ordered;
    }

    public Date getDateShipped() {
        return date_shipped;
    }

    public void setDateShipped(Date date_shipped) {
        this.date_shipped = date_shipped;
    }

    public String getOrderStatus() {
        return order_status;
    }

    public void setOrderStatus(String order_status) {
        this.order_status = order_status;
    }

    @Override
    public String toString() {
        return "Orders{" +
                "order_id=" + order_id +
                ", user_id=" + user_id +
                ", address_id=" + address_id +
                ", price=" + price +
                ", credit_card_id=" + credit_card_id +
                ", date_ordered=" + date_ordered +
                ", date_shipped=" + date_shipped +
                ", order_status='" + order_status + '\'' +
                '}';
    }
}
