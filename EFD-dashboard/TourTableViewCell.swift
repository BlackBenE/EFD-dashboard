//
//  TourTableViewCell.swift
//  EFD-dashboard
//
//  Created by Elie Bengou on 04/03/2024.
//

import UIKit

class TourTableViewCell: UITableViewCell {
    
    
    @IBOutlet var TourCard: UIView!
    @IBOutlet var TourId: UILabel!
    @IBOutlet weak var TourDate: UILabel!
    @IBOutlet weak var TourDriver: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.TourCard.layer.cornerRadius = 10
    }
    
    
    func redraw(with round: Round){
        TourId.text = round.id
        TourDriver.text = round.driver
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        TourDate.text = dateFormatter.string(from: round.date)
        
        
        
    }
    
    
    
    
    

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
}
