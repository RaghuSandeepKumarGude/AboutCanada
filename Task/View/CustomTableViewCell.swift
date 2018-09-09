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
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    
    let pictureImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.layer.cornerRadius = 20
        return iv
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor.darkGray
        return label
    }()
    
    let subTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = UIColor.darkGray
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
        
        cellView.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 4, paddingLeft: 8, paddingBottom: 4, paddingRight: 8)
        
        
        pictureImageView.setAnchor(top: nil, left: cellView.leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 50, height: 50)
        pictureImageView.centerYAnchor.constraint(equalTo: cellView.centerYAnchor).isActive = true
        
        titleLabel.setAnchor(top: nil, left: pictureImageView.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, height: 40)
        titleLabel.centerYAnchor.constraint(equalTo: pictureImageView.centerYAnchor).isActive = true
        
        subTitleLabel.setAnchor(top: nil, left: pictureImageView.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, height: 40)
        subTitleLabel.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
