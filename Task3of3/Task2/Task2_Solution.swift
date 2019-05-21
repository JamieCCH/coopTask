//
//  Task2_Solution.swift
//  Task3of3
//
//  Created by Jamie on 2018/8/20.
//  Copyright © 2018 Jamie. All rights reserved.
//

import UIKit

class Task2_Solution: UIViewController {
    
    @IBOutlet weak var startLabel: UITextField!
    @IBOutlet weak var endLabel: UITextField!
    @IBOutlet weak var costLabel: UILabel!
    
    func solution(start: String, end: String) -> String{
        
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        let startDate = formatter.date(from: start)!
        let endDate = formatter.date(from: end)!
        let difference = endDate.timeIntervalSince(startDate)
        
        let enterFee = 2
        let initialFee = 3
        let hourFee = 4
        var parkingHours:Int
        var totalFee:Int
        
        parkingHours = Int(difference)/3600
        if(Int(difference)%3600 > 0){
            parkingHours += 1   //if there's remainder then it means there's partial hour
        }else if(parkingHours<0){
            parkingHours += 24
        }
        totalFee = enterFee + initialFee + (hourFee*(parkingHours - 1))
    
        print("parking time: \(Int(difference) / 3600)Hr \(Int(difference) % 3600 / 60)Min")
        print("parkingHours: \(parkingHours)")
        
        
        let dollarForm = NumberFormatter()
        dollarForm.locale = Locale.current
        dollarForm.numberStyle = .currency
        let formattedCost = dollarForm.string(from: totalFee as NSNumber)
        
        return formattedCost!
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func calculate(_ sender: UIButton) {
        costLabel.text = solution(start: startLabel.text!, end: endLabel.text!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
