//
//  DetailViewController.swift
//  GameOfThrones
//
//  Created by Matthew Ramos on 11/20/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var episodeImage: UIImageView!
    @IBOutlet weak var episodeDescription: UITextView!
    var episode: GOTEpisode?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()

    }
    
    func updateUI() {
        guard let GoTepisode = episode else {
            fatalError("Error: Episode not pulled correctly, check segue")
        }
        navigationItem.title = GoTepisode.name
        episodeImage.image = UIImage(named: episode?.originalImageID ?? "Error")
        episodeDescription.text = GoTepisode.summary
        
    }

}
