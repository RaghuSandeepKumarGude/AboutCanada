//
//  CustomTableViewCellTest.swift
//  TaskTests
//
//  Created by Harshavardhana Reddy on 09/09/18.
//  Copyright © 2018 Sandeep. All rights reserved.
//

import Foundation
@testable import Task
import XCTest

class CustomTableViewCellTest: XCTestCase {
    var sut: customTableViewCell!
    
    override func setUp() {
        super.setUp()
        sut = customTableViewCell()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testCellView() {
        let customViewCell = sut.cellView
        XCTAssertNotNil(customViewCell)
    }
    
    func testPictureImageView() {
        let placeHolderImage = sut.pictureImageView
        XCTAssertEqual(placeHolderImage.layer.cornerRadius, 10)
    }
    
    func testTitleLabel() {
        let titleLabel = sut.titleLabel
        XCTAssertEqual(titleLabel.numberOfLines, 0)
        XCTAssertEqual(titleLabel.font.fontName, "Verdana")
    }
    
    func testSubTitleLabel() {
        let subTitleLabel = sut.subTitleLabel
        XCTAssertEqual(subTitleLabel.numberOfLines, 0)
        XCTAssertEqual(subTitleLabel.font.fontName, "Verdana")
    }
}
