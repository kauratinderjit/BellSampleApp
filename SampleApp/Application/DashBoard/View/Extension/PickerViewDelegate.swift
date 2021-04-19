//
//  PickerViewDelegate.swift
//  SampleApp
//
//  Created by Atinder Kaur on 2021-04-19.
//

import Foundation
import UIKit


extension DashboardVC : UIPickerViewDelegate, UIPickerViewDataSource{
     func numberOfComponents(in pickerView: UIPickerView) -> Int{
           return 1
       }

        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{

           return pickerList.count
       }

       func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

           self.view.endEditing(true)
           return pickerList[row]
       }

       func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if  selectedTxtfield == 0
        {
            self.txtAnyMake.text = self.pickerList[row]
            if self.txtAnyModel.text != "" {
                dataList = self.PredefinedList.filter({ $0.make == self.txtAnyMake.text && $0.model == self.txtAnyModel.text})
            } else {
            dataList = self.PredefinedList.filter({ $0.make == self.txtAnyMake.text})
            }
        }
        else{
            self.txtAnyModel.text = self.pickerList[row]
            if self.txtAnyMake.text != "" {
                dataList = self.PredefinedList.filter({ $0.make == self.txtAnyMake.text && $0.model == self.txtAnyModel.text})
            } else {
                dataList = self.PredefinedList.filter({ $0.model == self.txtAnyModel.text})
            }
        }
         byDefaultExpandFirstCell()
          self.viewPicker.isHidden = true
          tblView.reloadData()
       }

      
   }


