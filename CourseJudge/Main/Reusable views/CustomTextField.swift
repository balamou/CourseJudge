//
//  CustomTextField.swift
//  CourseJudge
//
//  Created by Michel Balamou on 2020-03-10.
//  Copyright © 2020 Michel Balamou. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {
    private var padding = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
    
    convenience init(margin: UIEdgeInsets) {
        self.init(frame: .zero)
        self.padding = margin
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

class MessageTextField: UIView {
    
    var text: String = "" {
        didSet {
            textField.text = text
        }
    }
    
    var header: String = "" {
        didSet {
            messageLabel.text = header
        }
    }
    
    weak var delegate: UITextFieldDelegate? {
        didSet {
            textField.delegate = delegate
        }
    }
    
    override var tag: Int {
        didSet{
            textField.tag = tag
        }
    }
    
    let messageLabel: UILabel = {
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
    
    let textField: CustomTextField = {
        let textField = CustomTextField(margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        textField.isUserInteractionEnabled = false
        
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 5
        backgroundColor = UIColor.black.withAlphaComponent(0.15)
        
        addSubviewLayout(stackView)
        stackView.fill(in: self)
        
        stackView.addArrangedSubview(messageLabel)
        stackView.addArrangedSubview(textField)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
