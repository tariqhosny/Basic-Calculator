//
//  HomeViewController.swift
//  Basic Calculator
//
//  Created by Tariq on 31/08/2021.
//

import UIKit
import MapKit
import CoreLocation

class HomeViewController: UIViewController {

    @IBOutlet weak var firstNumberTf: UITextField!
    @IBOutlet weak var operationCollectionView: UICollectionView!
    @IBOutlet weak var secondNumberTf: UITextField!
    @IBOutlet weak var delayTimeTf: UITextField!
    @IBOutlet weak var tasksCountLb: UILabel!
    @IBOutlet weak var tasksTableView: UITableView!
    @IBOutlet weak var tasksTableHeight: NSLayoutConstraint!
    @IBOutlet weak var tasksStack: UIStackView!
    
    var timesPicker: UIPickerView! = UIPickerView()
    var locationManager = CLLocationManager()
    
    var tasks: [TaskModel] = []
    var isOperationSelected = false
    var selectedOperation = ""
    var selectedDelayTime = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCells()
        setupPickerView()
        hideKeyboardWhenTappedAround()
        tasksStack.isHidden = true
        locationBtn()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.topItem?.title = "Home"
    }
    
    func setupCells(){
        operationCollectionView.register(UINib(nibName: "OperationCell", bundle: nil), forCellWithReuseIdentifier: "OperationCell")
        operationCollectionView.delegate = self
        operationCollectionView.dataSource = self
        
        tasksTableView.register(UINib(nibName: "TaskCell", bundle: nil), forCellReuseIdentifier: "TaskCell")
        tasksTableView.delegate = self
        tasksTableView.dataSource = self
    }
    
    func setupPickerView(){
        delayTimeTf.delegate = self
        timesPicker!.delegate = self
        timesPicker!.dataSource = self
        delayTimeTf.inputView = timesPicker
    }
    
    func makeInputsEmpty(){
        firstNumberTf.text = ""
        secondNumberTf.text = ""
        delayTimeTf.text = ""
        isOperationSelected = false
        selectedOperation = ""
        selectedDelayTime = 0
        operationCollectionView.reloadData()
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        guard let firstNumber = firstNumberTf.text, !firstNumber.isEmpty else{
            showAlert(title: "First Number", message: "Please enter the first number")
            return
        }
        guard isOperationSelected else{
            showAlert(title: "Operation", message: "Please select the operator")
            return
        }
        guard let secondNumber = secondNumberTf.text, !secondNumber.isEmpty else{
            showAlert(title: "Second Number", message: "Please enter the second number")
            return
        }
        guard let delayTime = delayTimeTf.text, !delayTime.isEmpty else{
            showAlert(title: "Delay Time", message: "Please enter the Delay Time")
            return
        }
        
        tasks.append(TaskModel(operation: selectedOperation, firstNumber: Double(firstNumber) ?? 0, secondNumber: Double(secondNumber) ?? 0, delayTime: selectedDelayTime))
        tasksTableHeight.constant = CGFloat(tasks.count * 80)
        tasksTableView.beginUpdates()
        tasksTableView.insertRows(at: [IndexPath(row: (tasks.count - 1), section: 0)], with: .automatic)
        tasksTableView.endUpdates()
        tasksCountLb.text = "\(tasks.count) Tasks"
        tasksStack.isHidden = false
        makeInputsEmpty()
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        tasksStack.isHidden = true
        tasks = []
        tasksTableView.reloadData()
        makeInputsEmpty()
    }
    
}
