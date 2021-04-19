//
//  DataModel.swift
//  SampleApp
//
//  Created by Atinder Kaur on 2021-04-14.
//


import Foundation

// MARK: - jsonData
struct VehicleData: Codable {
    var consList: [String]?
    var customerPrice: Int?
    var make: String?
    var marketPrice: Int?
    var model: String?
    var prosList: [String]?
    var rating: Int?
    var collapsed : Bool? = true
    var img : String?
    
}
typealias ResponseData = [VehicleData]?

// MARK: - For Adding dynamic pros and cons
struct prosCons: Codable {
    var pros: [String]?
    var cons: [String]?
}

