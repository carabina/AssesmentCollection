//
//  ViewController.swift
//  AssesmentTable
//
//  Created by Manikandan r on 07/11/17.
//  Copyright © 2017 Manikandan r. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: AssesmentCollectionView!
    
    @IBAction func reloadCollection(_ sender: Any) {
        // Can update the data content here.
        self.collectionView.reloadData()
    }
    // DATA
    
    let data :[[String]] = [
        ["Admission Date","Discharge Date","Duration", "Discharge Diagnosis (code and description)"],["Admission Date","Discharge Date","Duration", "Discharge Diagnosis (code and description)"],["Admission Date","Discharge Date","Duration", "Discharge Diagnosis (code and description)"],["Admission Date","Discharge Date","Duration", "Discharge Diagnosis (code and description)"],["Admission Date","Discharge Date","Duration", "Discharge Diagnosis (code and description)"],["Admission Date","Discharge Date","Duration", "Discharge Diagnosis (code and description)"],["Admission Date","Discharge Date","Duration", "Discharge Diagnosis (code and description)"],["Admission Date","Discharge Date","Duration", "Discharge Diagnosis (code and description)"],["Admission Date","Discharge Date","Duration", "Discharge Diagnosis (code and description)"],["Admission Date","Discharge Date","Duration", "Discharge Diagnosis (code and description)"],["Admission Date","Discharge Date","Duration", "Discharge Diagnosis (code and description)"],["Admission Date","Discharge Date","Duration", "Discharge Diagnosis (code and description)"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeCollection()
    }
    
    private func initializeCollection() {
        collectionView.collectionDelegate = self
        collectionView.collectionDatasource = self
        collectionView.headerFont = Font.heavy.uifont(withSize: 16)
        collectionView.contentFont = Font.medium.uifontWithDefaultSize()
        collectionView.showColumnSeperator = true
        collectionView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController:AssessmentCollectionDelegate,AssessmentCollectionDataSource {
    //DataSource
    func numberOfColumns(in collectionView:UICollectionView) -> Int {
        return data.first?.count ?? 0
    }
    
    func numberOfRows(in collectionView:UICollectionView) -> Int {
        return data.count
    }
    
    func titleForCell(in collectionView:UICollectionView, at indexpath: IndexPath) -> String {
        return data[indexpath.section][indexpath.row]
    }

    func collectionCell(isColumnSeperatorHidden indexpath : IndexPath) -> Bool {
        if indexpath.row == 0 {
            return false
        } else {
            return true
        }
    }
    
    func textAlignment(forCellat indexpath: IndexPath) -> NSTextAlignment {
        if indexpath.row == 0 {
            return .right
        } else {
            return .center
        }
    }
    //Delegate
    func didSelectRow(at indexPath: IndexPath) {
        print(indexPath.row,indexPath.section)
    }
}

