//
//  UniversityViewController.swift
//  CourseJudge
//
//  Created by Michel Balamou on 2020-03-12.
//  Copyright © 2020 Michel Balamou. All rights reserved.
//

import UIKit

protocol UniversityViewControllerDelegate: class {
    func universityViewControllerBack()
}

class UniversityViewController: UIViewController {
    weak var delegate: UniversityViewControllerDelegate?
    private var universityView: UniversityView!
    
    private let university: University
    
    init(university: University) {
        self.university = university
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        universityView = UniversityView()
        view = universityView
        
        view.backgroundColor = .random(seed: university.name)
        
        universityView.backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
    }
    
    @objc func back() {
        delegate?.universityViewControllerBack()
    }
    
}

