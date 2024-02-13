//
//  ConnexionViewController.swift
//  EFD-dashboard
//
//  Created by Elie Bengou on 13/02/2024.
//

import UIKit

class ConnexionViewController: UIViewController {
    
    @IBOutlet var loginEmailTextFeild: UITextField!
    @IBOutlet var loginPasswordTextFeild: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        loginPasswordTextFeild.isSecureTextEntry = true
    }
    
    
    @IBAction func connexionButton(_ sender: Any) {
        
        guard let email = loginEmailTextFeild.text, !email.isEmpty,
                  let password = loginPasswordTextFeild.text, !password.isEmpty else {
                let alert = UIAlertController(title: "Erreur", message: "Veuillez entrer votre email et votre mot de passe.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alert, animated: true)
                return
            }
            
            // Validate email format
            let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegex)
            guard emailPred.evaluate(with: email) else {
                // Show an alert to the user to enter a valid email
                let alert = UIAlertController(title: "Erreur", message: "Veuillez entrer un email valide.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alert, animated: true)
                return
            }
            
            AdminWebService.login(email: email, password: password) { admin, error in
                if let error = error {
                    // Handle error
                    print("Login failed with error: \(error)")
                } else if let admin = admin {
                    // Handle successful login
                    print("Logged in as admin: \(admin)")
                    DispatchQueue.main.async {
                        let tabBarController = TabBarController()
                        self.navigationController?.pushViewController(tabBarController, animated: true)
                    }
                }
            }
        
    }
}
