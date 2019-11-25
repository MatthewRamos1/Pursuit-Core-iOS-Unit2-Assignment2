//
//  DetailViewController.swift
//  GameOfThrones
//
//  Created by Matthew Ramos on 11/20/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var episode: GOTEpisode?

    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    
    func updateUI() {
        guard let GoTepisode = episode else {
            fatalError()
        }
        navigationItem.title = GoTepisode.name
        
    }

}
