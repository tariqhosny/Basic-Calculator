//
//  OperationCell.swift
//  Basic Calculator
//
//  Created by Tariq on 31/08/2021.
//

import UIKit

class OperationCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var operationLb: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        containerView.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        containerView.layer.cornerRadius = 5
//        containerView.layer.shadowColor = UIColor.lightGray.cgColor
//        containerView.layer.shadowOpacity = 0.4
//        containerView.layer.shadowOffset = .zero
//        containerView.layer.shadowRadius = 5
    }

}
