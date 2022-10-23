// This is the order interface
//id = order id
//name = item name
//import { Date } from "@angular/common";
import { Item } from './item';

//description = other order info (shipping address, shipping time, etc.)
export interface Order {
    //Order ID
    order_id: number;
    /**
     * NEED TO FIX THIS -- Need to take in an item object here
     * 
     */
    item_info: Item[];
    //Order status
    order_status: string;
    //Order created
    order_created: string;
    //Order completed
    order_completed: string;
    //Customer info
}