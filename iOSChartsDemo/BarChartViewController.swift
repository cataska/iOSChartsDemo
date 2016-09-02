//
//  BarChartViewController.swift
//  iOSChartsDemo
//
//  Created by Joyce Echessa on 6/12/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

import UIKit
import Charts

class BarChartViewController: UIViewController, ChartViewDelegate {

    @IBOutlet weak var barChartView: BarChartView!
    var months: [String]!
    var maxUnits: Double!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        barChartView.delegate = self
        let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
        maxUnits = unitsSold.maxElement()
        setChart(months, values: unitsSold)
    }

    func setChart(dataPoints: [String], values: [Double]) {
        barChartView.noDataText = "You need to provide data for the chart."
        
        let formato: BarChartFormatter = BarChartFormatter()
        let xaxis: XAxis = XAxis()
        var dataEntries: [BarChartDataEntry] = []
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(x: Double(i), y: values[i])
            dataEntries.append(dataEntry)
            formato.stringForValue(Double(i), axis: xaxis)
        }
        xaxis.valueFormatter = formato
        
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "Units Sold")
        let chartData = BarChartData(dataSet: chartDataSet)
        chartDataSet.colors = ChartColorTemplates.colorful()
        
        barChartView.xAxis.valueFormatter = xaxis.valueFormatter
        barChartView.data = chartData
        barChartView.backgroundColor = UIColor(red: 189/255, green: 195/255, blue: 199/255, alpha: 1)
        barChartView.descriptionText = ""
        barChartView.xAxis.labelPosition = .Bottom
        barChartView.leftAxis.axisMinimum = 0
        barChartView.leftAxis.axisMaximum = maxUnits + 1
        
        //barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .EaseInBounce)
        
        let ll = ChartLimitLine(limit: 10.0, label: "Target")
        barChartView.rightAxis.addLimitLine(ll)
    }
    
    func chartValueSelected(chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print("\(entry.y) in \(months[Int(entry.x)])")
    }

    @IBAction func saveChart(sender: UIBarButtonItem) {
        barChartView.saveToCameraRoll()
    }
}
