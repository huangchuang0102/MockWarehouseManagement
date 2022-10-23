import { Injectable } from '@angular/core';
import { Order } from './order';
import { ORDERS } from './mock-orders';
import { Observable, of } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class MockOrdersService {

  constructor() { }

  getOrders(): Observable<Order[]> {
    const orders = of(ORDERS);
    return orders;
  }

  getOrder(order_id: number): Observable<Order> {
    /**
     * Add error handling here for finding item order ID
     */
    const order = ORDERS.find(o => o.order_id == order_id)!;
    return of(order);
  }

}
