//
//  CollapsibleViewDelegate.swift
//  SampleApp
//
//  Created by Atinder Kaur on 2021-04-19.
//

import Foundation
import UIKit

// MARK: - For expandable cell
protocol CollapsibleTableViewHeaderDelegate {
    func toggleSection(_ header: CollapsibleTableViewHeader, section: Int)
}

extension DashboardVC: CollapsibleTableViewHeaderDelegate {
    
  func toggleSection(_ header: CollapsibleTableViewHeader, section: Int) {
    for (index,_) in dataList.enumerated() {
        if index != section {
            dataList[index].collapsed = true }
    }
    let collapsed = !(dataList[section].collapsed ?? false)
    // Toggle collapse
    dataList[section].collapsed = collapsed
    byDefaultExpandFirstCell()
    UIView.setAnimationsEnabled(false)
    tblView.reloadData()
      }
}
