//
//  DoubleExtension.swift
//  SampleApp
//
//  Created by Atinder Kaur on 2021-04-19.
//

import Foundation

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
