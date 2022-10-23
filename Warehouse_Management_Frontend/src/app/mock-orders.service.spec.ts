import { TestBed } from '@angular/core/testing';

import { MockOrdersService } from './mock-orders.service';

describe('MockOrdersService', () => {
  let service: MockOrdersService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(MockOrdersService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
