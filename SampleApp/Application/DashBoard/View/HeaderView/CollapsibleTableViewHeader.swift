//
//  CustomHeaderView.swift
//  SampleApp
//
//  Created by Atinder Kaur on 2021-04-19.
//

import Foundation
import UIKit

class CollapsibleTableViewHeader: UITableViewHeaderFooterView {
    
    // MARK: - Objects and Variables
    let imgVehicle = UIImageView()
    let titleLabel = UILabel()
    let priceLabel = UILabel()
    let ratingView = UIView()
    let imgStar1 = UIImageView()
    let imgStar2 = UIImageView()
    let imgStar3 = UIImageView()
    let imgStar4 = UIImageView()
    let imgStar5 = UIImageView()
    
    var delegate: CollapsibleTableViewHeaderDelegate?
    var section: Int = 0
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        // Content View
          contentView.backgroundColor = UIColor.init(red: 213/255, green: 213/255, blue: 213/255, alpha: 1)
          let marginGuide = contentView.layoutMarginsGuide

          // Arrow label
          contentView.addSubview(imgVehicle)
          imgVehicle.translatesAutoresizingMaskIntoConstraints = false
          imgVehicle.topAnchor.constraint(equalTo: marginGuide.topAnchor,constant: 15).isActive = true
          imgVehicle.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
          imgVehicle.widthAnchor.constraint(equalToConstant: 140).isActive = true
          imgVehicle.heightAnchor.constraint(equalToConstant: 80).isActive = true
         imgVehicle.image = UIImage(named: StaticImages.headerImg)

        
          // Title label
          contentView.addSubview(titleLabel)
          titleLabel.textColor = UIColor.init(red: 133/255, green: 133/255, blue: 133/255, alpha: 1)
          titleLabel.font = UIFont.boldSystemFont(ofSize: 22)
          titleLabel.translatesAutoresizingMaskIntoConstraints = false
          titleLabel.topAnchor.constraint(equalTo: imgVehicle.topAnchor).isActive = true
          titleLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
          titleLabel.leadingAnchor.constraint(equalTo: imgVehicle.trailingAnchor, constant: 7).isActive = true
          titleLabel.numberOfLines = 0
        
        contentView.addSubview(priceLabel)
        priceLabel.textColor = UIColor.init(red: 133/255, green: 133/255, blue: 133/255, alpha: 1)
        priceLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)

        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 7).isActive = true
        priceLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        priceLabel.leadingAnchor.constraint(equalTo: imgVehicle.trailingAnchor,constant: 7).isActive = true
        priceLabel.numberOfLines = 0
        
        contentView.addSubview(ratingView)
        ratingView.translatesAutoresizingMaskIntoConstraints = false
        ratingView.topAnchor.constraint(equalTo: priceLabel.bottomAnchor).isActive = true
       ratingView.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor,constant: -20).isActive = true
        ratingView.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        ratingView.leadingAnchor.constraint(equalTo: imgVehicle.trailingAnchor,constant: 7).isActive = true
        ratingView.heightAnchor.constraint(equalToConstant: 30).isActive = true
       
        let arrStar = [imgStar1, imgStar2,imgStar3, imgStar4, imgStar5]
        createRatingView(arrStar: arrStar)
        
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(CollapsibleTableViewHeader.tapHeader(_:))))

    }
    
    
    func createRatingView(arrStar: [UIImageView]) {
        for (index,img_View) in arrStar.enumerated() {
            contentView.addSubview(img_View)
            ratingView.addSubview(img_View)
            img_View.translatesAutoresizingMaskIntoConstraints = false
            img_View.centerYAnchor.constraint(equalTo: ratingView.centerYAnchor).isActive = true
            img_View.widthAnchor.constraint(equalToConstant: 14).isActive = true
            img_View.heightAnchor.constraint(equalToConstant: 14).isActive = true
            img_View.image = UIImage(named: kYellowStar)
            
            switch index {
            case 1:
                img_View.leadingAnchor.constraint(equalTo: imgStar1.trailingAnchor,constant: 12).isActive = true
            case 2:
                img_View.leadingAnchor.constraint(equalTo: imgStar2.trailingAnchor,constant: 12).isActive = true
            case 3:
                    img_View.leadingAnchor.constraint(equalTo: imgStar3.trailingAnchor,constant: 12).isActive = true
            case 4:
                img_View.leadingAnchor.constraint(equalTo: imgStar4.trailingAnchor,constant: 12).isActive = true
            default:
                print("Some other character")
            }
        }
       
    }
    
    func setDynamicRating(value : Int) {
        switch value {
        case 1:
            imgStar1.image = UIImage(named: kYellowStar)
            imgStar2.image = UIImage(named: kWhiteStar)
            imgStar3.image = UIImage(named: kWhiteStar)
            imgStar4.image = UIImage(named: kWhiteStar)
            imgStar5.image = UIImage(named: kWhiteStar)
        case 2:
            imgStar1.image = UIImage(named: kYellowStar)
            imgStar2.image = UIImage(named: kYellowStar)
            imgStar3.image = UIImage(named: kWhiteStar)
            imgStar4.image = UIImage(named: kWhiteStar)
            imgStar5.image = UIImage(named: kWhiteStar)
        case 3:
            imgStar1.image = UIImage(named: kYellowStar)
            imgStar2.image = UIImage(named: kYellowStar)
            imgStar3.image = UIImage(named: kYellowStar)
            imgStar4.image = UIImage(named: kWhiteStar)
            imgStar5.image = UIImage(named: kWhiteStar)
        case 4:
            imgStar1.image = UIImage(named: kYellowStar)
            imgStar2.image = UIImage(named: kYellowStar)
            imgStar3.image = UIImage(named: kYellowStar)
            imgStar4.image = UIImage(named: kYellowStar)
            imgStar5.image = UIImage(named: kWhiteStar)
        case 5:
            imgStar1.image = UIImage(named: kYellowStar)
            imgStar2.image = UIImage(named: kYellowStar)
            imgStar3.image = UIImage(named: kYellowStar)
            imgStar4.image = UIImage(named: kYellowStar)
            imgStar5.image = UIImage(named: kYellowStar)
        default:
            print("Some other character")
        }
        
    }
    
    // MARK: -  Expandable cell functionality
    @objc func tapHeader(_ gestureRecognizer: UITapGestureRecognizer) {
            guard let cell = gestureRecognizer.view as? CollapsibleTableViewHeader else {
                return
            }
            delegate?.toggleSection(self, section: cell.section)
        }
        
        func setCollapsed() {
            delegate?.toggleSection(self, section: 0)
        }
        required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
