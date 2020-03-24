//
//  MultilineTextField.swift
//  CourseJudge
//
//  Created by Michel Balamou on 2020-03-24.
//  Copyright © 2020 Michel Balamou. All rights reserved.
//

import UIKit

class MulilineTextField: UIView {
    
    var text: String = "" {
        didSet {
            textView.text = text
        }
    }
    
    var header: String = "" {
        didSet {
            headerLabel.text = header
        }
    }
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica", size: 12.0)
        label.textColor = UIColor.black.withAlphaComponent(0.60)
        
        return label
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .fill
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 3, left: 10, bottom: 3, right: 0)
        
        return stackView
    }()
    
    let textView: UITextView = {
        let textView = UITextView()
        textView.autocorrectionType = .no
        textView.autocapitalizationType = .none
        textView.font = UIFont.systemFont(ofSize: 15.0)
        textView.backgroundColor = .none
        
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 5
        backgroundColor = UIColor.black.withAlphaComponent(0.15)
        
        addSubviewLayout(headerLabel)
        headerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5.0).isActive = true
        headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10.0).isActive = true
        
        addSubviewLayout(textView)
        textView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 0.0).isActive = true
        textView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10.0).isActive = true
        textView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10.0).isActive = true
        textView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10.0).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
