//
//  MockUITableView.swift
//  NYTimesTests
//
//  Created by Raghu Sandeep on 8/13/18.
//  Copyright © 2018 Raghu Sandeep. All rights reserved.
//

import Foundation
import UIKit
@testable import Task

class MockUITableView: UITableView {
    var reloadDataCalled = 0

    override func reloadData() {
        reloadDataCalled += 1
    }
}
