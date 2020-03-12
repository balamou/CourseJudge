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
    static let rowHeight: CGFloat = 150
    
    var universityNameLabel: UILabel = {
        let label = UILabel()
        label.text = "University of Ottawa"
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
        addSubviewLayout(universityNameLabel)
        
        universityNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        universityNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
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
        
        courseNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        courseNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
