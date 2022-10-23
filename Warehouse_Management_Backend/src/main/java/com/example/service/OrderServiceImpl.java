package com.example.service;

import com.example.model.Orders;
import com.example.model.Products;
import com.example.repository.OrderRepository;
import com.example.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.Optional;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    OrderRepository orderRepo;

    @Autowired
    ProductRepository productRepo;

    @Override
    public List<Orders> getAllOrders() {
        // Gather all Orders in a list with OrderStatus marked as "Shipped" or "Pending" (NOT "Canceled")
        try {
            List<Orders> orderList = orderRepo.findAllOrders();
            if(!orderList.isEmpty())
                return orderList;
        } catch(Exception e){
            System.out.println(e);
        }
        return null;
    }

    @Override
    public Optional<Orders> getOrderById(int orderId) {
        try {
            Optional<Orders> order = orderRepo.findById(orderId);
            if(order.isPresent())
                return order;
        } catch(Exception e) {
            System.out.println(e);
        }
        return Optional.empty();
    }

    @Override
    public boolean shipOrderById(int orderId) {
        orderRepo.shipOrderById(orderId);
        orderRepo.updateStockById(orderId);
        return orderRepo.findById(orderId).get().getOrderStatus().equals("Shipped");
    }

    // Pulled from Chuang's work
    @Override
    public List<Orders> getPendingOrders() {
        //Gather all the entries for department from the database and return as a list
        try{
            List<Orders> oList = orderRepo.findPendingOrders();
            if(!oList.isEmpty())
                return oList;
        }catch(Exception exc){
            System.out.println(exc);
        }
        return null;
    }

    @Override
    public List<Orders> getShippedOrders() {
        // Retrieves all Orders with status marked as "Shipped" and returns a list.
        try{
            List<Orders> oList = orderRepo.findShippedOrders();
            if(!oList.isEmpty())
                return oList;
        }catch(Exception exc){
            System.out.println(exc);
        }
        return null;
    }


//    @Override
//    public ResponseEntity<Orders> update(int id, String status) {
//        try{
//            orderRepo.updateStatus(status, id);
//            Optional<Orders> order = orderRepo.findById(id);
//;            return new ResponseEntity<>(order.get(), HttpStatus.ACCEPTED);
//        }catch(Exception exc){
//            System.out.println(exc);
//        }
//        return new ResponseEntity<>(HttpStatus.NOT_FOUND);
//    }

//    @Override
//    public List<Products> getItems(int orderId) {
//        try {
//            List<Products> iList = productRepo.findItems(orderId);
//            if (!iList.isEmpty())
//                return iList;
//        } catch (Exception exc) {
//            System.out.println(exc);
//        }
//        return null;
//    }

    @Override
    public Map<String, Object> getOrderDetails(int orderId) {
        try {
            Map<String, Object> oList = orderRepo.getOrderDetailsByOrderId(orderId);
            if(!oList.isEmpty()) {
                return oList;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public List<Map<String, Object>> getProductsByOrderId(int orderId) {
        try {
            List<Map<String, Object>> pList = productRepo.getProductsByOrderId(orderId);
            if(!pList.isEmpty()) {
                return pList;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    // Pulled from Edwin's work
    @Override
    public int getTotalOrdersShipped() {
        try {
            return orderRepo.getTotalOrdersShipped();
        } catch (Exception e) {
            System.out.println(e);
        }

        return -1;
    }

	@Override
	public double getAvgTimeToShip() {
		try {
			double avgTime = Double.parseDouble(String.format("%.2f", orderRepo.getAvgTimeToShip()));
			return avgTime;
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return -1;
	}

	@Override
	public List<Object> getTopSellingItems() {
		try {
			List<Object> topSelling = productRepo.getTopSellingItems();
			if(!topSelling.isEmpty()) {
				return topSelling;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
	}

	@Override
	public List<Object> getWeeklyShipping(int week) {
		try {
			List<Object> weeklyShipping = orderRepo.getWeeklyShipping(week);
			if(!weeklyShipping.isEmpty()) {
				return weeklyShipping;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
	}
    
}
