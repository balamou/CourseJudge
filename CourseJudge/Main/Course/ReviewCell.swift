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
    static let rowHeight: CGFloat = 150.0
    
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
        courseNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 40.0).isActive = true
        courseNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        addSubviewLayout(courseCodeLabel)
        courseCodeLabel.topAnchor.constraint(equalTo: courseNameLabel.bottomAnchor, constant: 5.0).isActive = true
        courseCodeLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
            
        addSubviewLayout(overallRatingsStars)
        overallRatingsStars.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20.0).isActive = true
        overallRatingsStars.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10.0).isActive = true
        overallRatingsStars.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
//        overallRatingsStars.widthAnchor.constraint(equalToConstant: 120.0).isActive = true
        
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
    static let minimumRowHeight: CGFloat = 100.0
    /// negative value for no limit
    static let maximumReviewCharacters = -1
    
    private let labelFont = UIFont.systemFont(ofSize: 14.0)
    
    let wrapperView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9647058824, alpha: 1)
        view.layer.cornerRadius = 20.0
        
        return view
    }()
    
    lazy var ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "Rating"
        label.font = labelFont
        
        return label
    }()
    
    lazy var ratingStars: StarsView = {
        let starsView = StarsView()
        starsView.inactiveStarColor = UIColor.black.withAlphaComponent(0.2)
        
        return starsView
    }()
    
    lazy var yearLabel: UILabel = {
        let label = UILabel()
        label.text = "Year"
        label.font = labelFont
        label.textColor = UIColor.black.withAlphaComponent(0.4)
        
        return label
    }()
    
    lazy var professorLabel: UILabel = {
        let label = UILabel()
        label.text = "Professor"
        label.font = labelFont
        
        return label
    }()
    
    lazy var difficulyLabel: UILabel = {
        let label = UILabel()
        label.text = "Difficuly"
        label.font = labelFont
        
        return label
    }()
    
    lazy var commentsLabel: UILabel = {
        let label = UILabel()
        label.text = "Comments"
        label.font = labelFont
        label.numberOfLines = 0
        label.textAlignment = .natural
        
        return label
    }()
    
    var moreActionsButton: UIButton = {
        let button = UIButton()
        button.setImage(Images.moreActionsSmall, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.tintColor = UIColor.black.withAlphaComponent(0.4)
        
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let margin: CGFloat = 15.0
        
        backgroundColor = .white
        selectionStyle = .none
        
        addSubviewLayout(wrapperView)
        
        wrapperView.topAnchor.constraint(equalTo: topAnchor, constant: 10.0).isActive = true
        wrapperView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10.0).isActive = true
        wrapperView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10.0).isActive = true
        wrapperView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10.0).isActive = true
        
        // STARS
        wrapperView.addSubviewLayout(ratingStars)
        ratingStars.topAnchor.constraint(equalTo: wrapperView.topAnchor, constant: margin).isActive = true
        ratingStars.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor, constant: margin).isActive = true
        ratingStars.heightAnchor.constraint(equalToConstant: 15.0).isActive = true
        
        // STACK BELOW
        let stackView = UIStackView()
        stackView.axis = .vertical
        
        wrapperView.addSubviewLayout(stackView)
        
        stackView.topAnchor.constraint(equalTo: ratingStars.bottomAnchor, constant: 5.0).isActive = true
        stackView.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor, constant: margin).isActive = true
        
        stackView.addArrangedSubview(professorLabel)
        stackView.addArrangedSubview(difficulyLabel)
        
        // MORE ACTIONS BUTTON
        wrapperView.addSubviewLayout(moreActionsButton)
        wrapperView.addSubviewLayout(yearLabel)
             
        moreActionsButton.centerYAnchor.constraint(equalTo: yearLabel.centerYAnchor).isActive = true
        moreActionsButton.trailingAnchor.constraint(equalTo: wrapperView.trailingAnchor, constant: -margin - 5.0).isActive = true
        
        // YEAR LABEL
        yearLabel.trailingAnchor.constraint(equalTo: moreActionsButton.leadingAnchor, constant: -10.0).isActive = true
        yearLabel.topAnchor.constraint(equalTo: wrapperView.topAnchor, constant: margin).isActive = true
        
        // COMMENTS
        wrapperView.addSubviewLayout(commentsLabel)
        commentsLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 5).isActive = true
        commentsLabel.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor, constant: margin).isActive = true
        commentsLabel.trailingAnchor.constraint(equalTo: wrapperView.trailingAnchor, constant: -margin).isActive = true
        commentsLabel.bottomAnchor.constraint(lessThanOrEqualTo: wrapperView.bottomAnchor, constant: -margin).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    static func getEstimatedRowHeight(review: String, totalScreenWidth: CGFloat) -> CGFloat {
        guard !review.isEmpty else {
            return minimumRowHeight
        }
        
        let review = maximumReviewCharacters < 0 ? review : review.truncate(maximumReviewCharacters)
        
        let labelMargins: CGFloat = 2 * (10 + 20)
        let approximateWidthOfDescription: CGFloat = totalScreenWidth - labelMargins
        let approximateHeightOfDescription: CGFloat = 1000.0 // arbitrary large value
        let attributes = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: UIFont.systemFontSize)]
        
        let size = CGSize(width: approximateWidthOfDescription, height: approximateHeightOfDescription)
        let estimatedFrame = NSString(string: review).boundingRect(with: size,
                                                                   options: .usesLineFragmentOrigin,
                                                                   attributes: attributes,
                                                                   context: nil)
        
        return minimumRowHeight + estimatedFrame.height + 10
    }
}

