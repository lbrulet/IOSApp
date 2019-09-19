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
    var data: [ChartSeries]
    
    init (dataSet: [ChartSeries]) {
        
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
    
    func getData() -> [ChartSeries] {
        return self.data
    }
    
    func getDataOn(){
    }
    
}
