//
//  Task2ViewController.swift
//  Task3of3
//
//  Created by Jamie on 2018/8/17.
//  Copyright © 2018 Jamie. All rights reserved.
//

import UIKit

class Task2ViewController: UIViewController {

    @IBOutlet weak var task2Que: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let filepath = Bundle.main.path(forResource: "Task2", ofType: "txt") {
            do {
                let contents = try String(contentsOfFile: filepath)
                task2Que.text = contents
            } catch {
                // contents could not be loaded
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
