//
//  UniversityCell.swift
//  CourseJudge
//
//  Created by Michel Balamou on 2020-03-11.
//  Copyright © 2020 Michel Balamou. All rights reserved.
//

import UIKit

class UniversityCell: UITableViewCell {
    static let identifier = "UniversityCell"
    static let rowHeight: CGFloat = 60.0
    
    var universityNameLabel: UILabel = {
        let label = UILabel()
        label.text = "University name"
        label.font = UIFont(name: "Helvetica", size: 17.0)
        label.textColor = .black
        
        return label
    }()
    
    var locationLabel: UILabel = {
        let label = UILabel()
        label.text = "Location"
        label.font = UIFont(name: "Helvetica", size: 12.0)
        label.textColor = UIColor.black.withAlphaComponent(0.4)
        
        return label
    }()
    
    var universityLogoImageView: UIImageView = {
        let imageView = UIImageView(image: Images.logo)
        imageView.tintColor = .init(hue: .random(in: 0...1), saturation: 0.8, brightness: 1, alpha: 1)
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
        addSubviewLayout(universityNameLabel)
        addSubviewLayout(locationLabel)
        addSubviewLayout(universityLogoImageView)
        
        universityLogoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10.0).isActive = true
        universityLogoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20.0).isActive = true
        universityLogoImageView.heightAnchor.constraint(equalToConstant: UniversityCell.rowHeight * (2/3)).isActive = true
        universityLogoImageView.widthAnchor.constraint(equalToConstant: UniversityCell.rowHeight * (2/3)).isActive = true
            
        universityNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10.0).isActive = true
        universityNameLabel.leadingAnchor.constraint(equalTo: universityLogoImageView.trailingAnchor, constant: 20.0).isActive = true
        
        locationLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10.0).isActive = true
        locationLabel.leadingAnchor.constraint(equalTo: universityLogoImageView.trailingAnchor, constant: 20.0).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
