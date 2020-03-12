//
//  UniversityHeaderCell.swift
//  CourseJudge
//
//  Created by Michel Balamou on 2020-03-12.
//  Copyright © 2020 Michel Balamou. All rights reserved.
//

import UIKit

class UniversityHeaderCell: UITableViewCell {
    static let identifier = "UnivercityHeaderCell"
    static let rowHeight: CGFloat = 300
    
    var universityLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Images.logo
        imageView.tintColor = .random()
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    var universityNameLabel: UILabel = {
        let label = UILabel()
        label.text = "University of Ottawa"
        label.font = UIFont(name: "Helvetica-Bold", size: 20.0)
        
        return label
    }()
    
    var universityLocationLabel: UILabel = {
        let label = UILabel()
        label.text = "Location"
        label.font = UIFont(name: "Helvetica", size: 13.0)
        label.textColor = UIColor.black.withAlphaComponent(0.5)
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
        addSubviewLayout(universityLogoImageView)
        addSubviewLayout(universityNameLabel)
        addSubviewLayout(universityLocationLabel)
        
        universityLogoImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        universityLogoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 50.0).isActive = true
        universityLogoImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4).isActive = true
        
        universityNameLabel.topAnchor.constraint(equalTo: universityLogoImageView.bottomAnchor, constant: 20).isActive = true
        universityNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        universityLocationLabel.topAnchor.constraint(equalTo: universityNameLabel.bottomAnchor, constant: 5).isActive = true
        universityLocationLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class UniversityCourseCell: UITableViewCell {
    static let identifier = "UniversityCourseCell"
    static let rowHeight: CGFloat = 50
    
    var courseNameLabel: UILabel = {
        let label = UILabel()
        label.text = "CSI 3130"
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
        addSubviewLayout(courseNameLabel)
        
        backgroundColor = .random()
        
        courseNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        courseNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
