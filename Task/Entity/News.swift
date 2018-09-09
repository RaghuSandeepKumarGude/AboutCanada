//
//  News.swift
//  NYTimes
//
//  Created by Raghu Sandeep on 8/8/18.
//  Copyright © 2018 Raghu Sandeep. All rights reserved.
//

import Foundation
import UIKit

class News: NSObject, Codable {
    var title: String?
    var deatilDescription: String?
    var url: String?

    enum CodingKeys: String, CodingKey {
        case deatilDescription = "description"
        case url = "imageHref"
        case title = "title"
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(url, forKey: .url)
        try container.encode(title, forKey: .title)
        try container.encode(deatilDescription, forKey: .deatilDescription)
    }

    required public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        url = try values.decode(String?.self, forKey: .url)
        title = try values.decode(String?.self, forKey: .title)
        deatilDescription = try values.decode(String?.self, forKey: .deatilDescription)
    }
}
