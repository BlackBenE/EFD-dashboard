//
//  TourViewController.swift
//  EFD-dashboard
//
//  Created by Elie Bengou on 24/02/2024.
//

import UIKit

class TourViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var TourTableView: UITableView!
    

  
    var rounds: [Round]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("viewDidLoad called")
        
        TourTableView.delegate = self
        TourTableView.dataSource = self
        
        let nib = UINib(nibName: "TourTableViewCell", bundle: nil)
        TourTableView.register(nib, forCellReuseIdentifier: "TourCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        print("viewWillAppear called")
        
        RoundWebService.getAll { [weak self] rounds, err in
            print("RoundWebService.getAll callback")
            if let rounds = rounds {
                print("Received \(rounds.count) rounds")
                self?.rounds = rounds
            } else if let err = err {
                print("Error: \(err)")
            }
            
            DispatchQueue.main.async {
                print("Reloading table view data")
                self?.TourTableView.reloadData()
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("numberOfRowsInSection called, returning \(rounds?.count ?? 0)")
        return rounds?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        print("heightForRowAt called for row \(indexPath.row)")
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("cellForRowAt called for row \(indexPath.row)")
        let cell = tableView.dequeueReusableCell(withIdentifier: "TourCell", for: indexPath) as! TourTableViewCell
        let round = rounds?[indexPath.row]
        
        if let round = round {
            print("Redrawing cell with round: \(round)")
            cell.redraw(with: round)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelectRowAt called for row \(indexPath.row)")
        let round = rounds?[indexPath.row]
        
        if let round = round {
            print("Pushing TourDetailsViewController for round: \(round)")
            let next = TourDetailsViewController.newInstance(round: round)
            
            if self.navigationController != nil {
                self.navigationController!.pushViewController(next, animated: true)
            } else if self.splitViewController != nil {
                self.splitViewController!.viewControllers[1] = next
            }
        }
    }

    @IBAction func NewTourButton(_ sender: UIButton) {
        let NewTour = CreateTourViewController()
        self.navigationController?.pushViewController(NewTour, animated: true)
        
    }
    
}
