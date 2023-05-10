//
//  AEChartViewController.swift
//  AccessibilityExample
//
//  Created by Nelson Chim on 9/5/2023.
//

import Charts
import UIKit


class AELineChartView: LineChartView, AXChart {
    let yData: [Double]
    
    var accessibilityChartDescriptor: AXChartDescriptor? {
        get {
            AXChartDescriptor(
                title: "Example Graph",
                summary: "This graph shows example data.",
                xAxis: xAXAxis,
                yAxis: yAXAxis,
                series: series
            )
        }
        set { }
    }
    
    private var series: [AXDataSeriesDescriptor] {
        let dataPointsSeries = yData.enumerated().map { index, yValue in
            AXDataPoint(x: Double(index), y: yValue)
        }
        return [
            AXDataSeriesDescriptor(
                name: "Data Series 1",
                isContinuous: true,
                dataPoints: dataPointsSeries
            )
        ]
    }
    
    private var xAXAxis: AXNumericDataAxisDescriptor {
        AXNumericDataAxisDescriptor(
            title: "Day",
            range: (1...Double(yData.count)),
            gridlinePositions: [],
            valueDescriptionProvider: { (value: Double) -> String in
                "\(value)"
            }
        )
    }
    
    private var yAXAxis: AXNumericDataAxisDescriptor {
        AXNumericDataAxisDescriptor(
            title: "Value",
            range: (0...Double(yData.max() ?? 0)),
            gridlinePositions: [],
            valueDescriptionProvider: { (value: Double) -> String in
                "\(value)"
            }
        )
    }
    
    init(yData: [Double]) {
        self.yData = yData
        super.init(frame: .zero)
        let dataSet: [ChartDataEntry] = yData.enumerated().map { (index, yValue) -> ChartDataEntry in
            return ChartDataEntry(x: Double(index), y: yValue)
        }
        
        let lineChartDataset1 = LineChartDataSet(entries: dataSet, label: "data")
        data = LineChartData(dataSet: lineChartDataset1)
        setScaleEnabled(false)
        isAccessibilityElement = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class AEChartViewController: UIViewController {
    
    private let yData: [Double] = [0.1, 0.5, 1.5, 0.3, 0.2, 5, 3, 2, 1, 0]
    
    var lineChart: AELineChartView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        let lineChart = AELineChartView(yData: yData)
        lineChart.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(lineChart)
        self.lineChart = lineChart
    }
    
    func setupConstraints() {
        lineChart?.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        lineChart?.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        lineChart?.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        lineChart?.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
    }
}
