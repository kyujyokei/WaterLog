//
//  LineChartViewController.swift
//  FriendlyChatSwift
//
//  Created by Kero on 2016/11/24.
//  Copyright © 2016年 Google Inc. All rights reserved.
//

/**********
 TODO:
 
 Create NSDate methods for calculate consumption amount by date
 
 *********/

import UIKit
import Charts


class LineChartViewController: UIViewController {
    
    @IBOutlet weak var LineChart: LineChartView!
    
    @IBAction func pressedCancel(sender: UIButton) {
        self.navigationController?.popViewControllerAnimated(true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        let months = ["Sat", "Sun", "Mon", "Tue", "Wed", "Today"]
        let unitsSold = [2204.0, 1987.0, 2017.0, 1598.0, 2202.0, 657.0]
        
        setChart(months, values: unitsSold)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setChart(dataPoints: [String], values: [Double]) {
        
        var dataEntries: [ChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = ChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        
        var colors: [UIColor] = []
        
        

        let lineChartDataSet = LineChartDataSet(yVals: dataEntries, label: "Water Consumed")
        let lineChartData = LineChartData(xVals: dataPoints, dataSet: lineChartDataSet)
        LineChart.data = lineChartData
        LineChart.animate(yAxisDuration: 1)
        
        
        let ll = ChartLimitLine(limit: 2000.0, label: "Target")
        ll.lineColor = waterColor
        LineChart.rightAxis.addLimitLine(ll)
        
    }



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
