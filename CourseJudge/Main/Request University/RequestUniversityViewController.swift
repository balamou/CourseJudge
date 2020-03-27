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
    }
    
}


