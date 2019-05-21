//
//  Task3ViewController.swift
//  Task3of3
//
//  Created by Jamie on 2018/8/17.
//  Copyright © 2018 Jamie. All rights reserved.
//

import UIKit

class Task3ViewController: UIViewController {
    
     @IBOutlet weak var task3Que: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let filepath = Bundle.main.path(forResource: "Task3", ofType: "txt") {
            do {
                let contents = try String(contentsOfFile: filepath)
                task3Que.text = contents
            } catch {
                // contents could not be loaded
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
