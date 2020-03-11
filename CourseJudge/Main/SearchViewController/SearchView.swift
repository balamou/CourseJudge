//
//  SearchView.swift
//  CourseJudge
//
//  Created by Michel Balamou on 2020-03-10.
//  Copyright © 2020 Michel Balamou. All rights reserved.
//

import UIKit

class SearchView: UIView {
    
    var searchField: CustomTextField = {
        let textField = CustomTextField(margin: UIEdgeInsets(top: 2, left: 30, bottom: 2, right: 0))
        textField.placeholder = "Search"
        textField.backgroundColor = UIColor.black.withAlphaComponent(0.15)
        textField.layer.cornerRadius = 5
        
        return textField
    }()
    
    var cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cancel", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica", size: 15.0)
        
        return button
    }()
    
    var searchResults: UITableView = {
        let tableView = UITableView()
        
        return tableView
    }()
    
    var noResultsView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
//        view.isHidden = true
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.layoutMargins = UIEdgeInsets(top: 15, left: 20, bottom: 5, right: 20)
        stackView.spacing = 10.0
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.addArrangedSubview(searchField)
        stackView.addArrangedSubview(cancelButton)
        
        addSubviewLayout(stackView)
        stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 60.0).isActive = true
        
        addSubviewLayout(searchResults)
        searchResults.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10.0).isActive = true
        searchResults.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        searchResults.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        searchResults.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        addSubviewLayout(noResultsView)
        noResultsView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10.0).isActive = true
        noResultsView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        noResultsView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        noResultsView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        /// No results view
        let topLabel = UILabel()
        let bottomLabel = UILabel()
        
        let request = NSMutableAttributedString(string: "Want to ", attributes: nil)
        request.append(NSAttributedString(string: "request it?", attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue]))
        
        topLabel.text = "University Not Found"
        bottomLabel.attributedText = request
        
        topLabel.font = UIFont(name: "Helvetica-Bold", size: 20.0)
        bottomLabel.font = UIFont(name: "Helvetica-Light", size: 14.0)
        
        noResultsView.addSubviewLayout(topLabel)
        noResultsView.addSubviewLayout(bottomLabel)
        
        topLabel.centerXAnchor.constraint(equalTo: noResultsView.centerXAnchor).isActive = true
        topLabel.centerYAnchor.constraint(equalTo: noResultsView.centerYAnchor, constant: -80.0).isActive = true
        
        bottomLabel.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 5.0).isActive = true
        bottomLabel.centerXAnchor.constraint(equalTo: noResultsView.centerXAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
    
}
