//
//  Chart.swift
//  IOSApp
//
//  Created by Lancia Romain on 19/9/19.
//  Copyright © 2019 Luc Brulet. All rights reserved.
//

import Foundation
import SwiftChart

struct DataChartSeries {
    var data: [(String, ChartSeries, String)]
    var removeData: [(String, ChartSeries, String)] = []
    
    init (dataSet: [(String, ChartSeries, String)]) {
        
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
        
        self.data = dataSet
    }
    
    func getData() -> [(String, ChartSeries, String)] {
        return self.data
    }
    
    func getOneData(index: Int) -> [ChartSeries] {
        return [(self.data)[index].1]
    }
    
    func getDataOn() -> [ChartSeries] {
        var res: [ChartSeries] = []
        
        for item in self.data {
            if (item.0 == "on") {
                res.append(item.1)
            }
        }
        return res
    }
    
    mutating func setDataStatus(name: String, status: String) -> Int {
        for (index, item) in (self.data).enumerated() {
            if (item.2 == name) {
                self.data[index].0 = status
                return index
            }
        }
        return -1
    }
}
