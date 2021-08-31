//
//  HomeViewController.swift
//  Basic Calculator
//
//  Created by Tariq on 31/08/2021.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var firstNumberTf: UITextField!
    @IBOutlet weak var operationCollectionView: UICollectionView!
    @IBOutlet weak var secondNumberTf: UITextField!
    @IBOutlet weak var delayTimeTf: UITextField!
    
    let operations = ["+", "-", "*", "/"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        operationCollectionView.register(UINib(nibName: "OperationCell", bundle: nil), forCellWithReuseIdentifier: "OperationCell")
        operationCollectionView.delegate = self
        operationCollectionView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.topItem?.title = "Home"
    }
    
    

}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return operations.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OperationCell", for: indexPath) as! OperationCell
        cell.operationLb.text = operations[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 40, height: 40)
    }
}
