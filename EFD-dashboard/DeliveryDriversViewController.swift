//
//  DeliveryDriversViewController.swift
//  EFD-dashboard
//
//  Created by Elie Bengou on 24/02/2024.
//

import UIKit

class DeliveryDriversViewController: UIViewController {

    
    
    @IBOutlet var activeDriverLable: UILabel!
    @IBOutlet var activeDriverTableView: UITableView!
    @IBOutlet var allDriversLabel: UILabel!
    @IBOutlet var allDriversTableView: UITableView!
    var allDrivers: [Driver]?
    var activeDriver: [Driver]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }



    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allDrivers?.count ?? 0 // ?? -> si la partie de gauche est nil retourne la partie de droite
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumCellId", for: indexPath) as! DeliveryDriversTableViewCell
//        cell.redraw(with: self.albums![indexPath.row])
//        return cell
//    }
//    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let driver = self.allDrivers![indexPath.row]
        let next = DriverDetailsViewController.newInstance(driver :driver)
        
        if self.navigationController != nil {
            self.navigationController!.pushViewController(next, animated: true)
        } else if self.splitViewController != nil {
            self.splitViewController!.viewControllers[1] = next
        }
        
    }

}
