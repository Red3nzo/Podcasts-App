//
//  PlayerDetailsView.swift
//  PodcatsCourseLBTA
//
//  Created by Brandon Jacobi on 5/19/18.
//  Copyright © 2018 Brandon Jacobi. All rights reserved.
//

import UIKit

class PlayerDetailsView: UIView {
    
    var episode: Episode! {
        didSet {
            episodeTitleLabel.text = episode.title
            
            guard let url = URL(string: episode.imageURL ?? "") else { return }
            
            episodeImageView.sd_setImage(with: url)
        }
    }
    
    @IBOutlet weak var episodeImageView: UIImageView!
    @IBOutlet weak var episodeTitleLabel: UILabel!
    
    @IBAction func handleDismiss(_ sender: Any) {
        self.removeFromSuperview()
    }
    
    
}
