//
//  ServiceListAppTests.swift
//  ServiceListAppTests
//
//  Created by Purnasindhu-749 on 10/07/25.
//

import XCTest
@testable import ServicesSampleData

final class ServiceListAppTests: XCTestCase {

   
        func testGenerateServicesReturnsCorrectCount() {
            let expectedCount = 10
            let services = SampleData.generateServices(count: expectedCount)
            
            XCTAssertEqual(services.count, expectedCount, "Generated services count should match requested count.")
        }
        
        func testGeneratedServiceHasValidData() {
            let services = SampleData.generateServices(count: 1)
            guard let service = services.first else {
                XCTFail("No service returned")
                return
            }

            XCTAssertFalse(service.title.isEmpty, "Service title should not be empty")
            XCTAssertFalse(service.customerName.isEmpty, "Customer name should not be empty")
            XCTAssertFalse(service.description.isEmpty, "Description should not be empty")
            XCTAssertFalse(service.scheduledDate.isEmpty, "Scheduled date should not be empty")
        }
    }

