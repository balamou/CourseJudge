//
//  ViewController.swift
//  CourseJudge
//
//  Created by Michel Balamou on 2020-03-09.
//  Copyright © 2020 Michel Balamou. All rights reserved.
//

import UIKit


protocol MainViewControllerDelegate: class {
    func mainViewControllerTapSearch()
}

class MainViewController: UIViewController {
    weak var delegate: MainViewControllerDelegate?
    private var mainView: MainView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView = MainView()
        view = mainView
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tappedSearchField))
        mainView.searchField.addGestureRecognizer(tap)
    }
    
    @objc func tappedSearchField() {
        delegate?.mainViewControllerTapSearch()
    }

}
