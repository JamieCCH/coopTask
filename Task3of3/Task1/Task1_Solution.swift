//
//  Task1_Solution.swift
//  Task3of3
//
//  Created by Jamie on 2018/8/19.
//  Copyright © 2018 Jamie. All rights reserved.
//

import UIKit

class Task1_Solution: UIViewController {

    @IBOutlet weak var exampleResult: UILabel!
    @IBOutlet weak var inputString: UITextField!
    @IBOutlet weak var calResult: UILabel!
    
    func wordMachine(givienString:String) -> String {
        
        var splitString = givienString.components(separatedBy: " ")
        var stack = [UInt32]()
        var reportError:Bool = false
        
        stringLoop: for i in 0..<splitString.count{
            let maxInt = UInt32((2<<19)-1)
            
            switch splitString[i]{
            case "POP":
                if stack.count > 0{
                    stack.removeFirst()
                }else{
                    reportError = true
                    break stringLoop
                }
            case "DUP":
                if i > 0 {
                    stack.append(stack.first!)
                }else{
                    reportError = true
                    break stringLoop
                }
            case "+":
                if stack.count>1{
                    let topMost1 = stack.removeFirst()
                    let topMost2 = stack.removeFirst()
                    let sum:UInt32 = topMost1 + topMost2
                    if sum < maxInt{
                        stack.append(sum)
                    }else{
                        reportError = true
                        break stringLoop
                    }
                }
            case "-":
                if stack.count>1{
                    let topMost1 = stack.removeFirst()
                    let topMost2 = stack.removeFirst()
                    if topMost1>topMost2{
                        let sub = topMost1 - topMost2
                        stack.append(sub)
                    }else{
                        reportError = true
                        break stringLoop
                    }
                }
            default:
                if let int = UInt32(splitString[i]){
                    if int > 0 && int < maxInt{
                        stack.append(int)
                    }else{
                        reportError = true
                        break stringLoop
                    }
                }
            }
        }
        if stack.count > 0 && reportError != true{
            let finalResult = stack.first
            return String(finalResult!)
        }else{
            errorAlert()
            return "error"
        }
    }
    
    func errorAlert(){
        let alert = UIAlertController(title: "Error", message: "Operation Failed", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Try again", style: UIAlertActionStyle.default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        exampleResult.text! = wordMachine(givienString: "13 DUP 4 POP 5 DUP + DUP + -")
    }
    
    @IBAction func operation(_ sender: UIButton) {
        calResult.text! = wordMachine(givienString: (inputString.text)!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
