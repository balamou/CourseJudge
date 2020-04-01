//
//  TransitionAnimator.swift
//  CourseJudge
//
//  Created by Michel Balamou on 2020-03-11.
//  Copyright © 2020 Michel Balamou. All rights reserved.
//

import UIKit

final class TransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    private let duration = TimeInterval(UINavigationController.hideShowBarDuration)
    private let operation: UINavigationController.Operation
    weak var storedContext: UIViewControllerContextTransitioning?
    
    init(operation: UINavigationController.Operation) {
        self.operation = operation
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        storedContext = transitionContext
        let containerView = transitionContext.containerView
       
        guard let toView = transitionContext.view(forKey: .to) else { return }
        
        containerView.addSubview(toView)
        toView.alpha = 0.0
        UIView.animate(withDuration: duration,
                       animations: {
                        toView.alpha = 1.0
        }, completion: { _ in
            transitionContext.completeTransition(true)
        })
    }
}
