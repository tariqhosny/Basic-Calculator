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
        containerView.backgroundColor = .systemGray6
        containerView.layer.cornerRadius = 5
    }
    
    override var isSelected: Bool {
        didSet {
            self.containerView.backgroundColor  = isSelected ? .gray : .systemGray6
            self.operationLb.textColor = isSelected ? .white : .black
        }
    }

}
