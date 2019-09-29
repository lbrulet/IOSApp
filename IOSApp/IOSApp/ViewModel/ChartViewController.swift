//
//  ChartViewController.swift
//  IOSApp
//
//  Created by Lancia Romain on 18/9/19.
//  Copyright © 2019 Luc Brulet. All rights reserved.
//

import UIKit
import SwiftChart

let STATUS_ON = "on"
let STATUS_OFF = "off"

let COLOR_PINK = UIColor(red: 1.0, green: 0.4, blue: 1.0, alpha: 1.0)
let COLOR_PURPLE = UIColor(red:0.67, green:0.50, blue:1.00, alpha:1.0)
let COLOR_RED = UIColor(red:1.00, green:0.00, blue:0.40, alpha:1.0)
let COLOR_BLUE = UIColor(red:0.20, green:0.60, blue:1.00, alpha:1.0)
let COLOR_ORANGE = UIColor(red:1.00, green:0.60, blue:0.20, alpha:1.0)
let COLOR_GREEN = UIColor(red:0.36, green:0.84, blue:0.36, alpha:1.0)

class ChartViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
   
    @IBOutlet weak var collectionView: UICollectionView!
    var Data: DataChartSeries!
    var current:String = "Chest"
    var listMuscle:[WeightCollector] = []
    @IBOutlet weak var chart: Chart!
    
    @IBAction func BackBtn(_ sender: Any) {
        self.current = "Back"
        chart.removeAllSeries()
        Data = user.getMuscleDataChart(typeMuscle: current)
        listMuscle = user.getListMuscle(typeMuscle: current)
        var index = 0
        for item in listMuscle {
            let cell = self.collectionView.cellForItem(at: IndexPath(row: index, section: 0))
            let titleView = cell?.viewWithTag(1001) as? UILabel
            
            if let titleView = titleView {
                titleView.text = item.label
            }
            index += 1
        }
        chart.add(Data.getDataOn())
        collectionView.reloadData()
    }

    @IBAction func ChestBtn(_ sender: Any) {
        self.current = "Chest"
        chart.removeAllSeries()
        Data = user.getMuscleDataChart(typeMuscle: current)
        listMuscle = user.getListMuscle(typeMuscle: current)
        var index = 0
        for item in listMuscle {
            let cell = self.collectionView.cellForItem(at: IndexPath(row: index, section: 0))
            let titleView = cell?.viewWithTag(1001) as? UILabel
            
            if let titleView = titleView {
                titleView.text = item.label
            }
            index += 1
        }
        chart.add(Data.getDataOn())
        collectionView.reloadData()
    }
    
    @IBAction func BicepsBtn(_ sender: Any) {
        self.current = "Biceps"
        chart.removeAllSeries()
        Data = user.getMuscleDataChart(typeMuscle: current)
        listMuscle = user.getListMuscle(typeMuscle: current)
        var index = 0
        for item in listMuscle {
            let cell = self.collectionView.cellForItem(at: IndexPath(row: index, section: 0))
            let titleView = cell?.viewWithTag(1001) as? UILabel
            
            if let titleView = titleView {
                titleView.text = item.label
            }
            index += 1
        }
        chart.add(Data.getDataOn())
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listMuscle.count
    }
    
    @IBAction func yourFunc(switchView: UISwitch) {
        if switchView.isOn {
            let index = Data.setDataStatus(name: listMuscle[switchView.tag].label, status: STATUS_ON)
            if (index >= 0) {
                chart.add(Data.getOneData(index: index))
            }
        } else {
            let index: Int = Data.setDataStatus(name: listMuscle[switchView.tag].label, status: STATUS_OFF)
            if (index >= 0) {
                chart.removeSeriesAt(index)
            }
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        let switchView = cell.viewWithTag(1000) as? UISwitch
        let titleView = cell.viewWithTag(1001) as? UILabel
        
        if let titleView = titleView, let switchView = switchView {
        titleView.text = self.listMuscle[indexPath.row].label
        titleView.textColor = self.listMuscle[indexPath.row].color
        switchView.tag = indexPath.row
        switchView.addTarget(self, action: #selector(yourFunc),
                                 for: UIControl.Event.valueChanged)
        }
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        setData()
    }
    
    func setData() {
        chart.removeAllSeries()
        if (current == "Chest") {
            
            
            Data = user.getMuscleDataChart(typeMuscle: current)
            listMuscle = user.getListMuscle(typeMuscle: current)
        }
        //CHART INIT
        chart.xLabels = [1,2,3,4,5,6,7,8,9,10]
        chart.xLabelsFormatter = { String(Int(round($1))) + "d" }
        chart.yLabelsFormatter = { String(Int($1)) +  "kgs" }
        
        chart.add(Data.getDataOn())
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setData()
        super.viewWillAppear(animated)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func didTouchChart(_ chart: Chart, indexes: Array<Int?>, x: Double, left: CGFloat) {
        for (seriesIndex, dataIndex) in indexes.enumerated() {
            if let value = chart.valueForSeries(seriesIndex, atIndex: dataIndex) {
                print("Touched series: \(seriesIndex): data index: \(dataIndex!); series value: \(value); x-axis value: \(x) (from left: \(left))")
            }
        }
    }
    
    func didFinishTouchingChart(_ chart: Chart) {
        
    }
    
    func didEndTouchingChart(_ chart: Chart) {
        
    }
    
}
