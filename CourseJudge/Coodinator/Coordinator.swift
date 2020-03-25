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
    private let fadingAnimation = FadingAnimationDelegate()
    
    func start() -> UIViewController {
        let mainVC = MainViewController()
        mainVC.delegate = self
        
        mainNavigationVC.isNavigationBarHidden = true
        mainNavigationVC.addChild(mainVC)
        mainNavigationVC.delegate = fadingAnimation
        
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
        let universityVC = UniversityViewController(university: university)
        universityVC.delegate = self
        
        mainNavigationVC.delegate = nil
        mainNavigationVC.pushViewController(universityVC, animated: true)
    }
}

extension Coordinator: UniversityViewControllerDelegate {
    
    func universityViewControllerBack() {
        mainNavigationVC.popViewController(animated: true) {
            self.mainNavigationVC.delegate = self.fadingAnimation
        }
    }
        
    func universityViewControllerRequestCourse() {
        let requestCourseVC = RequestCourseViewController()
        
        mainNavigationVC.present(requestCourseVC, animated: true, completion: {})
    }
    
    func universityViewController(_ universityVC: UniversityViewController, selected course: Course) {
        let courseVC = CourseViewController(course: course)
        courseVC.delegate = self
        
        mainNavigationVC.pushViewController(courseVC, animated: true)
    }
    
    func universityViewController(_ universityVC: UniversityViewController, rate course: Course) {
        let rateVC = RateViewController(course: course)
        rateVC.delegate = self
        
        mainNavigationVC.pushViewController(rateVC, animated: true)
    }
}

extension Coordinator: CourseViewControllerDelegate {
    
    func courseViewControllerBack() {
        mainNavigationVC.popViewController(animated: true)
    }
    
    func courseViewController(_ courseViewController: CourseViewController, rate course: Course) {
        let rateVC = RateViewController(course: course)
        rateVC.delegate = self
        
        mainNavigationVC.pushViewController(rateVC, animated: true)
    }
}

extension Coordinator: RateViewControllerDelegate {
    
    func rateViewControllerDoneRating() {
        // TODO
    }
    
    func rateViewControllerBack() {
        mainNavigationVC.popViewController(animated: true)
    }
    
}
