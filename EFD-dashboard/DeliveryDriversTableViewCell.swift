//
//  DeliveryDriversTableViewCell.swift
//  EFD-dashboard
//
//  Created by Elie Bengou on 25/02/2024.
//

import UIKit

class DeliveryDriversTableViewCell: UITableViewCell {
    
    @IBOutlet var cardView: UIView!
    @IBOutlet weak var DriverLastName: UILabel!
    @IBOutlet weak var driverFirstName: UILabel!
    @IBOutlet weak var DriverEmail: UILabel!
    
    var imageTask: URLSessionDataTask?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.cardView.layer.cornerRadius = 10
    }
    
    func redraw(with driver: Driver){
        driverFirstName.text = driver.firstName
        DriverLastName.text = driver.lastName
        DriverEmail.text = driver.email

        
        
    }
}
