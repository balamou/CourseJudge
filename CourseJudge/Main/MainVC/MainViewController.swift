//
//  ViewController.swift
//  CourseJudge
//
//  Created by Michel Balamou on 2020-03-09.
//  Copyright © 2020 Michel Balamou. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    private var mainView: MainView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView = MainView()
        view = mainView
    }


}

