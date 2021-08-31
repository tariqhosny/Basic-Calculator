//
//  LocationPopUp.swift
//  Basic Calculator
//
//  Created by Tariq on 31/08/2021.
//

import UIKit

class LocationPopUp: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var countryLb: UILabel!
    @IBOutlet weak var stateLb: UILabel!
    @IBOutlet weak var cityLb: UILabel!
    @IBOutlet weak var streetLb: UILabel!
    @IBOutlet weak var zipCodeLb: UILabel!
    
    var country = ""
    var city = ""
    var state = ""
    var street = ""
    var zipCode = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        containerView.layer.cornerRadius = 15

        countryLb.text = country
        stateLb.text = state
        cityLb.text = city
        streetLb.text = street
        zipCodeLb.text = zipCode
    }

    @IBAction func ClosePressed(_ sender: UIButton) {
        dismiss(animated: false)
    }
}
