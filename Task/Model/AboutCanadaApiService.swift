//
//  AboutCanadaApiService.swift
//  Task
//
//  Created by Harshavardhana Reddy on 08/09/18.
//  Copyright © 2018 Sandeep. All rights reserved.
//

import Foundation

enum FeedError: Error {
    case invalidUrl
    case noResultsFound
}

typealias  NewsFeedCompletionHandler = (NewsFeed?, Error?) -> Void

class AboutCanadaAPi {
    private var session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
    
    convenience init () {
        self.init(session: URLSession(configuration: .default))
    }
    
    func popularNews(completion: @escaping NewsFeedCompletionHandler) {
        let popularNYNews = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
        guard let popularNYNewsurl = URL(string: popularNYNews) else {
            completion(nil, FeedError.invalidUrl)
            return
        }
        let task =  session.dataTask(with: popularNYNewsurl) { (data, _, error) in
            guard let responseData = data, error == nil else {
                completion(nil, error)
                return
            }
            let responseStrInISOLatin = String(data: responseData, encoding: String.Encoding.isoLatin1)
            guard let modifiedDataInUTF8Format = responseStrInISOLatin?.data(using: String.Encoding.utf8) else {
                print("could not convert data to UTF-8 format")
                return
            }
            do {
                let decoder = JSONDecoder()
                let feed = try decoder.decode(NewsFeed.self, from: modifiedDataInUTF8Format)
                completion(feed, nil)
            } catch let error {
                print("json error: \(error)")
            }
        }
        task.resume()
    }
}
