//
//  ViewContollerTest.swift
//  TaskTests
//
//  Created by Harshavardhana Reddy on 09/09/18.
//  Copyright © 2018 Sandeep. All rights reserved.
//

import Foundation
@testable import Task
import XCTest

class ViewContollerTest: XCTestCase {
    var sut: ViewController!
    
    override func setUp() {
        super.setUp()
        sut = ViewController()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testRefreshData() {
        let mockPresenter = MockAboutCanadaPresenter(view: sut, model: AboutCanadaModel())
        sut.presenter = mockPresenter
        sut.refreshData()
        XCTAssertTrue(mockPresenter.fetchDetailsAboutCanadaCalled)
    }
    
    func testTableView() {
        let mockTableView = MockUITableView()
        sut.tableView = mockTableView

        XCTAssertEqual(sut.numberOfSections(in: mockTableView), 1)
    }
    
    func testNumberOfRowsInSection() {
        let mockTableView = MockUITableView()
        sut.feededData = nil
        
        XCTAssertEqual(sut.tableView(mockTableView, numberOfRowsInSection: 0), 0)
    }
    
    func testViewDidLoad() {
        let mockPresenter = MockAboutCanadaPresenter(view: sut, model: AboutCanadaModel())
        sut.presenter = mockPresenter
        sut.viewDidLoad()
        XCTAssertNotNil(sut.tableView)
        XCTAssertTrue(mockPresenter.fetchDetailsAboutCanadaCalled)
    }
    
    func testCellForRowAtIndexPath_emptyCell() throws {
        let indexPath = IndexPath(row: 0, section: 0)
        let mockTableView = MockUITableView()
        mockTableView.register(customTableViewCell.self,
                               forCellReuseIdentifier: "cellIdentifier")
        sut.feededData = nil
        let bundleData = try mockDataFromBundle()
        sut.feededData = bundleData
        let tableViewCell = sut.tableView(mockTableView, cellForRowAt: indexPath) as! customTableViewCell
        XCTAssertNotNil(tableViewCell.cellView)
        XCTAssertNotNil(tableViewCell.pictureImageView)
        XCTAssertNotNil(tableViewCell.subTitleLabel)
        XCTAssertNotNil(tableViewCell.titleLabel)
    }
    
    func mockDataFromBundle() throws-> [News]? {
        var newsData: Data?
        var feed: NewsFeed?
        guard let bundlePath = Bundle.main.url(forResource: "sampleNewsFeed",
                                               withExtension: "json") else {
                                                return nil
        }
        do {
            newsData = try Data(contentsOf: bundlePath)
        }
        
        do {
            let decoder = JSONDecoder()
            print(String(decoding: newsData!, as: UTF8.self))
           feed = try decoder.decode(NewsFeed.self, from: newsData!)
        } catch let error {
            print(error.localizedDescription)
        }
        return feed?.rows
    }
}
