//
//  DashboardVCExtension.swift
//  SampleApp
//
//  Created by Atinder Kaur on 2021-04-19.
//

import Foundation
import UIKit

extension DashboardVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if dataList[section].collapsed == false {
        return dataList[section].collapsed ?? false ? 0 : 1
        }
        else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? DashboardCellTableViewCell else {
            return UITableViewCell()
          }
            cell.setTableViewViewDataSourceDelegate(particularVehicleData: self.dataList[indexPath.section])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataList.count
    }
    
     func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as? CollapsibleTableViewHeader ?? CollapsibleTableViewHeader(reuseIdentifier: "header")
        header.delegate = self
        header.imgVehicle.image = UIImage(named: dataList[section].img ?? "")
        header.titleLabel.text = dataList[section].model
        let roundOffPrice = Double(dataList[section].customerPrice ?? 0)
        let strPrice = formatPoints(num: roundOffPrice)
        header.priceLabel.text =  "Price: \(strPrice)"
        header.setDynamicRating(value: dataList[section].rating ?? 0)
        header.section = section
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
