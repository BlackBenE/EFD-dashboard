//
//  CreateTourViewController.swift
//  EFD-dashboard
//
//  Created by Elie Bengou on 04/03/2024.
//

import UIKit

class CreateTourViewController: UIViewController {
    
    var round : Round?
    var deliveries = [Delivery]()
    
    
    @IBOutlet var DriverFirstName: UITextField!
    @IBOutlet var DeliveryTextField: UITextField!
    @IBOutlet var DeliveryDate: UITextField!
    
    
    static func newInstance(round: Round) -> CreateTourViewController {
        let controller = CreateTourViewController()
        controller.round = round
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func AddDelivery(_ sender: UIButton) {
        guard let deliveryId = DeliveryTextField.text else {
            return
        }
        DeliveryWebService.getOne(id: deliveryId) { delivery, error in
            guard let delivery = delivery else {
                // Handle error
                return
            }
            
            self.deliveries.append(delivery)
        }
    }
    
    
    @IBAction func CreateButton(_ sender: UIButton) {
        guard let driverId = DriverFirstName.text else {
            return
        }
        
        DriversWebService.getOne(id: driverId) { driver, error in
            guard let driver = driver else {
                // Handle error
                return
            }
            
            let newRound = Round(id: "", date: Date(), deliveries: self.deliveries, driver: driver)
            
            RoundWebService.create(round: newRound) { createdRound, error in
                DispatchQueue.main.async {
                    if let error = error {
                        let alert = UIAlertController(title: "Erreur", message: "Échec de la création de la tournée : \(error)", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default))
                        self.present(alert, animated: true)
                    } else {
                        let alert = UIAlertController(title: "Succès", message: "Tournée créée avec succès", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                            self.dismiss(animated: true, completion: nil)
                        }))
                        self.present(alert, animated: true)
                    }
                }
            }
        }
    }
}
                
