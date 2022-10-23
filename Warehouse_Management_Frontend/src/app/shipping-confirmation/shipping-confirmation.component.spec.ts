import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ShippingConfirmationComponent } from './shipping-confirmation.component';

describe('ShippingConfirmationComponent', () => {
  let component: ShippingConfirmationComponent;
  let fixture: ComponentFixture<ShippingConfirmationComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ShippingConfirmationComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ShippingConfirmationComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
