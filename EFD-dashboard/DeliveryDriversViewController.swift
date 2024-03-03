//
//  DeliveryDriversViewController.swift
//  EFD-dashboard
//
//  Created by Elie Bengou on 24/02/2024.
//

import UIKit

import UIKit

class DeliveryDriversViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var activeDriverLable: UILabel!
    @IBOutlet var activeDriverTableView: UITableView!
    @IBOutlet var allDriversLabel: UILabel!
    @IBOutlet var allDriversTableView: UITableView!
    var allDrivers: [Driver]?
    var activeDriver: [Driver]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        activeDriverTableView.delegate = self
        activeDriverTableView.dataSource = self
        allDriversTableView.delegate = self
        allDriversTableView.dataSource = self
        
       
        let nib = UINib(nibName: "DeliveryDriversTableViewCell", bundle: nil)
        activeDriverTableView.register(nib, forCellReuseIdentifier: "DriverCell")
        allDriversTableView.register(nib, forCellReuseIdentifier: "DriverCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        DriversWebService.getAll { [weak self] allDrivers, err in
            self?.allDrivers = allDrivers
            self?.activeDriver = allDrivers
            
            DispatchQueue.main.async {
                self?.allDriversTableView.reloadData()
                self?.activeDriverTableView.reloadData()
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == activeDriverTableView {
            return activeDriver?.count ?? 0
        } else if tableView == allDriversTableView {
            return allDrivers?.count ?? 0
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DriverCell", for: indexPath) as! DeliveryDriversTableViewCell
        var driver: Driver?
        if tableView == activeDriverTableView {
            driver = activeDriver?[indexPath.row]
        } else if tableView == allDriversTableView {
            driver = allDrivers?[indexPath.row]
        }
        if let driver = driver {
            cell.redraw(with: driver)
        }
        return cell
    }
    
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
