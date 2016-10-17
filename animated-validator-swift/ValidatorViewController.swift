//
//  ValidatorViewController.swift
//  animated-validator-swift
//
//  Created by Flatiron School on 6/27/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ValidatorViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailConfirmationTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmTextField: UITextField!


    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view, typically from a nib.x
        
        self.submitButton.accessibilityLabel = Constants.SUBMITBUTTON
        self.emailTextField.accessibilityLabel = Constants.EMAILTEXTFIELD
        self.emailConfirmationTextField.accessibilityLabel = Constants.EMAILCONFIRMTEXTFIELD
        self.phoneTextField.accessibilityLabel = Constants.PHONETEXTFIELD
        self.passwordTextField.accessibilityLabel = Constants.PASSWORDTEXTFIELD
        self.passwordConfirmTextField.accessibilityLabel = Constants.PASSWORDCONFIRMTEXTFIELD
        
        self.submitButton.isEnabled = true
    }
  
    
    @IBAction func emailTextInput(_ sender: AnyObject) {
        if (emailTextField.text?.contains("@"))! && (emailTextField.text?.contains("."))!{
            emailTextField.backgroundColor = UIColor.green
            } else {
                emailTextField.shake(count: 4, for: 1.0, withTanslation: 10)
                emailTextField.backgroundColor = UIColor.red
            }
        }
    

    @IBAction func confirmEmail(_ sender: AnyObject) {
        if emailConfirmationTextField.text == emailTextField.text {
            emailConfirmationTextField.backgroundColor = UIColor.green
        } else{
            emailConfirmationTextField.shake(count: 4, for: 1.0, withTanslation: 10)
            emailConfirmationTextField.backgroundColor = UIColor.red
        }
    }
    
    @IBAction func inputPhone(_ sender: AnyObject) {
        if ((phoneTextField.text?.characters.count)! == 11) && (Int((phoneTextField.text)!)  != nil) {
            phoneTextField.backgroundColor = UIColor.green
            print("valid")
        } else {
            phoneTextField.shake(count: 4, for: 1.0, withTanslation: 10)
            phoneTextField.backgroundColor = UIColor.red
            print("invalid")
        }
            }
    
    @IBAction func inputPassword(_ sender: AnyObject) {
        if (passwordTextField.text?.characters.count)! >= 6{
            passwordTextField.backgroundColor = UIColor.green
        } else {
            passwordTextField.shake(count: 4, for: 1.0, withTanslation: 10)
            passwordTextField.backgroundColor = UIColor.red
        }
        
    }
    
    @IBAction func confirmPassword(_ sender: AnyObject) {
        if passwordConfirmTextField.text == passwordTextField.text{
            passwordConfirmTextField.backgroundColor = UIColor.green
        } else{
            passwordConfirmTextField.shake(count: 4, for: 1.0, withTanslation: 10)
            passwordConfirmTextField.backgroundColor = UIColor.red
        }
    }
    
}

public extension UIView {
    
    func shake(count : Float? = nil,for duration : TimeInterval? = nil,withTanslation translation : Float? = nil) {
        let animation : CABasicAnimation = CABasicAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        
        animation.repeatCount = count ?? 2
        animation.duration = (duration ?? 0.5)/TimeInterval(animation.repeatCount)
        animation.autoreverses = true
        animation.byValue = translation ?? -5
        layer.add(animation, forKey: "shake")
        
    }

    
    
    
    }








