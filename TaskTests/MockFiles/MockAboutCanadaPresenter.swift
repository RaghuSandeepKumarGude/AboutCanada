//
//  MockAboutCanadaPresenter.swift
//  TaskTests
//
//  Created by Harshavardhana Reddy on 09/09/18.
//  Copyright © 2018 Sandeep. All rights reserved.
//

import Foundation
import XCTest
@testable import Task
import UIKit

class MockAboutCanadaPresenter: AboutCanadaPresenter  {
    var fetchDetailsAboutCanadaCalled = false
    override func fetchDetailsAboutCanada() {
        fetchDetailsAboutCanadaCalled = true
    }
}
