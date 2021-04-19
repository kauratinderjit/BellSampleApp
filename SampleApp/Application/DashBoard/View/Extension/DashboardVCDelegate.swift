//
//  DashboardVCDelegate.swift
//  SampleApp
//
//  Created by Atinder Kaur on 2021-04-19.
//

import Foundation
import UIKit

// MARK: - DashboardVCDelegate Methods
extension DashboardVC : DashBoardVCDelegate {
    func getData(list: ResponseData, data: Data) {
        DispatchQueue.main.async {
            self.dataList = list!
            var proList = [String]()
            var consList = [String]()
            for (index,_) in self.dataList.enumerated() {
                proList = self.dataList[index].prosList?.filter({ $0 != ""}) ?? [""]
                self.dataList[index].prosList = proList
                consList = self.dataList[index].consList?.filter({ $0 != ""}) ?? [""]
                self.dataList[index].consList = consList
                self.dataList[index].img = self.imgArr[index]
            }
            self.PredefinedList = self.dataList
            self.byDefaultExpandFirstCell()
            self.tblView.reloadData()
            self.saveDataToLocal(objdata: data)
        }
    }
    
   
    func nothingFound(strMessage: String) {
        self.globalAlert(msg: strMessage)
    }
}
