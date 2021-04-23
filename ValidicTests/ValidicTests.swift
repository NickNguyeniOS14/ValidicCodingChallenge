//
//  ValidicTests.swift
//  ValidicTests
//
//  Created by Nick Nguyen on 4/23/21.
//

import XCTest
@testable import Validic

class ValidicTests: XCTestCase {

    func testForSomeResults() {
        let webService = NetworkService()
        let expectation = self.expectation(description: "Wait for results")

        webService.getJobsPercentage(language: "Python", city: "New York") { (jobs, error) in
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }

    func testSpeedOfTypicalRequest() {
        measure {
            let webService = NetworkService()
            let expectation = self.expectation(description: "Wait for results ")

            webService.getJobsPercentage(language: "Python", city: "New York") { (jobs, error) in
                expectation.fulfill()
            }
            wait(for: [expectation], timeout: 5)
        }
    }

    func testValidData() {
        
        let mockDataLoader = MockDataLoader(data: goodResultData, response: nil, error: nil)

        let mockWebService = NetworkService(dataLoader: mockDataLoader)

        let expectation = self.expectation(description: "Wait for results")

        mockWebService.getJobsPercentage(language: "Python", city: "New York", completion: { (jobs, error) in
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 10)

        XCTAssertEqual(mockWebService.jobs.count, 1)
        XCTAssertEqual(mockWebService.jobs.first?.company, "Thorlabs")
    }
}
