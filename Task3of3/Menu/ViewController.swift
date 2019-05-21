//
//  ViewController.swift
//  Task3of3
//
//  Created by Jamie on 2018/8/17.
//  Copyright © 2018 Jamie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        
        guard let email = emailText.text, emailText.text?.count != 0, passwordText.text?.count != 0 else {
            let alertController = UIAlertController(title: "Login Failed", message: "Please confirm that both your email and password are entered", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Try again", style: UIAlertActionStyle.default, handler: nil))
            present(alertController, animated: true, completion: nil)
            return
        }
        
        if (!isValidEmail(emailAdd:email)){
            let alertController = UIAlertController(title: "Login Failed", message: "Please enter valid email address", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Try again", style: UIAlertActionStyle.default, handler: nil))
            present(alertController, animated: true, completion: nil)
        }else{
            let menu = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MenuNav")
            self.present(menu, animated: false, completion: nil)
        }
    }
    
    func isValidEmail(emailAdd:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,8}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: emailAdd)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

