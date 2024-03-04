//
//  TourViewController.swift
//  EFD-dashboard
//
//  Created by Elie Bengou on 24/02/2024.
//

import UIKit

class TourViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var TourTableView: UITableView!
    
    var rounds: [Round] = []
       
       override func viewDidLoad() {
           super.viewDidLoad()
           
           // Enregistrez votre cellule personnalisée
           TourTableView.register(UINib(nibName: "TourTableViewCell", bundle: nil), forCellReuseIdentifier: "TourCell")
           
           // Définissez le delegate et le dataSource
           TourTableView.delegate = self
           TourTableView.dataSource = self
           
           // Récupérez les données
           RoundWebService.getAll { rounds, error in
               if let rounds = rounds {
                   self.rounds = rounds
                   DispatchQueue.main.async {
                       self.TourTableView.reloadData()
                   }
               } else if let error = error {
                   print(error)
               }
           }
       }
       
       // Nombre de lignes dans la section
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return rounds.count
       }
       
       // Cellule pour la ligne à l'index donné
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "TourCell", for: indexPath) as! TourTableViewCell
           cell.redraw(with: rounds[indexPath.row])
           return cell
       }
       
       // Hauteur de la cellule
       func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 100
       }
       
       // Sélection de la cellule
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           tableView.deselectRow(at: indexPath, animated: true)
           // Faites quelque chose lorsque la cellule est sélectionnée
       }

    @IBAction func NewTourButton(_ sender: UIButton) {
        let TourDerails = TourDetailsViewController()
        self.navigationController?.pushViewController(TourDerails, animated: true)
        
    }
    
}
