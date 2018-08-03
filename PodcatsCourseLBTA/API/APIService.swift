//
//  APIService.swift
//  PodcatsCourseLBTA
//
//  Created by Brandon Jacobi on 3/17/18.
//  Copyright © 2018 Brandon Jacobi. All rights reserved.
//

import Foundation
import Alamofire
import FeedKit

class APIService {
    
    let baseURL = "https://itunes.apple.com/search"
    
    static let shared = APIService()
    
    func fetchEpisodes(feedURL: String, completionHandler: @escaping ([Episode]) -> ()) {
        
        let secureFeedUrl = feedURL.contains("https") ? feedURL : feedURL.replacingOccurrences(of: "http", with: "https")
        guard let url = URL(string: secureFeedUrl) else { return }
        
        let parser = FeedParser(URL: url)
        parser?.parseAsync(result: { (result) in
            print("Successfully Parsed feed:", result.isSuccess)
            
            if let err = result.error {
                print("Failed to parse XML feed:", err)
                return
            }
            
            guard let feed = result.rssFeed else { return }
            completionHandler(feed.toEpisodes())
        })
        
    }
    
    func fetchPodcasts(searchText: String, completionHandler: @escaping ([Podcast]) -> ()) {
        let parameters = ["term": searchText, "media": "podcast"]
        
        Alamofire.request(baseURL, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseData { (dataResponse) in
            if let err = dataResponse.error {
                print("Failed to connect to server", err)
                return
            }
            
            guard let data = dataResponse.data else { return }
            do {
                let searchResult = try JSONDecoder().decode(SearchResults.self, from: data)
                completionHandler(searchResult.results)
            } catch let decodeErr {
                print("Failed to decode:", decodeErr)
            }
        }
    }
    
    struct SearchResults: Decodable {
        let resultCount: Int
        let results: [Podcast]
    }
    
}
