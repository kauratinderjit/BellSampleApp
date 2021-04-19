//
//  DashBoardViewModel.swift
//  SampleApp
//
//  Created by Atinder Kaur on 2021-04-19.
//

import Foundation

// MARK: - Protocol for DashBoardVC
protocol DashBoardVCDelegate
{
    func getData (list : ResponseData, data : Data)
    func nothingFound(strMessage : String)
}

class DashBoardViewModel
{
    var delegate : DashBoardVCDelegate
    var view : DashboardVC
    
    init(Delegate : DashBoardVCDelegate, view : DashboardVC)
    {
        delegate = Delegate
        self.view = view
    }
    
    // MARK: - To get data from Json file
    func jsonData() {
       if let path = Bundle.main.path(forResource: JsonFile.name, ofType: "json") {
            do {
                let dataFinal = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                guard let model = try JSONDecoder().decode(ResponseData.self, from: dataFinal) else{
                    return
                }
                self.delegate.getData(list: model, data: dataFinal)
              } catch {
                // handle error
                self.delegate.nothingFound(strMessage: error.localizedDescription)
                
              }
        }
    }
}
    
