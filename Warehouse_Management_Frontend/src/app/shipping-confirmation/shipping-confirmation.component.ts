import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';
import { OrdersService } from '../orders.service';


@Component({
  selector: 'app-shipping-confirmation',
  templateUrl: './shipping-confirmation.component.html',
  styleUrls: ['./shipping-confirmation.component.css']
})                      
export class ShippingConfirmationComponent implements OnInit {

  order: any;
  id: any;
  customer: any;

  constructor(
    private route: ActivatedRoute,
    private orderService: OrdersService,
    private location: Location,
  ) {
    this.id = this.route.snapshot.params['id'];
  }


  ngOnInit(): void {
    this.getOrder();
    this.orderService.getAllOrders().subscribe(order =>{
      this.order = order;
    })
    this.getCustomerInfo();
  }

  getOrder(): void {
    // const id = Number(this.route.snapshot.paramMap.get('id'));
    this.orderService.getOrders(this.id)
    .subscribe(order => this.order = order);
  }

  getCustomerInfo(): void {
    this.orderService.getCustomerInfo(this.id)
    .subscribe(customer => this.customer = customer);
  }

  goBack(): void {
    this.location.back();
  }

  shipOrder(): void {
    this.orderService.shipOrder(this.id)
    .subscribe(customer => this.customer = customer);
    setTimeout(() =>
    {
      this.goBack();
    }, 1500);
    //   setTimeout(() => {
    //     this.orderService.shipOrder(this.id)
    //   .subscribe(customer => this.customer = customer);
    //   this.goBack();
    //     console.log('hello');
    // }, 1000);
  }
}


