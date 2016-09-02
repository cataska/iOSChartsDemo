//
//  BarChartFormatter.swift
//  iOSChartsDemo
//
//  Created by Lin Wen Chun on 2016/9/2.
//  Copyright © 2016年 Appcoda. All rights reserved.
//

import Foundation
import Charts

class BarChartFormatter: NSObject, IAxisValueFormatter {
    var months: [String]! = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    
    func stringForValue(value: Double, axis: AxisBase?) -> String {
        return months[Int(value)]
    }
}