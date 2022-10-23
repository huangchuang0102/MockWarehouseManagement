import { formatDate } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { OrdersService } from '../orders.service';

@Component({
  selector: 'app-metrics',
  templateUrl: './metrics.component.html',
  styleUrls: ['./metrics.component.css']
})
export class MetricsComponent implements OnInit {
  totalOrdersShipped: any;
  avgTime: any;
  topSellingItems: any;
  weeklyShipping = [];
  previousWeeklyShipping = [];
  totalWeeklyShipped: any;
  weekDates: string[] = [];
  previousWeekDates: string[] = [];

  constructor(private _ordersService: OrdersService) { }

  ngOnInit(): void {
    this.refreshData();
    this.getWeekDates();

    setInterval(() => {
      this.refreshData();
    }, 5000);
  }

  refreshData(): void {
    this.getTotalOrdersShipped();
    this.getAvgTimeToShip();
    this.getTopSellingItems();
    this.getWeeklyShipping();
  }

  getSum() : number {
    let sum = 0;
    for(let i = 0; i < this.weeklyShipping.length; i++) {
      sum += this.weeklyShipping[i];
    }
    return sum;
  }

  getWeekDates() {
    let currDayOfWeek = new Date().getDay();

    let startOfWeek = new Date();
    startOfWeek.setDate(startOfWeek.getDate() - currDayOfWeek - 7);
    
    for(let i = 0; i < 7; i++) {
      this.previousWeekDates[i] = (startOfWeek.getMonth() + 1) + "/" + startOfWeek.getDate();
      
      startOfWeek.setDate(startOfWeek.getDate() + 1);
    }

    for(let i = 0; i < 7; i++) {
      this.weekDates[i] = (startOfWeek.getMonth() + 1) + "/" + startOfWeek.getDate();
      
      startOfWeek.setDate(startOfWeek.getDate() + 1);
    }
  }

  getWeeklyShipping() {
    this._ordersService.getWeeklyShipping(1).subscribe(weeklyShipping => {
      this.previousWeeklyShipping = weeklyShipping[0];
    })

    this._ordersService.getWeeklyShipping(0).subscribe(weeklyShipping => {
      this.weeklyShipping = weeklyShipping[0];
    })
  }

  getTopSellingItems() {
    this._ordersService.getTopSellingItems().subscribe(topSellingItems => {
      this.topSellingItems = topSellingItems;
    });
  }

  getTotalOrdersShipped() {
    this._ordersService.getTotalOrdersShipped().subscribe(totalOrdersShipped => {
      this.totalOrdersShipped = totalOrdersShipped;
    })
  }

  getAvgTimeToShip() {
    this._ordersService.getAvgTimeToShipp().subscribe(avgTime => {
      this.avgTime = avgTime;
    })
  }
}
