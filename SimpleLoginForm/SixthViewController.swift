//
//  SixthViewController.swift
//  SimpleLoginForm
//
//  Created by SHILEI CUI on 3/18/19.
//  Copyright © 2019 scui5. All rights reserved.
//

import UIKit

class SixthViewController: UIViewController {

    var secs = 10
    var timer = Timer()
    
    @IBOutlet weak var lblTimer: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let date = Date()
        print(date)
        let formater = DateFormatter()
        formater.dateFormat = "dd-MMM-YYYY"
        let dateStr = formater.string(from: date)
        print(dateStr)
        
       // timeInterval is second.
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(setcall), userInfo: nil, repeats: true)
        
        animationFunc(ishide: true)
        // Do any additional setup after loading the view.
    }
    @objc func setcall(){
        self.secs -= 1
        let hours = self.secs / 3600
        let mins = self.secs / 60 % 60
        let secs = self.secs % 60
        let restTime = ((hours<10) ? "0" : "") + String(hours) + ":" + ((mins<10) ? "0" : "") + String(mins) + ":" + ((secs<10) ? "0" : "") + String(secs)
        lblTimer.text = restTime
        if self.secs == 0{
            timer.invalidate()
        }
    }
    
    
    @IBOutlet weak var dataPicker: UIDatePicker!
    
    @IBAction func doneAction(_ sender: UIBarButtonItem) {
        animationFunc(ishide: true)
        let date = dataPicker.date
        print(date)
        let formater = DateFormatter()
        formater.dateFormat = "dd-MMM-YYYY"
        let dateStr = formater.string(from: date)
        print(dateStr)
        dobOutlet.setTitle(dateStr, for: .normal)
    }

    @IBAction func cancelAction(_ sender: UIBarButtonItem) {
        dobOutlet.setTitle("DOB", for: .normal)
        animationFunc(ishide: true)
    }
    
    @IBOutlet weak var dobOutlet: UIButton!
    
    @IBAction func dobAction(_ sender: UIButton) {
        animationFunc(ishide: false)
    }
    @IBOutlet weak var btmCons: NSLayoutConstraint!
    
    
    func animationFunc(ishide : Bool){
        btmCons.constant = ishide == true ? -318 : 0
        UIView.animate(withDuration: 0.5){
            self.view.layoutIfNeeded()
        }
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
