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
    var removedData: [(String, ChartSeries, String)] = []
    
    init (dataSet: [(String, ChartSeries, String)]) {
        
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
            if (item.0 == STATUS_ON) {
                res.append(item.1)
            }
        }
        return res
    }
    
    mutating func setDataStatus(name: String, status: String) -> Int {
        if (status == STATUS_OFF) {
            for (index, item) in (self.data).enumerated() {
                if (item.2 == name) {
                    self.data[index].0 = status
                    (self.removedData).append((self.data)[index])
                    (self.data).remove(at: index)
                    return index
                }
            }
        } else if (status == STATUS_ON) {
            for (index, item) in (self.removedData).enumerated() {
                if (item.2 == name) {
                    self.removedData[index].0 = status
                    (self.data).append((self.removedData)[index])
                    (self.removedData).remove(at: index)
                    return (self.data).count - 1
                }
            }
        }
        return -1
    }
}
