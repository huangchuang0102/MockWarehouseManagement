// Creating this mock list of items to test the front end
import { Order } from './order';

export const ORDERS: Order[] = [
    {   
        order_id: 1234556, 
        itemInfo: 'item1, item2, item3',
        order_status: 'Pending',
        order_created: '09-15-2022',
        order_completed: '09-20-2022'
    },

    {   
        order_id: 126783, 
        itemInfo: 'item1, item2',
        order_status: 'Shipped',
        order_created: '01-08-1997',
        order_completed: '01-08-1997'
    },

    {   
        order_id: 687364, 
        itemInfo: 'item1',
        order_status: 'Shipped',
        order_created: '05-22-2011',
        order_completed: '05-26-2011'
    },

    {
        order_id: 321, 
        itemInfo: 'item1',
        order_status: 'Shipped',
        order_created: '09-01-2021',
        order_completed: '09-04-2021'
    },

    {
        order_id: 1234, 
        itemInfo: 'item1',
        order_status: 'Shipped',
        order_created: '05-20-2021',
        order_completed: '05-23-2021'
    }
];