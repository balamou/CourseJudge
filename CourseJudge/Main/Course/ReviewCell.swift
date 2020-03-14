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
        label.font = UIFont(name: "Helvetica-Bold", size: 20.0) //UIFont.systemFont(ofSize: 18.0)
        
        return label
    }()
    
    let courseCodeLabel: UILabel = {
        let label = UILabel()
        label.text = "Course Code"
        label.font = UIFont.systemFont(ofSize: 15.0)
        
        return label
    }()
    
    let numberOfRatingsLabel: UILabel = {
        let label = UILabel()
        label.text = "Number of ratings"
        label.font = UIFont.systemFont(ofSize: 12.0)
        
        return label
    }()
    
    let overallRatingsStars: StarsView = {
        let stars = StarsView()
        
        return stars
    }()
    
    let overallRatingsLabel: UILabel = {
        let label = UILabel()
        label.text = "4 out of 5"
        label.textColor = UIColor.black.withAlphaComponent(0.8)
        label.font = UIFont.systemFont(ofSize: 12.0)
        
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .white
        selectionStyle = .none
        
        addSubviewLayout(courseNameLabel)
        courseNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 25.0).isActive = true
        courseNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        addSubviewLayout(courseCodeLabel)
        courseCodeLabel.topAnchor.constraint(equalTo: courseNameLabel.bottomAnchor, constant: 5.0).isActive = true
        courseCodeLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
            
        addSubviewLayout(overallRatingsStars)
        overallRatingsStars.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20.0).isActive = true
        overallRatingsStars.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10.0).isActive = true
        overallRatingsStars.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        overallRatingsStars.widthAnchor.constraint(equalToConstant: 120.0).isActive = true
        
        addSubviewLayout(overallRatingsLabel)
        overallRatingsLabel.centerYAnchor.constraint(equalTo: overallRatingsStars.centerYAnchor, constant: 1.0).isActive = true
        overallRatingsLabel.leadingAnchor.constraint(equalTo: overallRatingsStars.trailingAnchor, constant: 5.0).isActive = true
        
        addSubviewLayout(numberOfRatingsLabel)
        numberOfRatingsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20.0).isActive = true
        numberOfRatingsLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10.0).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


class ReviewCell: UITableViewCell {
    static let identifier = "ReviewCell"
    static let rowHeight: CGFloat = 150.0
    
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
        
        stackView.topAnchor.constraint(equalTo: topAnchor, constant: 10.0).isActive = true
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

