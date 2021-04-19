//
//  BaseUIControllerViewController.swift
//  SampleApp
//
//  Created by Atinder Kaur on 2021-04-19.
//

import UIKit

class BaseUIControllerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func globalAlert(msg: String) {
        let alert = UIAlertController(title: kAppName, message: msg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: kOk, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func formatPoints(num: Double) ->String{
       let thousandNum = num/1000
       let millionNum = num/1000000
       if num >= 1000 && num < 1000000{
           if(floor(thousandNum) == thousandNum){
               return("\(Int(thousandNum))k")
           }
        return("\(thousandNum.rounded(toPlaces: 1))k")
       }
       if num > 1000000{
           if(floor(millionNum) == millionNum){
               return("\(Int(thousandNum))k")
           }
        return ("\(millionNum.rounded(toPlaces: 1))M")
       }
       else{
           if(floor(num) == num){
               return ("\(Int(num))")
           }
           return ("\(num)")
       }
   }
}
