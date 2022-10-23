import { Component, OnInit } from '@angular/core';
import { OrdersService } from '../orders.service';

@Component({
  selector: 'app-shipped-orders',
  templateUrl: './shipped-orders.component.html',
  styleUrls: ['./shipped-orders.component.css']
})
export class ShippedOrdersComponent implements OnInit {
  orders:any;
  filterText = '';
  page: number = 1;
  count: number = 0;
  tableSize: number = 10;
  tableSizes: any = [1, 3, 6, 9];
    constructor(private _ordersService: OrdersService) { }
  
    ngOnInit(): void {
      this._ordersService.getShippedOrders().subscribe(orders =>{
        this.orders = orders;
      })
    }

    onTableDataChange(event: any) {
      this.page = event;
    }
    onTableSizeChange(event: any): void {
      this.tableSize = event.target.value;
      this.page = 1;
    }

}
