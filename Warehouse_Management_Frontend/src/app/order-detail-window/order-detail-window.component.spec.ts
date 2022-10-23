import { ComponentFixture, TestBed } from '@angular/core/testing';

import { OrderDetailWindowComponent } from './order-detail-window.component';

describe('OrderDetailWindowComponent', () => {
  let component: OrderDetailWindowComponent;
  let fixture: ComponentFixture<OrderDetailWindowComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ OrderDetailWindowComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(OrderDetailWindowComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
