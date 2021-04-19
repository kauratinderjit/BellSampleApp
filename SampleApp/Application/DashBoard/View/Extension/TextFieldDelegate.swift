//
//  TextFieldDelegate.swift
//  SampleApp
//
//  Created by Atinder Kaur on 2021-04-19.
//

import Foundation
import UIKit

extension DashboardVC : UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == self.txtAnyMake {
            selectedTxtfield = 0
            pickerList = PredefinedList.map { data in
                return (data.make ?? "")
            }
        }
        else{
            selectedTxtfield = 1
            pickerList = PredefinedList.map { data in
                return (data.model ?? "")
            }
        }
        textField.endEditing(true)
        viewPicker.isHidden = false
        dropDown.selectRow(0, inComponent: 0, animated: true)
        setDelegateOfDropDown()
    }
}
