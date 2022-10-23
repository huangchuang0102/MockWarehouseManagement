import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'filterOrder'
})
export class FilterOrderPipe implements PipeTransform {

  transform(value: {orderId:number, userId: number, addressId:number,
  price:number,creditCardId:number, dateOrdered:Date, dateShipped:Date, orderStatus:string}[], args: string): any {
    
    if(!value) return null;
    if(!args) return value;

    
    args = args.toLowerCase();
    return value.filter((order) => {
      return order.orderStatus.toLowerCase().includes(args) || order.dateOrdered.toString().includes(args) || order.orderId.toString().includes(args);

    })


   
  }

}
