//
// FifthViewController FifthViewController.swift
//  SimpleLoginForm
//
//  Created by SHILEI CUI on 3/18/19.
//  Copyright © 2019 scui5. All rights reserved.
//

import UIKit

class FifthViewController: UIViewController ,UITextFieldDelegate{

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var carImgVie: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:  UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:  UIResponder.keyboardWillHideNotification, object: nil)
        
        // Do any additional setup after loading the view.
    }
    
    @objc func keyboardWillShow(notification:Notification){
        print("keyboardwillshow")
        if let userInfo = notification.userInfo{
            if let keySize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue{
                pwBtmCons.constant = 92
                pwBtmCons.constant += keySize.height - 40
                UIView.animate(withDuration: 1.5){
                    self.view.layoutIfNeeded()
                }
            }
        }
    }

    @objc func keyboardWillHide(notification:Notification){
        print("keyboardwillhide")
        if let userInfo = notification.userInfo{
            if let keySize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue{
                
                pwBtmCons.constant -= keySize.height + 40
                pwBtmCons.constant = 92
                UIView.animate(withDuration: 1.5){
                    self.view.layoutIfNeeded()
                }
            }
        }
    }
    
    func setUpAnimationImage(){
        var arrImg : Array<UIImage> = []
        var arrCarImg : Array<UIImage> = []
        for i in 1...44 {
            arrImg.append(UIImage(named: "Anim 2_\(i)")!)
        }
        for i in 0...62{
            //Final For render_9
            arrCarImg.append(UIImage(named: "Final For render_\(i)")!)
        }
        
        imgView.image = UIImage.animatedImage(with: arrImg, duration: 3.0)
        
        //carImgVie.image = UIImage.animatedImage(with: arrCarImg, duration: 3.0)
        // after one animating is will stop at default image.
        carImgVie.animationImages = arrCarImg
        carImgVie.animationRepeatCount = 1
        carImgVie.animationDuration = 3
        carImgVie.startAnimating()
    }
    
    //todo: implement car Animation
    
    @IBOutlet weak var userNameOut: UITextField!
    
    
    @IBOutlet weak var pwOutlet: UITextField!
    
    @IBOutlet weak var pwBtmCons: NSLayoutConstraint!
    @IBAction func pwBtmCons(_ sender: Any) {
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func btn(_ sender: Any) {
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUpAnimationImage()
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }
    
    override func viewWillDisappear(_ animated: Bool) {
    }

    override func viewDidDisappear(_ animated: Bool) {
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
