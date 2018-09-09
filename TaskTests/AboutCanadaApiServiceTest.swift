//
//  AboutCanadaApiServiceTest.swift
//  TaskTests
//
//  Created by Harshavardhana Reddy on 09/09/18.
//  Copyright © 2018 Sandeep. All rights reserved.
//

import Foundation
@testable import Task
import XCTest

class AboutCanadaApiServiceTest: XCTestCase {
    var sut: AboutCanadaAPi!
    var mockSession: MockSessionHelper.MockDataSession!
    
    override func setUp() {
        super.setUp()
        mockSession = MockSessionHelper.MockDataSession()
        sut = AboutCanadaAPi(session: mockSession)
    }

    override func tearDown() {
        sut = nil
        mockSession = nil
        super.tearDown()
    }
    
    func testPopularNews() {
        let expection = self.expectation(description: "testPopularNews")
        sut.popularNews { feededData, err in
            XCTAssertEqual(feededData?.title, "About Canada")
            expection.fulfill()
        }
        wait(for: [expection], timeout: 10)
        XCTAssertTrue(mockSession.dataTaskWithUrlCalled)
    }
}
