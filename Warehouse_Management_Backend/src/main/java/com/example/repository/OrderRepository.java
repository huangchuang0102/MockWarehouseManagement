package com.example.repository;

import com.example.model.Orders;
import com.example.model.Products;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Repository
public interface OrderRepository extends JpaRepository<Orders, Integer> {
    @Query(value = "SELECT * FROM Orders o WHERE o.order_status = 'Shipped' OR o.order_status = 'Pending'",
    nativeQuery = true)
    List<Orders> findAllOrders();

    @Query(value = "SELECT * FROM orders o WHERE o.order_status = 'Pending'", nativeQuery = true)
    List<Orders> findPendingOrders();

    @Query(value = "SELECT * FROM orders o WHERE o.order_status = 'Shipped'", nativeQuery = true)
    List<Orders> findShippedOrders();

    // Updates Order row's Status to Shipped and DateShipped to the current Date/Time
    @Transactional
    @Modifying
    @Query(value = "UPDATE Orders SET Orders.Date_Shipped = NOW(), "+
            "Orders.order_status = 'Shipped' WHERE Orders.Order_Id = :orderId " +
            "AND Orders.Order_Status = 'Pending'",
    nativeQuery = true)
    void shipOrderById(@Param("orderId") int orderId);

    // Updates Product(s) in Order to have ShippedStock incremented by the quantity ordered
    // and decrements the ReservedStock by the quantity ordered
    @Transactional
    @Modifying
    @Query(value = "UPDATE Products " +
            "JOIN Order_Items ON Order_Items.UPC = Products.UPC " +
            "JOIN Orders ON Orders.Order_Id = Order_Items.Order_Id " +
            "SET Products.Shipped_Stock = Products.Shipped_Stock + Order_Items.Quantity, " +
            "Products.Reserved_Stock = Products.Reserved_Stock - Order_Items.Quantity " +
            "WHERE Orders.order_Id = :orderId ;",
    nativeQuery = true)
    void updateStockById(@Param("orderId") int orderId);

    // Getting count of all Orders with Status = "Shipped" - Edwin
    @Query("select count(*) from Orders o where o.order_status = 'Shipped'")
    int getTotalOrdersShipped();

    @Query(value = "SELECT *" +
            " FROM products p " +
            " INNER JOIN order_items os ON p.upc = os.upc " +
            " WHERE os.order_Id = :orderId", nativeQuery = true)
    List<Products>findItems(@Param("orderId") Integer orderId);
    
    @Query("select AVG(DATEDIFF(Date_Shipped, Date_Ordered)) from Orders where order_status = 'Shipped'")
    double getAvgTimeToShip();

    @Modifying
    @Transactional
    @Query(value = "UPDATE orders SET order_status = :status WHERE order_id = :orderId", nativeQuery = true)
    void updateStatus(@Param ("status") String status, @Param ("orderId") Integer id);
    
    @Query(value = "select SUM(DAYOFWEEK(orders.date_shipped)=1),"
    		+ "	   SUM(DAYOFWEEK(orders.date_shipped)=2),"
    		+ "	   SUM(DAYOFWEEK(orders.date_shipped)=3),"
    		+ "	   SUM(DAYOFWEEK(orders.date_shipped)=4),"
    		+ "       SUM(DAYOFWEEK(orders.date_shipped)=5),"
    		+ "       SUM(DAYOFWEEK(orders.date_shipped)=6),"
    		+ "       SUM(DAYOFWEEK(orders.date_shipped)=7)"
    		+ "       from orders"
    		+ "       where order_status = 'Shipped' and orders.date_shipped >= ((date_format(now(), \"%Y-%m-%d 00:00:00\") - interval dayofweek(date_format(now(), \"%Y-%m-%d 00:00:00\")) DAY) + interval 1 DAY) - interval :week WEEK"
    		+ "       and orders.date_shipped < (date_format(now(), \"%Y-%m-%d 23:59:59\") - interval dayofweek(date_format(now(), \"%Y-%m-%d 00:00:00\")) DAY) - interval :week - 1 WEEK"
    		+ "       order by DayOfWeek(orders.date_shipped) asc;", nativeQuery = true)
    List<Object> getWeeklyShipping(@Param("week") int week);

    @Query(value = "SELECT Orders.Order_ID AS 'order_id', Orders.order_status AS 'status', " +
            "Orders.date_ordered, Orders.date_shipped, " +
            "Addresses.recipient_name AS 'name', " +
            "CONCAT(Addresses.street, ' ', coalesce(Addresses.street2, '')) AS 'address1', " +
            "CONCAT(Addresses.city, ', ', Addresses.state, ' ', Addresses.zip) AS 'address2' " +
            "FROM Orders " +
            "JOIN Addresses ON Addresses.address_id = Orders.address_id " +
            "WHERE Orders.Order_Id = :orderId", nativeQuery = true)
    Map<String, Object> getOrderDetailsByOrderId(@Param("orderId") Integer orderId);
}
