//
//  ViewController.swift
//  SimpleLoginForm
//
//  Created by SHILEI CUI on 3/11/19.
//  Copyright © 2019 scui5. All rights reserved.
//

import UIKit

// first add UITextFieldDelegate protocal
class ViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {

    @IBOutlet weak var appleID: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var uiTextViewOutlet: UITextView!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    var text : String?
    var pw : String?
    var str : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // we can also set delegate using storyboard which click corresponding textfield and right click select delegate link to viewcontroller
//        appleID.delegate = self
//        password.delegate = self
        //open keyboard and place cursor in appleID textfield
        appleID.becomeFirstResponder()
        uiTextViewOutlet.layer.cornerRadius = 5.0
        uiTextViewOutlet.layer.borderWidth = 2.0
        uiTextViewOutlet.layer.borderColor = UIColor.darkGray.cgColor
        
        
        password.isSecureTextEntry = true
        // Do any additional setup after loading the view, typically from a nib.
    }
    //put these after viewDidLoad()
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == emailTextField{
            emailValidation(textField: emailTextField)
        }else if textField == password{
            passwordValidation(textField: password)
        }
        else if textField == numberTextField{
            phoneNumberValidation(textField: numberTextField)
        }
        else if textField == firstNameTextField{
            firstNameValidation(textField: firstNameTextField)
        }
        else if textField == lastNameTextField{
            firstNameValidation(textField: lastNameTextField)
        }
        else if textField == genderTextField{
            genderValidation(textField: genderTextField)
        }
        else if textField == appleID{
            emailValidation(textField: appleID)
        }
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        str = String(format: "%@%@", textField.text!, string)
        
        //print(string)
        //when click x button on keyboard it will return "" so we check this situation and make it undo character
        if string == ""{
            return true
        }else{
            if textField == appleID{
                //validation: restrict textfield to lenth less than or equal to 5
                if (textField.text?.count)! >= 15{
                    return false
                }
            }
        }
        return true
    }
    
    func setupAlertLabel(label:UILabel, textField:UITextField) {
        label.topAnchor.constraint(equalTo: textField.topAnchor).isActive = true
        label.rightAnchor.constraint(equalTo: textField.rightAnchor).isActive = true
        label.leftAnchor.constraint(equalTo: textField.centerXAnchor, constant: -20).isActive = true
        label.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    var emailAlertLabel: UILabel = {
        let alertLabel = UILabel()
        alertLabel.translatesAutoresizingMaskIntoConstraints = false
        alertLabel.numberOfLines = 0;
        alertLabel.font = UIFont(name: "AvenirNextCondensed-Regular", size: 12)
        alertLabel.text = "Invalid email format"
        alertLabel.textColor = .red
        return alertLabel
    }()
    
    func emailValidation(textField : UITextField){
            let regex = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$"
            let emailTest = NSPredicate(format: "SELF MATCHES %@", regex)
            let isValid = emailTest.evaluate(with: str)
            if !isValid {
                textField.addSubview(emailAlertLabel)
                setupAlertLabel(label: emailAlertLabel, textField: textField)
                emailAlertLabel.isHidden = false
            } else {
                emailAlertLabel.isHidden = true
            }
    }
    
    var passwordAlertLabel: UILabel = {
        let alertLabel = UILabel()
        alertLabel.translatesAutoresizingMaskIntoConstraints = false
        alertLabel.numberOfLines = 0;
        alertLabel.font = UIFont(name: "AvenirNextCondensed-Regular", size: 8)
        alertLabel.text = "Need 3 characters, Must contain at least one lower case letter, upper case letter and digit"
        alertLabel.textColor = .red
        return alertLabel
    }()
    
    func passwordValidation(textField : UITextField){
            let regex = "^(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{3,}$"
            let passwordTest = NSPredicate(format: "SELF MATCHES %@", regex)
            let isValid = passwordTest.evaluate(with: str)
            
            if !isValid {
                textField.addSubview(passwordAlertLabel)
                setupAlertLabel(label: passwordAlertLabel, textField: textField)
                passwordAlertLabel.isHidden = false
            } else {
                passwordAlertLabel.isHidden = true
            }
    }
    var phoneNumberAlertLabel: UILabel = {
        let alertLabel = UILabel()
        alertLabel.translatesAutoresizingMaskIntoConstraints = false
        alertLabel.numberOfLines = 0;
        alertLabel.font = UIFont(name: "AvenirNextCondensed-Regular", size: 12)
        alertLabel.text = "Mobile phone must contains 3-13 numbers"
        alertLabel.textColor = .red
        return alertLabel
    }()
    
    func phoneNumberValidation(textField : UITextField){
        let regex = "^[0-9]{3,13}$"
        let mobileTest = NSPredicate(format: "SELF MATCHES %@", regex)
        let isValid = mobileTest.evaluate(with: str)
        
        if !isValid {
            textField.addSubview(phoneNumberAlertLabel)
            setupAlertLabel(label: phoneNumberAlertLabel, textField: textField)
            phoneNumberAlertLabel.isHidden = false
        } else {
            phoneNumberAlertLabel.isHidden = true
        }
    }
    
    var firstNameAlertLabel: UILabel = {
        let alertLabel = UILabel()
        alertLabel.translatesAutoresizingMaskIntoConstraints = false
        alertLabel.numberOfLines = 0;
        alertLabel.font = UIFont(name: "AvenirNextCondensed-Regular", size: 12)
        alertLabel.text = "Name must contains 3-30 characters"
        alertLabel.textColor = .red
        return alertLabel
    }()
    
    func firstNameValidation(textField : UITextField){
        let regex = "^[a-zA-Z]{3,30}$"
        let mobileTest = NSPredicate(format: "SELF MATCHES %@", regex)
        let isValid = mobileTest.evaluate(with: str)
        
        if !isValid {
            textField.addSubview(firstNameAlertLabel)
            setupAlertLabel(label: firstNameAlertLabel, textField: textField)
            firstNameAlertLabel.isHidden = false
        } else {
            firstNameAlertLabel.isHidden = true
        }
    }
    
    var genderAlertLabel: UILabel = {
        let alertLabel = UILabel()
        alertLabel.translatesAutoresizingMaskIntoConstraints = false
        alertLabel.numberOfLines = 0;
        alertLabel.font = UIFont(name: "AvenirNextCondensed-Regular", size: 12)
        alertLabel.text = "Gender must contains 4-6 characters"
        alertLabel.textColor = .red
        return alertLabel
    }()
    
    func genderValidation(textField : UITextField){
        let regex = "^[a-zA-Z]{4,6}$"
        let mobileTest = NSPredicate(format: "SELF MATCHES %@", regex)
        let isValid = mobileTest.evaluate(with: str)
        
        if !isValid {
            textField.addSubview(genderAlertLabel)
            setupAlertLabel(label: genderAlertLabel, textField: textField)
            genderAlertLabel.isHidden = false
        } else {
            genderAlertLabel.isHidden = true
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == appleID{
            password.becomeFirstResponder()
        }else if textField == password{
            emailTextField.becomeFirstResponder()
        }else if textField == emailTextField{
            firstNameTextField.becomeFirstResponder()
        }else if textField == firstNameTextField{
            lastNameTextField.becomeFirstResponder()
        }else if textField == lastNameTextField{
            numberTextField.becomeFirstResponder()
        }else if textField == numberTextField{
            genderTextField.becomeFirstResponder()
        }else{
            //resignFirstResponder : hiding keyboard
            genderTextField.resignFirstResponder()
        }
        return true
    }
    
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n"{
            textView.resignFirstResponder()
            return false
        }else{
            return true
        }
    }
    func textViewDidEndEditing( uiTextViewOutlet : UITextView){
    }
    

    // this btn called after prepare
    @IBAction func signInBtn(_ sender: UIButton) {
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let userDefault = UserDefaults.standard
        userDefault.set(appleID.text, forKey: "appleID")
        userDefault.set(password.text, forKey: "password")
        text = userDefault.string(forKey: "appleID")
        pw = userDefault.string(forKey: "password")
        
        if let controller = segue.destination as? SecondViewController{
            if segue.identifier == "signin"{
                controller.labelStartVal = text
                controller.passingPwValue = pw
            }else{
                controller.labelStartVal = "Can't find proper identifier"
            }
        }
    }
}

