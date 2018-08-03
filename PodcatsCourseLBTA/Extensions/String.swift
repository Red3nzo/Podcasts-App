//
//  String.swift
//  PodcatsCourseLBTA
//
//  Created by Brandon Jacobi on 5/18/18.
//  Copyright © 2018 Brandon Jacobi. All rights reserved.
//

import Foundation
extension String {
    
    func toSecureHTTPS() -> String {
        return self.contains("https") ? self : self.replacingOccurrences(of: "http", with: "https")
    }
    
}
