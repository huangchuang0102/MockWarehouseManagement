import { Component, OnInit } from '@angular/core';
import { Order } from '../order';

import { __param } from 'tslib';
import { OrdersService } from '../orders.service';

@Component({
  selector: 'app-table',
  templateUrl: './table.component.html',
  styleUrls: ['./table.component.css']
})
export class TableComponent implements OnInit {
  orders:any;
    constructor(private _ordersService: OrdersService) { }
  
    ngOnInit(): void {
      this._ordersService.getAllOrders().subscribe(orders =>{
        this.orders = orders;
      })
    }


  page: number = 1;
  count: number = 0;
  tableSize: number = 10;
  tableSizes: any = [3, 6, 9, 12];
  filterText = '';

  // getOrders(): void {
  //   this._ordersService.getPendingOrders()
  //   .subscribe(orders => this.orders = orders);
  // }

  onTableDataChange(event: any) {
    this.page = event;
  }
  onTableSizeChange(event: any): void {
    this.tableSize = event.target.value;
    this.page = 1;
  }

}
