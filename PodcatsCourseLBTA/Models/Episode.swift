//
//  Episode.swift
//  PodcatsCourseLBTA
//
//  Created by Brandon Jacobi on 5/17/18.
//  Copyright © 2018 Brandon Jacobi. All rights reserved.
//

import Foundation
import FeedKit

struct Episode {
    let title: String
    let pubDate: Date
    let description: String
    
    var imageURL: String?
    
    init(feedItem: RSSFeedItem) {
        self.title = feedItem.title ?? ""
        self.pubDate = feedItem.pubDate ?? Date()
        self.description = feedItem.iTunes?.iTunesSubtitle ?? feedItem.description ?? ""
        self.imageURL = feedItem.iTunes?.iTunesImage?.attributes?.href
    }
    
}
