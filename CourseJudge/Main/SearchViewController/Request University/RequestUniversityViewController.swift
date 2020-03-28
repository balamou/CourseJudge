//
//  RequestUniversityViewController.swift
//  CourseJudge
//
//  Created by Michel Balamou on 2020-03-12.
//  Copyright © 2020 Michel Balamou. All rights reserved.
//

import UIKit

class RequestUniversityViewController: UIViewController {
    
    private var requestUniView: RequestUniversityView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestUniView = RequestUniversityView()
        view = requestUniView
        
        requestUniView.cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        requestUniView.requestButton.addTarget(self, action: #selector(requestButtonTapped), for: .touchUpInside)
    }
    
    @objc func cancelButtonTapped() {
        dismiss(animated: true, completion: {})
    }
    
    @objc func requestButtonTapped() {
        let universityName = requestUniView.universityName.textField.text!
        let errorMessage = "cannot be empty"
        
        if universityName.isEmpty {
              requestUniView.universityName.setError(message: errorMessage)
        } else {
            requestUniView.universityName.setNormal()
           
            requestUniView.showSuccess {
                self.dismiss(animated: true, completion: {})
            }
        }
    }
    
    
}


