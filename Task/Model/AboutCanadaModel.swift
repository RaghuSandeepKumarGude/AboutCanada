//
//  AboutCanadaModel.swift
//  Task
//
//  Created by Harshavardhana Reddy on 09/09/18.
//  Copyright © 2018 Sandeep. All rights reserved.
//

import Foundation

class AboutCanadaModel {
    
    func fetchUpdatedDetailsAboutCanada(with completionHandler:@escaping NewsFeedCompletionHandler) {
        let apiService = AboutCanadaAPi()
        apiService.popularNews { (data, error) in
            completionHandler(data, error)
        }
    }
}
