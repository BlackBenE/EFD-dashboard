//
//  DeliveryDriversViewController.swift
//  EFD-dashboard
//
//  Created by Elie Bengou on 24/02/2024.
//

import UIKit

import UIKit

class DeliveryDriversViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var allDriversLabel: UILabel!
    @IBOutlet var allDriversTableView: UITableView!
    var allDrivers: [Driver]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        allDriversTableView.delegate = self
        allDriversTableView.dataSource = self
        
       
        let nib = UINib(nibName: "DeliveryDriversTableViewCell", bundle: nil)
        allDriversTableView.register(nib, forCellReuseIdentifier: "DriverCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        DriversWebService.getAll { [weak self] allDrivers, err in
            self?.allDrivers = allDrivers
            
            DispatchQueue.main.async {
                self?.allDriversTableView.reloadData()
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == allDriversTableView {
            return allDrivers?.count ?? 0
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DriverCell", for: indexPath) as! DeliveryDriversTableViewCell
        var driver: Driver?
        driver = allDrivers?[indexPath.row]
        
        if let driver = driver {
            cell.redraw(with: driver)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var driver: Driver?
        driver = allDrivers?[indexPath.row]
        
        
        if let driver = driver {
            let next = DriverDetailsViewController.newInstance(driver: driver)
            
            if self.navigationController != nil {
                self.navigationController!.pushViewController(next, animated: true)
            } else if self.splitViewController != nil {
                self.splitViewController!.viewControllers[1] = next
            }
        }
    }
    
    @IBAction func CreateNewDriverButton(_ sender: UIButton) {
        
        let DriverDerails = DriverDetailsViewController()
        self.navigationController?.pushViewController(DriverDerails, animated: true)
        
    }
    
}
