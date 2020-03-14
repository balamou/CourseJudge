//
//  CourseCell.swift
//  CourseJudge
//
//  Created by Michel Balamou on 2020-03-13.
//  Copyright © 2020 Michel Balamou. All rights reserved.
//

import UIKit

class CourseHeaderCell: UITableViewCell {
    static let identifier = "CourseHeaderCell"
    static let rowHeight: CGFloat = 200.0
    
    let courseNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Course Name"
        
        return label
    }()
    
    let courseCodeLabel: UILabel = {
        let label = UILabel()
        label.text = "Course Code"
        
        return label
    }()
    
    let numberOfRatingsLabel: UILabel = {
        let label = UILabel()
        label.text = "Number of ratings"
        
        return label
    }()
    
    let overallRatingsLabel: UILabel = {
        let label = UILabel()
        label.text = "Overall rating"
        
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .random()
        selectionStyle = .none
        
        addSubviewLayout(courseNameLabel)
        courseNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10.0).isActive = true
        courseNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10.0).isActive = true
        
        addSubviewLayout(courseCodeLabel)
        courseCodeLabel.topAnchor.constraint(equalTo: courseNameLabel.bottomAnchor, constant: 10.0).isActive = true
        courseCodeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10.0).isActive = true
        
        addSubviewLayout(overallRatingsLabel)
        overallRatingsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10.0).isActive = true
        overallRatingsLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10.0).isActive = true
        
        addSubviewLayout(numberOfRatingsLabel)
        numberOfRatingsLabel.bottomAnchor.constraint(equalTo: overallRatingsLabel.topAnchor, constant: -10.0).isActive = true
        numberOfRatingsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10.0).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


class ReviewCell: UITableViewCell {
    static let identifier = "ReviewCell"
    static let rowHeight: CGFloat = 100.0
    
    let ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "Rating"
        
        return label
    }()
    
    let yearLabel: UILabel = {
        let label = UILabel()
        label.text = "Year"
        
        return label
    }()
    
    let professorLabel: UILabel = {
        let label = UILabel()
        label.text = "Professor"
        
        return label
    }()
    
    let difficulyLabel: UILabel = {
        let label = UILabel()
        label.text = "Difficuly"
        
        return label
    }()
    
    let commentsLabel: UILabel = {
        let label = UILabel()
        label.text = "Comments"
        
        
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .random()
        selectionStyle = .none
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        
        addSubviewLayout(stackView)
        
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10.0).isActive = true
        stackView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
        
        stackView.addArrangedSubview(ratingLabel)
        stackView.addArrangedSubview(yearLabel)
        stackView.addArrangedSubview(professorLabel)
        stackView.addArrangedSubview(difficulyLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

