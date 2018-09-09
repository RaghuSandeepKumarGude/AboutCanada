//
//  NewsFeed.swift
//  NYTimes
//
//  Created by Raghu Sandeep on 8/9/18.
//  Copyright © 2018 Raghu Sandeep. All rights reserved.
//

import Foundation

class NewsFeed:NSObject, Codable {
    var title: String?
    var rows: [News]?
    
    enum CodingKeys: String, CodingKey {
        case title
        case rows
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(title, forKey: .title)
        try container.encode(rows, forKey: .rows)
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decode(String?.self, forKey: .title)
        rows = try values.decode([News]?.self, forKey: .rows)
    }
}
