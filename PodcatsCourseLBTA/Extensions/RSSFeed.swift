//
//  RSSFeed.swift
//  PodcatsCourseLBTA
//
//  Created by Brandon Jacobi on 5/18/18.
//  Copyright © 2018 Brandon Jacobi. All rights reserved.
//

import FeedKit

extension RSSFeed {
    
    func toEpisodes() -> [Episode] {
        let imageURL = iTunes?.iTunesImage?.attributes?.href
        
        var episodes = [Episode]()
        items?.forEach({ (feedItem) in
            var episode = Episode(feedItem: feedItem)
            
            if episode.imageURL == nil {
                episode.imageURL = imageURL
            }
            
            episodes.append(episode)
        })
        return episodes
    }
    
}
