package com.example.repository;

import com.example.model.Products;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface ProductRepository extends JpaRepository<Products, Integer> {
    @Query(value = "SELECT *" +
            " FROM products p " +
            " INNER JOIN orderitems os ON p.upc = os.upc " +
            " WHERE os.orderid = :orderId", nativeQuery = true)
    List<Products>findItems(@Param("orderId") Integer orderId);
    
    @Query(value = "select distinct p.prod_name, p.shipped_stock from order_items oi join products p on p.upc = oi.upc join orders o on o.order_id = oi.order_id order by p.shipped_stock desc limit 3", nativeQuery = true)
    List<Object> getTopSellingItems();

    @Query(value = "SELECT Products.UPC AS \"upc\", Products.brand, " +
            "Products.prod_name AS 'name', Order_Items.quantity AS 'Quantity' " +
            "FROM Order_Items " +
            "JOIN Products ON Products.UPC = Order_Items.UPC " +
            "WHERE Order_Items.Order_Id = :orderId", nativeQuery = true)
    List<Map<String, Object>> getProductsByOrderId(@Param("orderId") Integer orderId);
}
