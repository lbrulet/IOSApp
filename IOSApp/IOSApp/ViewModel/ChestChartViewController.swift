//
//  ChestChartViewController.swift
//  IOSApp
//
//  Created by Lancia Romain on 20/9/19.
//  Copyright © 2019 Luc Brulet. All rights reserved.
//

import UIKit
import SwiftChart

let BARBELL_BP_STRING = "Barbell bench press"
let CABLE_FLY_STRING = "Cable Fly"
let CHEST_DIPS_STRING = "Chest Dips"
let DECLINED_BARBELL_BP_STRING = "Declined Barbell Bench Press"
let INCLINED_BARBELL_BP_STRING = "Inclined Barbell Bench Press"
let DUMBELL_SQUEEZE_PRESS_STRING = "Dumbell Squeeze Press"

class ChestChartViewController: UIViewController {

    var dataController: DataChartSeries!
    
    @IBOutlet weak var barbellBPLabel: UILabel!
    @IBOutlet weak var cableFlyLabel: UILabel!
    @IBOutlet weak var chestDipsLabel: UILabel!
    @IBOutlet weak var declinedBarbellBPLabel: UILabel!
    @IBOutlet weak var inclinedBarbellBPLabel: UILabel!
    @IBOutlet weak var dumbellSqueesePressLabel: UILabel!
    
    @IBOutlet weak var switchBarbellBP: UISwitch!
    @IBOutlet weak var switchCableFly: UISwitch!
    @IBOutlet weak var switchChestDips: UISwitch!
    @IBOutlet weak var switchDeclinedBarbellBP: UISwitch!
    @IBOutlet weak var switchInclinedBarbellBP: UISwitch!
    @IBOutlet weak var switchDumbellSqueesePress: UISwitch!
    
    @IBOutlet weak var chart: Chart!
    
    @IBAction func swtichBarbellBPAction(_ sender: UISwitch) {
        if sender.isOn {
            let index = dataController.setDataStatus(name: BARBELL_BP_STRING, status: STATUS_ON)
            if (index >= 0) {
                chart.add(dataController.getOneData(index: index))
            }
        } else {
            let index: Int = dataController.setDataStatus(name: BARBELL_BP_STRING, status: STATUS_OFF)
            if (index >= 0) {
                chart.removeSeriesAt(index)
            }
        }
    }
    
    @IBAction func switchCableFlyAction(_ sender: UISwitch) {
        if sender.isOn {
            let index = dataController.setDataStatus(name: CABLE_FLY_STRING, status: STATUS_ON)
            if (index >= 0) {
                chart.add(dataController.getOneData(index: index))
            }
        } else {
            let index: Int = dataController.setDataStatus(name: CABLE_FLY_STRING, status: STATUS_OFF)
            if (index >= 0) {
                chart.removeSeriesAt(index)
            }
        }
    }
    
    @IBAction func switchChestDipsAction(_ sender: UISwitch) {
        if sender.isOn {
            let index = dataController.setDataStatus(name: CHEST_DIPS_STRING, status: STATUS_ON)
            if (index >= 0) {
                chart.add(dataController.getOneData(index: index))
            }
        } else {
            let index: Int = dataController.setDataStatus(name: CHEST_DIPS_STRING, status: STATUS_OFF)
            if (index >= 0) {
                chart.removeSeriesAt(index)
            }
        }
    }
    
    @IBAction func switchDeclinedBarbellBPAction(_ sender: UISwitch) {
        if sender.isOn {
            let index = dataController.setDataStatus(name: DECLINED_BARBELL_BP_STRING, status: STATUS_ON)
            if (index >= 0) {
                chart.add(dataController.getOneData(index: index))
            }
        } else {
            let index: Int = dataController.setDataStatus(name: DECLINED_BARBELL_BP_STRING, status: STATUS_OFF)
            if (index >= 0) {
                chart.removeSeriesAt(index)
            }
        }
    }
    
    @IBAction func switchInclinedBarbellBPAction(_ sender: UISwitch) {
        if sender.isOn {
            let index = dataController.setDataStatus(name: INCLINED_BARBELL_BP_STRING, status: STATUS_ON)
            if (index >= 0) {
                chart.add(dataController.getOneData(index: index))
            }
        } else {
            let index: Int = dataController.setDataStatus(name: INCLINED_BARBELL_BP_STRING, status: STATUS_OFF)
            if (index >= 0) {
                chart.removeSeriesAt(index)
            }
        }
    }
    
    @IBAction func switchDumbellSqueesePressAction(_ sender: UISwitch) {
        if sender.isOn {
            let index = dataController.setDataStatus(name: DUMBELL_SQUEEZE_PRESS_STRING, status: STATUS_ON)
            if (index >= 0) {
                chart.add(dataController.getOneData(index: index))
            }
        } else {
            let index: Int = dataController.setDataStatus(name: DUMBELL_SQUEEZE_PRESS_STRING, status: STATUS_OFF)
            if (index >= 0) {
                chart.removeSeriesAt(index)
            }
        }
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        performSegue(withIdentifier: "backChart", sender: self)
    }
    
    @IBAction func goBiceps(_ sender: UIButton) {
        performSegue(withIdentifier: "bicepsChart", sender: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // DATA TEST
        let curlStat:[(Double, Double)] = [
            (x: 1, y: 0),
            (x: 2, y: 2.5),
            (x: 3, y: 2),
            (x: 4, y: 2.3),
            (x: 5, y: 3),
            (x: 6, y: 2.2),
            (x: 7, y: 2.5),
            (x: 8, y: 2.5),
            (x: 9, y: 2.5),
            (x: 10, y: 2.5)
        ]
        let curlSeries = ChartSeries(data: curlStat)
        
        curlSeries.area = true
        curlSeries.color = COLOR_RED
        
        let pumpsStat:[(Double, Double)] = [
            (x: 1, y: 1.0),
            (x: 2, y: 2.0),
            (x: 3, y: 1.5),
            (x: 4, y: 1.0),
            (x: 5, y: 2.0),
            (x: 6, y: 2.5),
            (x: 7, y: 2.5),
            (x: 8, y: 2.5),
            (x: 9, y: 3.0),
            (x: 10, y: 2.0)
        ]
        let pumpsSeries = ChartSeries(data: pumpsStat)
        pumpsSeries.area = true
        pumpsSeries.color = COLOR_BLUE
        
        let dipsStat:[(Double, Double)] = [
            (x: 1, y: 1.0),
            (x: 2, y: 2.0),
            (x: 3, y: 2.5),
            (x: 4, y: 3.0),
            (x: 5, y: 3.0),
            (x: 6, y: 4.5),
            (x: 7, y: 4.5),
            (x: 8, y: 4.5),
            (x: 9, y: 3.0),
            (x: 10, y: 3.0)
        ]
        let dipsSeries = ChartSeries(data: dipsStat)
        dipsSeries.area = true
        dipsSeries.color = COLOR_ORANGE
        
        let hammerCurlStat:[(Double, Double)] = [
            (x: 1, y: 4.0),
            (x: 2, y: 2.0),
            (x: 3, y: 1.5),
            (x: 4, y: 3.0),
            (x: 5, y: 2.0),
            (x: 6, y: 3.0),
            (x: 7, y: 2.5),
            (x: 8, y: 3.5),
            (x: 9, y: 4.0),
            (x: 10, y: 3.0)
        ]
        let hammerCurlSeries = ChartSeries(data: hammerCurlStat)
        hammerCurlSeries.area = true
        hammerCurlSeries.color = COLOR_PURPLE
        
        let inclinedPumpsStat:[(Double, Double)] = [
            (x: 1, y: 1.0),
            (x: 2, y: 2.0),
            (x: 3, y: 1.5),
            (x: 4, y: 1.0),
            (x: 5, y: 2.0),
            (x: 6, y: 1.0),
            (x: 7, y: 1.5),
            (x: 8, y: 1.5),
            (x: 9, y: 1.0),
            (x: 10, y: 1.0)
        ]
        let inclinedPumpsSeries = ChartSeries(data: inclinedPumpsStat)
        inclinedPumpsSeries.area = true
        inclinedPumpsSeries.color = COLOR_PINK
        
        let ropeExtensionStat:[(Double, Double)] = [
            (x: 1, y: 3.0),
            (x: 2, y: 3.0),
            (x: 3, y: 3.5),
            (x: 4, y: 3.0),
            (x: 5, y: 3.0),
            (x: 6, y: 2.0),
            (x: 7, y: 2.5),
            (x: 8, y: 2.5),
            (x: 9, y: 3.0),
            (x: 10, y: 3.0)
        ]
        let ropeExtensionSeries = ChartSeries(data: ropeExtensionStat)
        ropeExtensionSeries.area = true
        ropeExtensionSeries.color = COLOR_GREEN
        // END TEST
        
        dataController = DataChartSeries(dataSet: [(STATUS_ON, curlSeries, BARBELL_BP_STRING, COLOR_RED), (STATUS_ON, pumpsSeries, CABLE_FLY_STRING, COLOR_BLUE), (STATUS_ON, dipsSeries, CHEST_DIPS_STRING, COLOR_ORANGE), (STATUS_ON, hammerCurlSeries, DECLINED_BARBELL_BP_STRING, COLOR_PURPLE), (STATUS_ON, inclinedPumpsSeries, INCLINED_BARBELL_BP_STRING, COLOR_PINK), (STATUS_ON, ropeExtensionSeries, DUMBELL_SQUEEZE_PRESS_STRING, COLOR_GREEN)])
        
        //CHART INIT
        chart.xLabels = [1,2,3,4,5,6,7,8,9,10]
        chart.xLabelsFormatter = { String(Int(round($1))) + "d" }
        chart.yLabelsFormatter = { String(Int($1)) +  "kgs" }
        
        chart.add(dataController.getDataOn())
        
        // LABELS COLOR
        var labels = [barbellBPLabel, cableFlyLabel, chestDipsLabel, declinedBarbellBPLabel, inclinedBarbellBPLabel, dumbellSqueesePressLabel]
        for (index, item) in (dataController.getData()).enumerated() {
            labels[index] = setLabelColor(label: labels[index]!, color: item.3)
        }
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
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        super.viewWillTransition(to: size, with: coordinator)
        
        // Redraw chart on rotation
        chart.setNeedsDisplay()
        
    }

}
