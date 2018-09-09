//
//  CustomtableViewCell.swift
//  Task
//
//  Created by Harshavardhana Reddy on 08/09/18.
//  Copyright © 2018 Sandeep. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

class customTableViewCell: UITableViewCell {
    
    let cellView: UIView = {
        let view = UIView()
        return view
    }()
    
    let pictureImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.layer.cornerRadius = 20.0
        iv.clipsToBounds = true
        return iv
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont(name: "HelveticaNeue", size: 16)
        return label
    }()
    
    let subTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont(name: "HelveticaNeue", size: 14)
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    func setup() {
        addSubview(cellView)
        cellView.addSubview(pictureImageView)
        cellView.addSubview(titleLabel)
        cellView.addSubview(subTitleLabel)
        
        cellView.setAnchor(top: topAnchor,
                           left: leftAnchor,
                           bottom: bottomAnchor,
                           right: rightAnchor,
                           paddingTop: 0,
                           paddingLeft: 8,
                           paddingBottom: 4,
                           paddingRight: 8)
        
        pictureImageView.setAnchor(top: nil,
                                   left: cellView.leftAnchor,
                                   bottom: nil,
                                   right: nil,
                                   paddingTop: 0,
                                   paddingLeft: 8,
                                   paddingBottom: 0,
                                   paddingRight: 0,
                                   width: 60,
                                   height: 60)
        pictureImageView.centerYAnchor.constraint(equalTo: cellView.centerYAnchor).isActive = true
        
        titleLabel.setAnchor(top: cellView.topAnchor,
                             left: pictureImageView.rightAnchor,
                             bottom: nil,
                             right: cellView.rightAnchor,
                             paddingTop: 5,
                             paddingLeft: 10,
                             paddingBottom: 0,
                             paddingRight: 5,
                             height: 30)
        
        subTitleLabel.setAnchor(top: titleLabel.bottomAnchor,
                                left: pictureImageView.rightAnchor,
                                bottom: cellView.bottomAnchor,
                                right: cellView.rightAnchor,
                                paddingTop: 5,
                                paddingLeft: 10,
                                paddingBottom: 5,
                                paddingRight: 5,
                                height: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
