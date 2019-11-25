//
//  CustomCell.swift
//  GameOfThrones
//
//  Created by Matthew Ramos on 11/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    @IBOutlet weak var episodeTitleLabel: UILabel!
    @IBOutlet weak var episodeNumberLabel: UILabel!
    @IBOutlet weak var episodeImage: UIImageView!
    
    func configureCell(for episode: GOTEpisode) {
        episodeTitleLabel.text = episode.name
        episodeNumberLabel.text = "S:\(episode.season) E:\(episode.number)"
        episodeImage.image = UIImage(named: episode.originalImageID )
    }

}
