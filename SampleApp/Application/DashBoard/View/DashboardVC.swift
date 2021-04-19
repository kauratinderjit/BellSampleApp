//
//  DashboardVC.swift
//  SampleApp
//
//  Created by Atinder Kaur on 2021-04-14.
//

import UIKit
import CoreData

class DashboardVC: BaseUIControllerViewController {
    
    // MARK: -  Outlets and Variables
    @IBOutlet weak var viewFilter: UIView!
    @IBOutlet weak var txtAnyModel: UITextField!
    @IBOutlet weak var txtAnyMake: UITextField!
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var viewPicker: UIView!
    @IBOutlet weak var dropDown: UIPickerView!
    var viewModel : DashBoardViewModel?
    var dataList = [VehicleData]()
    var PredefinedList  = [VehicleData]()
    var pickerList = [String]()
    var vehicleCoreData: [NSManagedObject] = []
    var selectedTxtfield = 0
    var imgArr = [StaticImages.rangeRover,StaticImages.alphineRoadster,StaticImages.bmw,StaticImages.tacoma]

    // MARK: - View cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        getData()
    }
    
    func getData() {
        if InternetConnectionManager.isConnectedToNetwork(){
            viewModel?.jsonData()
        }else{
            fetchDataFromDatabase()
        }
    }
    
    func setDelegateOfDropDown() {
        dropDown.delegate = self
        dropDown.dataSource = self
    }
    
    // MARK: - For setup the view
    func setUI() {
        viewModel = DashBoardViewModel.init(Delegate: self, view: self)
        navigationController?.setNavigationBarHidden(true, animated: false)
        viewFilter.layer.cornerRadius = 8
        viewFilter.clipsToBounds = true
        tableAutomaticDimension(tbl: tblView)
    }
    
    func tableAutomaticDimension(tbl : UITableView) {
        tbl.estimatedRowHeight = 44.0
        tbl.rowHeight = UITableView.automaticDimension
        tbl.estimatedSectionHeaderHeight = 100
        tbl.sectionHeaderHeight = UITableView.automaticDimension
        tbl.separatorStyle = .none
    }
    
    // MARK: - Save data to local DB
    func saveDataToLocal(objdata : Data) {
        guard Bundle.main.path(forResource: JsonFile.name, ofType: "json") != nil else {
          return
        }
        DataBaseOperations.saveVehicleIndatabase(strData: objdata, success:
        { (result) in
            Commands.println(object: result)
        })
        { (error) in
           Commands.println(object: error)
        }
    }
    
    // MARK: - Fetch data to local DB
    func fetchDataFromDatabase() {
        DataBaseOperations.getOfflineData(success :{ (result) in
            guard let response = result else { return}
            self.dataList = response
            var proList = [String]() // for elimating empty data in Pros and Cons
            var consList = [String]()
            for (index,_) in self.dataList.enumerated() {
                proList = self.dataList[index].prosList?.filter({ $0 != ""}) ?? [""]
                self.dataList[index].prosList = proList
                consList = self.dataList[index].consList?.filter({ $0 != ""}) ?? [""]
                self.dataList[index].consList = consList
                self.dataList[index].img = self.imgArr[index] // adding images to global list
            }
            self.dataList = self.dataList.map{ // for adding collapsed variable to list
                 var objList = $0
                 if $0.collapsed == nil {
                     objList.collapsed = true
                 }
                 return objList
             }
       
         self.PredefinedList = self.dataList //For applying filter
         self.byDefaultExpandFirstCell()
         self.tblView.reloadData()
        })
        { (error) in
           Commands.println(object: error)
        }
        
    }
   
    // MARK: - By default first cell of list id expandable
    func byDefaultExpandFirstCell() {
        if dataList.count > 0 {
        let noExpandableFound = dataList.filter { $0.collapsed == false}
        if noExpandableFound.count == 0 {
            dataList[0].collapsed = false
        }
        }
    }

    // MARK: - UIButton actions
    @IBAction func actionCancel(_ sender: UIBarButtonItem) {
        byDefaultExpandFirstCell()
        viewPicker.isHidden = true
    }
    
    @IBAction func actionReset(_ sender: UIBarButtonItem) {
        viewPicker.isHidden = true
        dataList = PredefinedList
        txtAnyModel.text = ""
        txtAnyMake.text = ""
        byDefaultExpandFirstCell()
        tblView.reloadData()
    }
}


