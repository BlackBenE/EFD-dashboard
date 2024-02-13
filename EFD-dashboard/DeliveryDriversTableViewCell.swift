//
//  DeliveryDriversTableViewCell.swift
//  EFD-dashboard
//
//  Created by Elie Bengou on 25/02/2024.
//

import UIKit

class DeliveryDriversTableViewCell: UITableViewCell {
    
    @IBOutlet var cardView: UIView!
    @IBOutlet var photoDeeliveryDriver: UIImageView!
    @IBOutlet var deliveryDriverName: UILabel!
    @IBOutlet var deliveryDriverShippingNumber: UILabel!
    var imageTask: URLSessionDataTask?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.cardView.layer.cornerRadius = 10
    }

    func redraw(with driver: Driver){
        deliveryDriverName.text = driver.firstName
    }
    
    
    
}
