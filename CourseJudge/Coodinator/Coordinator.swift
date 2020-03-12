//
//  Coordinator.swift
//  CourseJudge
//
//  Created by Michel Balamou on 2020-03-09.
//  Copyright © 2020 Michel Balamou. All rights reserved.
//

import UIKit

class Coordinator {
    private let mainNavigationVC: UINavigationController = UINavigationController()
    
    func start() -> UIViewController {
        let mainVC = MainViewController()
        mainVC.delegate = self
        
        mainNavigationVC.isNavigationBarHidden = true
        mainNavigationVC.addChild(mainVC)
        mainNavigationVC.delegate = mainVC
        
        return mainNavigationVC
    }
    
}

extension Coordinator: MainViewControllerDelegate {
    
    func mainViewControllerTapSearch() {
        let searchVC = SearchViewController()
        searchVC.delegate = self
        
        mainNavigationVC.pushViewController(searchVC, animated: true)
    }
    
}

extension Coordinator: SearchViewControllerDelegate {
    
    func searchViewControllerCancel() {
        mainNavigationVC.popViewController(animated: true)
    }
    
    func searchViewControllerRequestUniversity() {
        let requestUniVC = RequestUniversityViewController()
        
        mainNavigationVC.pushViewController(requestUniVC, animated: true)
    }
    
    func searchViewController(_ searchViewController: SearchViewController, didSelect university: University) {
        let universityVC = UniversityViewController()
        
        mainNavigationVC.pushViewController(universityVC, animated: true)
    }
}
