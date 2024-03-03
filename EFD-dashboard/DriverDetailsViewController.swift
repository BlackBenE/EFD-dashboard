//
//  DriverDetailsViewController.swift
//  EFD-dashboard
//
//  Created by Elie Bengou on 25/02/2024.
//

import UIKit

class DriverDetailsViewController: UIViewController {
    
    var driver : Driver?
    
    @IBOutlet weak var DriverName: UITextField!
    @IBOutlet weak var DriverPhoto: UIImageView!
    @IBOutlet weak var Driverfirstname: UITextField!
    @IBOutlet weak var DriverEmail: UITextField!
    @IBOutlet weak var DriverTel: UITextField!
    
    static func newInstance(driver: Driver) -> DriverDetailsViewController {
        let controller = DriverDetailsViewController()
        controller.driver = driver
        return controller
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DriverName.text = driver?.lastName
        Driverfirstname.text = driver?.firstName
        DriverEmail.text = driver?.email
        DriverTel.text = driver?.phoneNumber
        
    }

    @IBAction func DriverUpdateButton(_ sender: UIButton) {
        
        guard let driver = driver else {
            let alert = UIAlertController(title: "Erreur", message: "Échec de la mise à jour de l'utilisateur: Pas d'utilisateur à mettre à jour.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
                return
            }
        
        driver.lastName = DriverName.text!
        driver.firstName = Driverfirstname.text!
        driver.email = DriverEmail.text!
        driver.phoneNumber = DriverTel.text!
        
        DriversWebService.update(driver: driver) { updatedDriver, error in
               DispatchQueue.main.async {
                   if let error = error {
                       let alert = UIAlertController(title: "Erreur", message: "Échec de la mise à jour du conducteur : \(error)", preferredStyle: .alert)
                       alert.addAction(UIAlertAction(title: "OK", style: .default))
                       self.present(alert, animated: true)
                   } else {
                       let alert = UIAlertController(title: "Succès", message: "Conducteur mis à jour avec succès", preferredStyle: .alert)
                       alert.addAction(UIAlertAction(title: "OK", style: .default))
                       self.present(alert, animated: true)
                       self.driver = updatedDriver
                   }
               }
           }
    }
    
    
    @IBAction func DriverDeleteButton(_ sender: UIButton) {
        
        DriversWebService.delete(driver: driver!) { error in
            DispatchQueue.main.async {
                if let error = error {
                    let alert = UIAlertController(title: "Erreur", message: "Échec de la suppression du conducteur : \(error)", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default))
                    self.present(alert, animated: true)
                } else {
                    let alert = UIAlertController(title: "Succès", message: "Conducteur supprimé avec succès", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                        self.navigationController?.popViewController(animated: true)
                    }))
                    self.present(alert, animated: true)
                }
            }
        }
    }
    
    @IBAction func DriverCreateButton(_ sender: UIButton) {
        
        guard let firstName = Driverfirstname.text, !firstName.isEmpty,
                  let lastName = DriverName.text, !lastName.isEmpty,
                  let email = DriverEmail.text, !email.isEmpty,
                  let phoneNumber = DriverTel.text, !phoneNumber.isEmpty else {
                let alert = UIAlertController(title: "Erreur", message: "Veuillez remplir tous les champs.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alert, animated: true)
                return
            }
        
        let newDriver = Driver(id: nil, firstName: firstName, lastName: lastName, email: email, password: "123456789", phoneNumber: phoneNumber, role: "driver")

           DriversWebService.create(driver: newDriver) { createdDriver, error in
               DispatchQueue.main.async {
                   if let error = error {
                       let alert = UIAlertController(title: "Erreur", message: "Échec de la création du conducteur : \(error)", preferredStyle: .alert)
                       alert.addAction(UIAlertAction(title: "OK", style: .default))
                       self.present(alert, animated: true)
                   } else {
                       let alert = UIAlertController(title: "Succès", message: "Conducteur créé avec succès", preferredStyle: .alert)
                       alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                           self.navigationController?.popViewController(animated: true)
                       }))
                       self.present(alert, animated: true)
                   }
               }
           }
        
    }
}
