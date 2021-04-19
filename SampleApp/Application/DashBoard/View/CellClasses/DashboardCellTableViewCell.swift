//
//  DashboardCellTableViewCell.swift
//  SampleApp
//
//  Created by Atinder Kaur on 2021-04-14.
//

import UIKit

class DashboardCellTableViewCell: UITableViewCell {

    @IBOutlet weak var kConstraintHeightTb: NSLayoutConstraint!
    @IBOutlet weak var tblViewProCon: UITableView!
    var localData : VehicleData?
    var ListProsCons = [[String]]()

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        tblViewProCon.estimatedRowHeight = 44.0
        tblViewProCon.rowHeight = UITableView.automaticDimension
        tblViewProCon.estimatedSectionHeaderHeight = 44.0
        tblViewProCon.sectionHeaderHeight = UITableView.automaticDimension
        tblViewProCon.isScrollEnabled = false
        tblViewProCon.delegate = self
        tblViewProCon.dataSource = self
        tblViewProCon.separatorStyle = .none
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK:- SetTableViewDelegate
    func setTableViewViewDataSourceDelegate(particularVehicleData: VehicleData)
    {
        localData = particularVehicleData
        ListProsCons = [[String]]()
        ListProsCons.append((localData?.prosList)!)
        ListProsCons.append((localData?.consList)!)

        self.tblViewProCon.reloadData()

         self.kConstraintHeightTb.constant = self.tblViewProCon.contentSize.height - 15
                
    }

}



extension DashboardCellTableViewCell : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if ListProsCons.count > 0 {
        return ListProsCons[section].count
        }
        else {
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellPro", for: indexPath) as? ExpandableRowCell else {
            print("failed to get cell")
            return UITableViewCell()
          }
       if ListProsCons.count > 0 {
        cell.lblName.text = ListProsCons[indexPath.section][indexPath.row]
        }
        return cell
        

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
     func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "headerProsCons") as? TableViewProsConsHeader ?? TableViewProsConsHeader(reuseIdentifier: "headerProsCons")
        if section == 0 {
            header.titleLabel.text = "Pros :" }
        else {
            header.titleLabel.text = "Cons :"
        }
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

class TableViewProsConsHeader : UITableViewHeaderFooterView {
    let titleLabel = UILabel()
   
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        // Content View
          contentView.backgroundColor = UIColor.init(red: 213/255, green: 213/255, blue: 213/255, alpha: 1)
          let marginGuide = contentView.layoutMarginsGuide

        
        
          // Title label
          contentView.addSubview(titleLabel)
          titleLabel.textColor = UIColor.black
          titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
          titleLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
          titleLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor, constant: 15).isActive = true
         titleLabel.numberOfLines = 0

        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
