//
//  UniversityHeaderCell.swift
//  CourseJudge
//
//  Created by Michel Balamou on 2020-03-12.
//  Copyright © 2020 Michel Balamou. All rights reserved.
//

import UIKit

protocol UniversityHeaderCellDelegate: class {
    func textFieldTyping(textField: UITextField, trendingLabel: UILabel)
}

class UniversityHeaderCell: UITableViewCell {
    weak var delegate: UniversityHeaderCellDelegate?
    
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
    
    var courseSearchField: SearchTextField = {
        let textfield = SearchTextField()
        textfield.backgroundColor = UIColor.black.withAlphaComponent(0.15)
        textfield.placeholder = "Search course"
        textfield.layer.cornerRadius = 5
        textfield.autocorrectionType = .no
        textfield.autocapitalizationType = .none
        
        return textfield
    }()
    
    var trendingLabel: UILabel = {
        let label = UILabel()
        label.text = "Trending courses"
        label.font = UIFont(name: "Helvetica", size: 13.0)
//        label.textColor = .gray
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
        addSubviewLayout(universityLogoImageView)
        addSubviewLayout(universityNameLabel)
        addSubviewLayout(universityLocationLabel)
        addSubviewLayout(courseSearchField)
        addSubviewLayout(trendingLabel)
        
        universityLogoImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        universityLogoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 25.0).isActive = true
        universityLogoImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4).isActive = true
        
        universityNameLabel.topAnchor.constraint(equalTo: universityLogoImageView.bottomAnchor, constant: 10).isActive = true
        universityNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        universityLocationLabel.topAnchor.constraint(equalTo: universityNameLabel.bottomAnchor, constant: 5).isActive = true
        universityLocationLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        courseSearchField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        courseSearchField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        courseSearchField.bottomAnchor.constraint(equalTo: trendingLabel.topAnchor, constant: -10).isActive = true
        courseSearchField.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        
        trendingLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        trendingLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20.0).isActive = true
        
        
        courseSearchField.addTarget(self, action: #selector(textFieldTyping), for: .editingChanged)
    }
    
    @objc func textFieldTyping(textField: UITextField) {
        delegate?.textFieldTyping(textField: textField, trendingLabel: trendingLabel) // considering there is only one search text field we do not need to add an identifier
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class UniversityCourseCell: UITableViewCell {
    static let identifier = "UniversityCourseCell"
    static let rowHeight: CGFloat = 130
    
    var wrapperView: UIView = {
        let view = UIView()
        view.backgroundColor = .random()
        view.layer.cornerRadius = 15.0
        
        return view
    }()
    
    var courseCodeLabel: UILabel = {
        let label = UILabel()
        label.text = "CSI 3130"
        
        return label
    }()
    
    var courseNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Computer graphics"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.black.withAlphaComponent(0.8)
        
        return label
    }()
    
    var rateButton: UIButton = {
        let button = UIButton()
        button.setTitle("Rate", for: .normal)
        button.layer.cornerRadius = 5
        button.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.7)
        
        button.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 15.0)
        button.contentEdgeInsets  = UIEdgeInsets(top: 10, left: 30, bottom: 10, right: 30)
        button.isOpaque = true
        
        return button
    }()
    
    var numberOfRatingsLabel: UILabel = {
        let label = UILabel()
        label.text = "1,050 ratings"
        label.font = UIFont.systemFont(ofSize: 13)
        
        return label
    }()
    
    var overallRating: UILabel = {
        let label = UILabel()
        label.text = "5 out of 5"
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
        
        addSubviewLayout(wrapperView)
        wrapperView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20.0).isActive = true
        wrapperView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20.0).isActive = true
        wrapperView.topAnchor.constraint(equalTo: topAnchor, constant: 8.0).isActive = true
        wrapperView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8.0).isActive = true
        
        wrapperView.addSubviewLayout(courseCodeLabel)
        
        courseCodeLabel.topAnchor.constraint(equalTo: wrapperView.topAnchor, constant: 10.0).isActive = true
        courseCodeLabel.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor, constant: 10.0).isActive = true
        
        wrapperView.addSubviewLayout(courseNameLabel)
        
        courseNameLabel.topAnchor.constraint(equalTo: courseCodeLabel.bottomAnchor).isActive = true
        courseNameLabel.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor, constant: 10.0).isActive = true
        
        wrapperView.addSubviewLayout(rateButton)
        
        rateButton.centerYAnchor.constraint(equalTo: wrapperView.centerYAnchor).isActive = true
        rateButton.trailingAnchor.constraint(equalTo: wrapperView.trailingAnchor, constant: -10.0).isActive = true
        
        wrapperView.addSubviewLayout(numberOfRatingsLabel)
        
        numberOfRatingsLabel.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor, constant: 10.0).isActive = true
        numberOfRatingsLabel.bottomAnchor.constraint(equalTo: wrapperView.bottomAnchor, constant: -10.0).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


protocol NoResultsCellDelegate: class {
    func requestCourseTapped()
}

class NoResultsCell: UITableViewCell {
    static let identifier = "NoResultsCell"
    static let rowHeight: CGFloat = 130
    
    weak var delegate: NoResultsCellDelegate?
    
    let topLabel: UILabel = {
        let label = UILabel()
        label.text = "Course Not Found"
        label.font = UIFont(name: "Helvetica-Bold", size: 20.0)
        
        return label
    }()
    
    let bottomLabel: UILabel = {
        let label = UILabel()
        let request = NSMutableAttributedString(string: "Want to ", attributes: nil)
        request.append(NSAttributedString(string: "request it?", attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue]))
        
        label.font = UIFont(name: "Helvetica-Light", size: 14.0)
        label.attributedText = request
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
       
        addSubviewLayout(topLabel)
        addSubviewLayout(bottomLabel)
        
        topLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        topLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        bottomLabel.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 5.0).isActive = true
        bottomLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tappedRequestCourse))
        bottomLabel.addGestureRecognizer(tap)
        bottomLabel.isUserInteractionEnabled = true
    }
    
    @objc func tappedRequestCourse() {
        delegate?.requestCourseTapped()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

