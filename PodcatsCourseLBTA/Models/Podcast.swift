//
//  Podcast.swift
//  PodcatsCourseLBTA
//
//  Created by Brandon Jacobi on 2/22/18.
//  Copyright © 2018 Brandon Jacobi. All rights reserved.
//

import Foundation

struct Podcast: Decodable {
    var trackName: String?
    var artistName: String?
    var artworkUrl600: String?
    var trackCount: Int?
    var feedUrl: String?
}


