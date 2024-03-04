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
    
    
    
    @IBAction func CreateButton(_ sender: UIButton) {
        guard let driverId = DriverFirstName.text, let deliveryId = DeliveryTextField.text, let deliveryDateString = DeliveryDate.text else {
               print("Error: Missing driver ID, delivery ID, or delivery date")
               return
           }
           
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ" 
           guard let deliveryDate = dateFormatter.date(from: deliveryDateString) else {
               print("Error: Invalid delivery date")
               return
           }
                
                DriversWebService.getOne(id: deliveryId) { driver, error in
                    guard let driver = driver else {
                        // Handle error
                        return
                    }
                    
                    DeliveryWebService.getOne(id: deliveryId) { delivery, error in
                        guard let delivery = delivery else {
                            // Handle error
                            return
                        }
                        
                        self.deliveries.append(delivery)
                        
                        let newRound = Round(id: "", date: deliveryDate, deliveries: self.deliveries, driver: driver)
                        
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
}
                
