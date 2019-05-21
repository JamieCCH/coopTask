//
//  Task1ViewController.swift
//  Task3of3
//
//  Created by Jamie on 2018/8/17.
//  Copyright © 2018 Jamie. All rights reserved.
//

import UIKit

class Task1ViewController: UIViewController {

    @IBOutlet weak var task1Que: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let filepath = Bundle.main.path(forResource: "Task1", ofType: "txt") {
            do {
                let contents = try String(contentsOfFile: filepath)
                 task1Que.text = contents
            } catch {
                print("uh")
            }
        }
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
