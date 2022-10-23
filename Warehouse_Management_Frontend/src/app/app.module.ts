import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

//Import for pop-up dialog
// import { MatDialogModule } from '@angular/material/dialog';
// import { MatDialog } from '@angular/material/dialog';
import {HttpClientModule} from '@angular/common/http';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { SearchBarComponent } from './search-bar/search-bar.component';
import { TableComponent } from './table/table.component';
import { NavBarComponent } from './nav-bar/nav-bar.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { OrderDetailWindowComponent } from './order-detail-window/order-detail-window.component';
import { PendingComponent } from './pending/pending.component';
import { HomeComponent } from './home/home.component';
import { IndexComponent } from './index/index.component';
import { LoginComponent } from './login/login.component';
import { SocialLoginModule, SocialAuthServiceConfig } from 'angularx-social-login';
import { GoogleLoginProvider } from 'angularx-social-login';
import { MetricsComponent } from './metrics/metrics.component';
import { FilterMenuComponent } from './filter-menu/filter-menu.component';
import { ShippedOrdersComponent } from './shipped-orders/shipped-orders.component';
import { MatPaginatorModule } from '@angular/material/paginator';
import { MatTableModule } from '@angular/material/table';
import { MatSortModule } from '@angular/material/sort';
import { NgxPaginationModule } from 'ngx-pagination';
import { FormsModule } from '@angular/forms';
import { FilterOrderPipe } from './filter-order.pipe';
import { AuthGuard } from './shared/guard/auth.guard';
import { ShippingConfirmationComponent } from './shipping-confirmation/shipping-confirmation.component';



@NgModule({
  declarations: [
    AppComponent,
    SearchBarComponent,
    TableComponent,
  //  TotalOrderShippedComponent,
    NavBarComponent,
    // OrdersComponent,
    OrderDetailWindowComponent,
    PendingComponent,
    HomeComponent,
    IndexComponent,
    MetricsComponent,
    LoginComponent,
    FilterMenuComponent,
    ShippedOrdersComponent,
    FilterOrderPipe,
    ShippingConfirmationComponent
  ],

  imports: [
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    HttpClientModule,
    NgxPaginationModule,
    MatTableModule,
    MatSortModule,
    MatPaginatorModule,
    FormsModule,
    SocialLoginModule
  ],

  entryComponents: [
    OrderDetailWindowComponent,
    HttpClientModule,
    MatPaginatorModule,
    MatTableModule,
    MatSortModule,
    MatPaginatorModule
  ],
  providers: [ 
    AuthGuard,{
    provide: 'SocialAuthServiceConfig',
    useValue: {
      autoLogin: false,
      providers: [
        {
          id: GoogleLoginProvider.PROVIDER_ID,
          provider: new GoogleLoginProvider(
            '624796833023-clhjgupm0pu6vgga7k5i5bsfp6qp6egh.apps.googleusercontent.com'
          ),
        }
      ],
    } as SocialAuthServiceConfig,
  },],
  bootstrap: [AppComponent],
  
})

export class AppModule { }
