//
//  BicepsChartViewController.swift
//  IOSApp
//
//  Created by Lancia Romain on 20/9/19.
//  Copyright © 2019 Luc Brulet. All rights reserved.
//

import UIKit
import SwiftChart

let HAMMER_CURL_STRING = "Hammer Curl"
let EZ_BAR_CURL_STRING = "Ez Bar Curl"
let CURL_STRING = "Curl"
let PULLOVER_STRING = "Pullover"
let CLOSE_GRIP_BP_STRING = "Close Grip Bench Press"
let REVERSE_CURL_STRING = "Reverse Curl"

class BicepsChartViewController: UIViewController {

    var dataController: DataChartSeries!
    
    @IBOutlet weak var chart: Chart!
    
    @IBOutlet weak var hammerCurlLabel: UILabel!
    @IBOutlet weak var ezBarCurlLable: UILabel!
    @IBOutlet weak var curlLabel: UILabel!
    @IBOutlet weak var pulloverLabel: UILabel!
    @IBOutlet weak var closeGripBPLabel: UILabel!
    @IBOutlet weak var reverseCurlLabel: UILabel!
    
    @IBOutlet weak var switchHammerCurl: UISwitch!
    @IBOutlet weak var switchEzBarCurl: UISwitch!
    @IBOutlet weak var switchCurl: UISwitch!
    @IBOutlet weak var switchPullover: UISwitch!
    @IBOutlet weak var switchCloseGripBP: UISwitch!
    @IBOutlet weak var switchReverseCurl: UISwitch!
    
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
    
    @IBAction func switchEzBarCurlAction(_ sender: UISwitch) {
        if sender.isOn {
            let index = dataController.setDataStatus(name: EZ_BAR_CURL_STRING, status: STATUS_ON)
            if (index >= 0) {
                chart.add(dataController.getOneData(index: index))
            }
        } else {
            let index: Int = dataController.setDataStatus(name: EZ_BAR_CURL_STRING, status: STATUS_OFF)
            if (index >= 0) {
                chart.removeSeriesAt(index)
            }
        }
    }
    
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
    
    @IBAction func switchPulloverAction(_ sender: UISwitch) {
        if sender.isOn {
            let index = dataController.setDataStatus(name: PULLOVER_STRING, status: STATUS_ON)
            if (index >= 0) {
                chart.add(dataController.getOneData(index: index))
            }
        } else {
            let index: Int = dataController.setDataStatus(name: PULLOVER_STRING, status: STATUS_OFF)
            if (index >= 0) {
                chart.removeSeriesAt(index)
            }
        }
    }
    
    @IBAction func switchCloseGripBPAction(_ sender: UISwitch) {
        if sender.isOn {
            let index = dataController.setDataStatus(name: CLOSE_GRIP_BP_STRING, status: STATUS_ON)
            if (index >= 0) {
                chart.add(dataController.getOneData(index: index))
            }
        } else {
            let index: Int = dataController.setDataStatus(name: CLOSE_GRIP_BP_STRING, status: STATUS_OFF)
            if (index >= 0) {
                chart.removeSeriesAt(index)
            }
        }
    }
    
    @IBAction func switchReverseCurlAction(_ sender: UISwitch) {
        if sender.isOn {
            let index = dataController.setDataStatus(name: REVERSE_CURL_STRING, status: STATUS_ON)
            if (index >= 0) {
                chart.add(dataController.getOneData(index: index))
            }
        } else {
            let index: Int = dataController.setDataStatus(name: REVERSE_CURL_STRING, status: STATUS_OFF)
            if (index >= 0) {
                chart.removeSeriesAt(index)
            }
        }
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        performSegue(withIdentifier: "backChart", sender: self)
    }
    
    @IBAction func goChest(_ sender: UIButton) {
        performSegue(withIdentifier: "chestChart", sender: self)
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
        
        dataController = DataChartSeries(dataSet: [(STATUS_ON, curlSeries, HAMMER_CURL_STRING, COLOR_RED), (STATUS_ON, pumpsSeries, EZ_BAR_CURL_STRING, COLOR_BLUE), (STATUS_ON, dipsSeries, CURL_STRING, COLOR_ORANGE), (STATUS_ON, hammerCurlSeries, PULLOVER_STRING, COLOR_PURPLE), (STATUS_ON, inclinedPumpsSeries, CLOSE_GRIP_BP_STRING, COLOR_PINK), (STATUS_ON, ropeExtensionSeries, REVERSE_CURL_STRING, COLOR_GREEN)])
        
        //CHART INIT
        chart.xLabels = [1,2,3,4,5,6,7,8,9,10]
        chart.xLabelsFormatter = { String(Int(round($1))) + "d" }
        chart.yLabelsFormatter = { String(Int($1)) +  "kgs" }
        
        chart.add(dataController.getDataOn())
        
        // LABELS COLOR
        var labels = [hammerCurlLabel, ezBarCurlLable, curlLabel, pulloverLabel, closeGripBPLabel, reverseCurlLabel]
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
