//
//  UniversityViewController.swift
//  CourseJudge
//
//  Created by Michel Balamou on 2020-03-12.
//  Copyright © 2020 Michel Balamou. All rights reserved.
//

import UIKit

class UniversityViewController: UIViewController {
    private var universityView: UniversityView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        universityView = UniversityView()
        view = universityView
        
        view.backgroundColor = .random(seed: "University")
    }
    
}

