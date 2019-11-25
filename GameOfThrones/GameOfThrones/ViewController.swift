//
//  ViewController.swift
//  GameOfThrones
//
//  Created by Alex Paul on 11/16/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
    @IBOutlet weak var tableView: UITableView!
    var seasons = [[GOTEpisode]]() {
        didSet {
            tableView.reloadData()
        }
    }
    
  override func viewDidLoad() {
    super.viewDidLoad()
    seasons = GOTEpisode.getSeasons()
    tableView.dataSource = self
    tableView.delegate = self
  }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailViewController = segue.destination as? DetailViewController, let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("Error with prepare for segue")
        }
        detailViewController.episode = seasons[indexPath.section][indexPath.row]
        
        
    }


}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        seasons[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: CustomCell //!
        
        if indexPath.section % 2 == 0 {
            guard let GoTcell = tableView.dequeueReusableCell(withIdentifier: "leftImageCell", for: indexPath) as? CustomCell else {
                fatalError()
            }
            cell = GoTcell
        } else {
            guard let GoTcell = tableView.dequeueReusableCell(withIdentifier: "rightImageCell", for: indexPath) as? CustomCell else {
                fatalError("Error with dequeueReusableCell")
            }
            cell = GoTcell
        }
        let episode = seasons[indexPath.section][indexPath.row]
        cell.configureCell(for: episode)
        return cell
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
       return seasons.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return String(seasons[section].first?.season ?? 0)
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 92
    }
}
