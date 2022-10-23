import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { ShippedOrdersComponent } from './shipped-orders/shipped-orders.component';
import { OrderDetailWindowComponent } from './order-detail-window/order-detail-window.component';
//import { OrdersComponent } from './orders/orders.component';
// import { OrderComponent } from './order/order.component';
//import for popup
import { ShippingConfirmationComponent } from './shipping-confirmation/shipping-confirmation.component';
import { PendingComponent } from './pending/pending.component';
import { AuthGuard } from './shared/guard/auth.guard';
import { TableComponent } from './table/table.component';
import { LoginComponent } from './login/login.component';

const routes: Routes = [
  { path: '',redirectTo: '/pending', pathMatch:'full'},
  { path: 'home', component: HomeComponent, canActivate: [AuthGuard]},
  {path: 'order-detail/:id', component: OrderDetailWindowComponent, canActivate: [AuthGuard]},
  {path: 'table', component: TableComponent, canActivate: [AuthGuard]},
  {path:'all', component: TableComponent, canActivate: [AuthGuard]},
  {path:'login', component: LoginComponent},
  {path:'shipped', component: ShippedOrdersComponent, canActivate: [AuthGuard]},
  {path:'pending', component: PendingComponent, canActivate: [AuthGuard]},
  {path: 'confirm-ship/:id', component: ShippingConfirmationComponent, canActivate: [AuthGuard]},
  { path: '**', component: PendingComponent, canActivate: [AuthGuard] }

];


@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule { }
