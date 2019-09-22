//
//  ChartViewController.swift
//  IOSApp
//
//  Created by Lancia Romain on 18/9/19.
//  Copyright © 2019 Luc Brulet. All rights reserved.
//

import UIKit
import SwiftChart

let CURLL_STRING = "Curl"
let PUMPS_STRING = "Pumps"
let DIPS_STRING = "Dips"
let HAMMER_CURLL_STRING = "HammerCurl"
let INCLINED_PUMPS_STRING = "Inclined Pumps"
let ROPE_EXTENSION_STRING = "Rope Extension"

let STATUS_ON = "on"
let STATUS_OFF = "off"

let COLOR_PINK = UIColor(red: 1.0, green: 0.4, blue: 1.0, alpha: 1.0)
let COLOR_PURPLE = UIColor(red:0.67, green:0.50, blue:1.00, alpha:1.0)
let COLOR_RED = UIColor(red:1.00, green:0.00, blue:0.40, alpha:1.0)
let COLOR_BLUE = UIColor(red:0.20, green:0.60, blue:1.00, alpha:1.0)
let COLOR_ORANGE = UIColor(red:1.00, green:0.60, blue:0.20, alpha:1.0)
let COLOR_GREEN = UIColor(red:0.36, green:0.84, blue:0.36, alpha:1.0)

class ChartViewController: UIViewController {

    var dataController: DataChartSeries!
    
    @IBOutlet weak var curlLabel: UILabel!
    @IBOutlet weak var pumpsLabel: UILabel!
    @IBOutlet weak var dipsLabel: UILabel!
    @IBOutlet weak var hammerCurlLabel: UILabel!
    @IBOutlet weak var inclinedPumpsLabel: UILabel!
    @IBOutlet weak var ropeExtensionLabel: UILabel!
    
    @IBOutlet weak var chart: Chart!
    
    @IBOutlet weak var switchCurl: UISwitch!
    @IBOutlet weak var switchPumps: UISwitch!
    @IBOutlet weak var switchDips: UISwitch!
    @IBOutlet weak var switchHammerCurl: UISwitch!
    @IBOutlet weak var switchInclinedPumps: UISwitch!
    @IBOutlet weak var switchRopeExtension: UISwitch!
    @IBOutlet weak var labeltest: UILabel!
    
    @IBAction func goChest(_ sender: UIButton) {
        performSegue(withIdentifier: "chestChart", sender: self)
    }
    
    @IBAction func goBiceps(_ sender: UIButton) {
        performSegue(withIdentifier: "bicepsChart", sender: self)
    }
    
    @IBAction func switchCurlAction(_ sender: UISwitch) {
        if sender.isOn {
            let index = dataController.setDataStatus(name: CURLL_STRING, status: STATUS_ON)
            if (index >= 0) {
                chart.add(dataController.getOneData(index: index))
            }
        } else {
            let index: Int = dataController.setDataStatus(name: CURLL_STRING, status: STATUS_OFF)
            if (index >= 0) {
                chart.removeSeriesAt(index)
            }
        }
    }
    
    @IBAction func switchPumpsAction(_ sender: UISwitch) {
        if sender.isOn {
            let index = dataController.setDataStatus(name: PUMPS_STRING, status: STATUS_ON)
            if (index >= 0) {
                chart.add(dataController.getOneData(index: index))
            }
        } else {
            let index: Int = dataController.setDataStatus(name: PUMPS_STRING, status: STATUS_OFF)
            if (index >= 0) {
                chart.removeSeriesAt(index)
            }
        }
    }
    
    @IBAction func switchDipsAction(_ sender: UISwitch) {
        if sender.isOn {
            let index = dataController.setDataStatus(name: DIPS_STRING, status: STATUS_ON)
            if (index >= 0) {
                chart.add(dataController.getOneData(index: index))
            }
        } else {
            let index: Int = dataController.setDataStatus(name: DIPS_STRING, status: STATUS_OFF)
            if (index >= 0) {
                chart.removeSeriesAt(index)
            }
        }
    }
    
    @IBAction func switchHammerCurlAction(_ sender: UISwitch) {
        if sender.isOn {
            let index = dataController.setDataStatus(name: HAMMER_CURLL_STRING, status: STATUS_ON)
            if (index >= 0) {
                chart.add(dataController.getOneData(index: index))
            }
        } else {
            let index: Int = dataController.setDataStatus(name: HAMMER_CURLL_STRING, status: STATUS_OFF)
            if (index >= 0) {
                chart.removeSeriesAt(index)
            }
        }
    }
    
    @IBAction func switchInclinedPumpsAction(_ sender: UISwitch) {
        if sender.isOn {
            let index = dataController.setDataStatus(name: INCLINED_PUMPS_STRING, status: STATUS_ON)
            if (index >= 0) {
                chart.add(dataController.getOneData(index: index))
            }
        } else {
            let index: Int = dataController.setDataStatus(name: INCLINED_PUMPS_STRING, status: STATUS_OFF)
            if (index >= 0) {
                chart.removeSeriesAt(index)
            }
        }
    }
    
    @IBAction func switchRopeExtensionAction(_ sender: UISwitch) {
        if sender.isOn {
            let index = dataController.setDataStatus(name: ROPE_EXTENSION_STRING, status: STATUS_ON)
            if (index >= 0) {
                chart.add(dataController.getOneData(index: index))
            }
        } else {
            let index: Int = dataController.setDataStatus(name: ROPE_EXTENSION_STRING, status: STATUS_OFF)
            if (index >= 0) {
                chart.removeSeriesAt(index)
            }
        }
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
        
        dataController = DataChartSeries(dataSet: [(STATUS_ON, curlSeries, CURLL_STRING, COLOR_RED), (STATUS_ON, pumpsSeries, PUMPS_STRING, COLOR_BLUE), (STATUS_ON, dipsSeries, DIPS_STRING, COLOR_ORANGE), (STATUS_ON, hammerCurlSeries, HAMMER_CURLL_STRING, COLOR_PURPLE), (STATUS_ON, inclinedPumpsSeries, INCLINED_PUMPS_STRING, COLOR_PINK), (STATUS_ON, ropeExtensionSeries, ROPE_EXTENSION_STRING, COLOR_GREEN)])
        
        //CHART INIT
        chart.xLabels = [1,2,3,4,5,6,7,8,9,10]
        chart.xLabelsFormatter = { String(Int(round($1))) + "d" }
        chart.yLabelsFormatter = { String(Int($1)) +  "kgs" }

        chart.add(dataController.getDataOn())
        
        // LABELS COLOR
        var labels = [curlLabel, pumpsLabel, dipsLabel, hammerCurlLabel, inclinedPumpsLabel, ropeExtensionLabel]
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
        //etNeedsDisplay()
        
    }
    
}
