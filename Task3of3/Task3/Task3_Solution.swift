//
//  Task3_Solution.swift
//  Task3of3
//
//  Created by Jamie on 2018/8/20.
//  Copyright © 2018 Jamie. All rights reserved.
//

import UIKit

class Task3_Solution: UIViewController {
    
    @IBOutlet weak var inputArray: UITextField!
    @IBOutlet weak var resultArray: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    func solution(givienArray:Array<Int>) -> Array<Int>{
        
        //Find the capital
        var givenArr = givienArray
        var cap = 0
        for i in 0..<givenArr.count{
            if givenArr[i] == i{
                cap = i
            }
        }
        
        //Check each city's distance from the capital
        var disArr:[Int] = []
        for i in 0..<givenArr.count{
            var index = i
            var distance = 0
            while (index != cap && index<givenArr.count){
                index = givenArr[index]
                distance += 1
                //For preventing the infinite loop (if there's no city conects with capitla)
                guard(distance<givenArr.count)else{
                    distance -= distance
                    break
                }
            }
            disArr.append(distance)
        }
        
        //count how many cities are located at each distance of 1,2,3...M-1
        var disCountArr=[Int](repeating: 0, count: givenArr.count)
        for i in disArr{
            let sum = 0
            disCountArr[sum] = 0
            if disArr.contains(where: { $0 == i }){
                disCountArr[i] += 1
            }
        }
        disCountArr.removeFirst() //we don't need the value of 0 (wich is the capital and supposed to be always 1)
        
        return disCountArr
    }
    
    @IBAction func check(_ sender: UIButton) {
        
        resultArray.text! = ""
        
        let toArray = inputArray.text!.components(separatedBy: ",")
        let convArr = toArray.compactMap{Int(String($0))}
        
        for i in convArr{
            guard i <= convArr.count else{
                let alertController = UIAlertController(title: "Error", message: "Please enter the intergers which are in the range of the total elements", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "Try again", style: UIAlertActionStyle.default, handler: nil))
                present(alertController, animated: true, completion: nil)
                resultArray.text! = ""
                return
            }
        }
        
        let showString = (solution(givienArray: convArr )).compactMap{String(Int($0))}
        resultArray.text = "[ "+showString.joined(separator: ", ")+" ]"
        
        print(inputArray.text!)
        print(resultArray.text!)
    }
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
