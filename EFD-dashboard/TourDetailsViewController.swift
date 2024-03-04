//
//  TourDetailsViewController.swift
//  EFD-dashboard
//
//  Created by Elie Bengou on 04/03/2024.
//

import UIKit

class TourDetailsViewController: UIViewController {
    
    var round : Round?

    static func newInstance(round: Round) -> TourDetailsViewController {
        let controller = TourDetailsViewController()
        controller.round = round
        return controller
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}
