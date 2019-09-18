//
//  ChartViewController.swift
//  IOSApp
//
//  Created by Lancia Romain on 18/9/19.
//  Copyright © 2019 Luc Brulet. All rights reserved.
//

import UIKit
import SwiftChart

class ChartViewController: UIViewController {

    var curlStat:[(Double, Double)] = [
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
    var pumpsStat:[(Double, Double)] = [
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
    var dipsStat:[(Double, Double)] = [
        (x: 1, y: 1.0),
        (x: 2, y: 1.2),
        (x: 3, y: 1.4),
        (x: 4, y: 1.6),
        (x: 5, y: 1.8),
        (x: 6, y: 1.4),
        (x: 7, y: 2.0),
        (x: 8, y: 2.2),
        (x: 9, y: 2.0),
        (x: 10, y: 2.0)
    ]
    
    var curlSeries = ChartSeries(data: [(1,1)])
    var pumpsSeries = ChartSeries(data: [(1,1)])
    var dipsSeries = ChartSeries(data: [(1,1)])
    
    @IBOutlet weak var pumpsSwitch: UISwitch!
    @IBOutlet weak var curlSwitch: UISwitch!
    @IBOutlet weak var chart: Chart!
    @IBAction func switchAction(_ sender: Any) {

        let onStateCurlSwitch = curlSwitch.isOn
        let onStatePumpsStat = pumpsSwitch.isOn
        
        if onStateCurlSwitch {
            //add code is on
        } else {
            //add code is off
        }
        
        if onStatePumpsStat {
            // add code is on
        } else {
            //add code is off
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.curlSeries = ChartSeries(data: self.curlStat)
        self.pumpsSeries = ChartSeries(data: self.pumpsStat)
        self.dipsSeries = ChartSeries(data: self.dipsStat)
        
        self.curlSeries.area = true
        self.curlSeries.color = ChartColors.redColor()
        
        self.pumpsSeries.area = true
        self.pumpsSeries.color = ChartColors.blueColor()
        
        self.dipsSeries.area = true
        self.dipsSeries.color = ChartColors.orangeColor()
        
        chart.xLabels = [1,2,3,4,5,6,7,8,9,10]
        chart.xLabelsFormatter = { String(Int(round($1))) + "d" }
        
        chart.add([curlSeries, pumpsSeries, dipsSeries])
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
