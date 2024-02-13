//
//  TabBarController.swift
//  EFD-dashboard
//
//  Created by Elie Bengou on 24/02/2024.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        let profilButton = UIBarButtonItem(title: "Profil", style: .plain, target: self, action: #selector(profilButtonTapped))
        navigationItem.rightBarButtonItem = profilButton

        self.setupTabs()
        // Do any additional setup after loading the view.
    }
    
    @objc func profilButtonTapped() {
        // Créer une instance du ProfilViewController
        let profilVC = ProfilViewController() // Assurez-vous que le ProfilViewController est bien initialisé ici

        // Naviguer vers le ProfilViewController
        navigationController?.pushViewController(profilVC, animated: true)
    }

    
    private func setupTabs(){
        let Carte = self.createNav(with: "Carte", and: UIImage(systemName: "map"), vc: HomeViewController())
        let Livreurs = self.createNav(with: "Mes Livreurs", and: UIImage(systemName: "person.3"), vc: DeliveryDriversViewController())
        let Tournees = self.createNav(with: "Mes Tournées", and: UIImage(systemName: "house"), vc: TourViewController())
        let Livraisons = self.createNav(with: "Livraisons Terminées", and: UIImage(systemName: "house"), vc: DeliveriesViewController())

        self.setViewControllers([Carte, Livreurs, Tournees, Livraisons], animated: true)
    }
    
    private func createNav(with title: String, and image: UIImage?, vc: UIViewController ) -> UINavigationController{
        
        let nav = UINavigationController(rootViewController: vc)
        
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        nav.viewControllers.first?.navigationItem.title = title
        //nav.viewControllers.first?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Button", style: .plain, target: nil, action: nil)
        return nav
    
        
    }

}
