//
//  AboutCanadaAPiProtocol.swift
//  Task
//
//  Created by Harshavardhana Reddy on 09/09/18.
//  Copyright © 2018 Sandeep. All rights reserved.
//

import Foundation

protocol AboutCanadaAPiProtocol {
    func popularNews(completion: @escaping NewsFeedCompletionHandler)
}
