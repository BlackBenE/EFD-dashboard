//
//  DriverDetailsViewController.swift
//  EFD-dashboard
//
//  Created by Elie Bengou on 25/02/2024.
//

import UIKit

class DriverDetailsViewController: UIViewController {
    
    var driver : Driver!
    
    static func newInstance(driver: Driver) -> DriverDetailsViewController {
        let controller = DriverDetailsViewController()
        controller.driver = driver
        return controller
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
