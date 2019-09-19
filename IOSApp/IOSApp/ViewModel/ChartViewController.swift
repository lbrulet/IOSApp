//
//  ChartViewController.swift
//  IOSApp
//
//  Created by Lancia Romain on 18/9/19.
//  Copyright © 2019 Luc Brulet. All rights reserved.
//

import UIKit
import SwiftChart

let CURL_STRING = "Curl"
let PUMPS_STRING = "Pumps"
let DIPS_STRING = "Dips"
let HAMMER_CURL_STRING = "HammerCurl"
let INCLINED_PUMPS = "Inclined Pumps"
let ROPE_EXTENSION = "Rope Extension"
let STATUS_ON = "on"
let STATUS_OFF = "off"

class ChartViewController: UIViewController {

    var dataController: DataChartSeries!
    
    @IBOutlet weak var chart: Chart!
    @IBOutlet weak var switchCurl: UISwitch!
    @IBOutlet weak var switchPumps: UISwitch!
    @IBOutlet weak var switchDips: UISwitch!
    @IBOutlet weak var switchHammerCurl: UISwitch!
    @IBOutlet weak var switchInclinedPumps: UISwitch!
    @IBOutlet weak var switchRopeExtension: UISwitch!
    @IBOutlet weak var labeltest: UILabel!
    
    @IBAction func switchCurlAction(_ sender: UISwitch) {
        if sender.isOn {
            let index = dataController.setDataStatus(name: CURL_STRING, status: STATUS_ON)
            if (index >= 0) {
                chart.add(dataController.getOneData(index: index))
            }
        } else {
            let index: Int = dataController.setDataStatus(name: CURL_STRING, status: STATUS_OFF)
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
            let index = dataController.setDataStatus(name: HAMMER_CURL_STRING, status: STATUS_ON)
            if (index >= 0) {
                chart.add(dataController.getOneData(index: index))
            }
        } else {
            let index: Int = dataController.setDataStatus(name: HAMMER_CURL_STRING, status: STATUS_OFF)
            if (index >= 0) {
                chart.removeSeriesAt(index)
            }
        }
    }
    
    @IBAction func switchInclinedPumpsAction(_ sender: UISwitch) {
        if sender.isOn {
            let index = dataController.setDataStatus(name: INCLINED_PUMPS, status: STATUS_ON)
            if (index >= 0) {
                chart.add(dataController.getOneData(index: index))
            }
        } else {
            let index: Int = dataController.setDataStatus(name: INCLINED_PUMPS, status: STATUS_OFF)
            if (index >= 0) {
                chart.removeSeriesAt(index)
            }
        }
    }
    
    @IBAction func switchRopeExtensionAction(_ sender: UISwitch) {
        if sender.isOn {
            let index = dataController.setDataStatus(name: ROPE_EXTENSION, status: STATUS_ON)
            if (index >= 0) {
                chart.add(dataController.getOneData(index: index))
            }
        } else {
            let index: Int = dataController.setDataStatus(name: ROPE_EXTENSION, status: STATUS_OFF)
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
        curlSeries.color = ChartColors.redColor()
        
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
        pumpsSeries.color = ChartColors.blueColor()
        // END TEST
        
        dataController = DataChartSeries(dataSet: [("on", curlSeries, "Curl"), ("on", pumpsSeries, "Pumps")])
        
        chart.xLabels = [1,2,3,4,5,6,7,8,9,10]
        chart.xLabelsFormatter = { String(Int(round($1))) + "d" }
        
        chart.add(dataController.getDataOn())
        // Do any additional setup after loading the view.
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
