//
//  TaskCell.swift
//  Basic Calculator
//
//  Created by Tariq on 31/08/2021.
//

import UIKit

class TaskCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var operationLb: UILabel!
    @IBOutlet weak var resultLb: UILabel!
    
    var timer:Timer?
    var timeLeft = 0
    var result: Double = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        containerView.layer.cornerRadius = 5
    }
    
    func configuration(task: TaskModel){
        operationLb.text = "\(task.firstNumber) \(task.operation) \(task.secondNumber)"
        timeLeft = task.delayTime
        resultLb.text = "after \(timeLeft) seconds left"
        getResult(task: task)
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimer), userInfo: nil, repeats: true)
        
    }
    
    @objc func onTimer()
    {
        timeLeft -= 1
        resultLb.text = "after \(timeLeft) seconds left"

        if timeLeft <= 0 {
            timer?.invalidate()
            timer = nil
            resultLb.text = "\(result)"
            resultLb.textColor = #colorLiteral(red: 0.03921568627, green: 0.5176470588, blue: 1, alpha: 1)
        }
    }
    
    func getResult(task: TaskModel){
        switch task.operation {
        case "+":
            result = task.firstNumber + task.secondNumber
        case "-":
            result = task.firstNumber - task.secondNumber
        case "*":
            result = task.firstNumber * task.secondNumber
        case "/":
            result = task.firstNumber / task.secondNumber
        default:
            result = 0
        }
    }
}
