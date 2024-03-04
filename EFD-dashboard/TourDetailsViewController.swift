//
//  TourDetailsViewController.swift
//  EFD-dashboard
//
//  Created by Elie Bengou on 04/03/2024.
//

import UIKit

class TourDetailsViewController: UIViewController {
    
    @IBOutlet weak var TourId: UILabel!
    @IBOutlet weak var DriverFirstName: UITextField!
    @IBOutlet weak var TourTableView: UITableView!
        
    
    var round : Round?

    static func newInstance(round: Round) -> TourDetailsViewController {
        let controller = TourDetailsViewController()
        controller.round = round
        return controller
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        TourId.text = round?.id
        DriverFirstName.text = round?.driver?.firstName
    }

    @IBAction func DeleteTourButton(_ sender: UIButton) {
        
        guard let round = round else {
                    let alert = UIAlertController(title: "Erreur", message: "Échec de la suppression de la tournée: Pas de tournée à supprimer.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default))
                    self.present(alert, animated: true)
                    return
                }

                RoundWebService.delete(id: round.id) { error in
                    DispatchQueue.main.async {
                        if let error = error {
                            let alert = UIAlertController(title: "Erreur", message: "Échec de la suppression de la tournée : \(error)", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "OK", style: .default))
                            self.present(alert, animated: true)
                        } else {
                            let alert = UIAlertController(title: "Succès", message: "Tournée supprimée avec succès", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                                self.navigationController?.popViewController(animated: true)
                            }))
                            self.present(alert, animated: true)
                        }
                    }
                }
        
    }
    
    
    @IBAction func ModifiyTourButton(_ sender: UIButton) {
        
        guard let round = round else {
                   let alert = UIAlertController(title: "Erreur", message: "Échec de la mise à jour de la tournée: Pas de tournée à mettre à jour.", preferredStyle: .alert)
                   alert.addAction(UIAlertAction(title: "OK", style: .default))
                   self.present(alert, animated: true)
                   return
               }

               round.driver?.firstName = DriverFirstName.text!

               RoundWebService.update(round: round) { updatedRound, error in
                   DispatchQueue.main.async {
                       if let error = error {
                           let alert = UIAlertController(title: "Erreur", message: "Échec de la mise à jour de la tournée : \(error)", preferredStyle: .alert)
                           alert.addAction(UIAlertAction(title: "OK", style: .default))
                           self.present(alert, animated: true)
                       } else {
                           let alert = UIAlertController(title: "Succès", message: "Tournée mise à jour avec succès", preferredStyle: .alert)
                           alert.addAction(UIAlertAction(title: "OK", style: .default))
                           self.present(alert, animated: true)
                           self.round = updatedRound
                       }
                   }
               }
    }
    
    
    @IBAction func CreatTourButton(_ sender: UIButton) {
        
        let TourDerails = TourDetailsViewController()
        self.navigationController?.pushViewController(TourDerails, animated: true)
        
    }
    
    
    @IBAction func AddDeliveryButton(_ sender: UIButton) {
    }
}
