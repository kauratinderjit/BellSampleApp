//
//  ExpandableRowCell.swift
//  SampleApp
//
//  Created by Atinder Kaur on 2021-04-15.
//

import UIKit

class ExpandableRowCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblBulletPoint: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        lblBulletPoint.layer.cornerRadius = 5
        lblBulletPoint.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


