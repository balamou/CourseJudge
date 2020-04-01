//
//  SomeTransitionManager.swift
//  CourseJudge
//
//  Created by Michel Balamou on 2020-03-28.
//  Copyright © 2020 Michel Balamou. All rights reserved.
//

import UIKit

class SomeTransitionManager: UIPercentDrivenInteractiveTransition, UIViewControllerAnimatedTransitioning, UINavigationControllerDelegate {
    private let animationDuration = 2.0
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return animationDuration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        
        guard let fromView = transitionContext.view(forKey: .from) else { return }
        guard let toView = transitionContext.view(forKey: .to) else { return }
        
        containerView.addSubview(toView)
        toView.alpha = 0.0
        UIView.animate(withDuration: animationDuration, animations: {
            toView.alpha = 1.0
        }, completion: { _ in
            transitionContext.completeTransition(true)
        })
    }
    
}

// Bind everything together
extension SomeTransitionManager: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
    func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        // Presenting usually doesn't have any interactivity
        return nil
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return self
    }
}
