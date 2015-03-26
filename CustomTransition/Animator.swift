//
//  Animator.swift
//  CustomTransition
//
//  Created by Ackshaey Singh on 3/25/15.
//  Copyright (c) 2015 Ackshaey Singh. All rights reserved.
//

import UIKit

class Animator: NSObject, UIViewControllerAnimatedTransitioning {
    
    var operation: UINavigationControllerOperation
    
    init(operation: UINavigationControllerOperation) {
        self.operation = operation
        super.init()
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 1.0
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let fromVc = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        let toVc = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        let fromView = fromVc!.view
        let toView = toVc!.view
        
        // The entire background is contained in the container view and is the
        // background for all animations. 
        
        let containerView = transitionContext.containerView()
        containerView.backgroundColor = UIColor.whiteColor()
        
        let halfDuration = self.transitionDuration(transitionContext) / 2.0
        
        if (self.operation == UINavigationControllerOperation.Push){
            UIView.animateWithDuration(halfDuration, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 10.0, options: UIViewAnimationOptions.CurveLinear, animations: { () -> Void in
                fromView.transform = CGAffineTransformMakeScale(0.9, 0.9)
                }, completion: { (finished: Bool) -> Void in
                    // check if completed, then add the "to" view to the container view.
                    
                    if finished {
                        toView.frame = CGRect(x: containerView.frame.width, y: 0, width:  toView.frame.width, height: toView.frame.height)
                        
                        containerView.addSubview(toView)
                        
                        UIView.animateWithDuration(halfDuration, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 10.0, options: UIViewAnimationOptions.CurveLinear, animations: { () -> Void in
                            toView.frame = CGRect(x: 0, y: 0, width: toView.frame.width, height: toView.frame.height)
                            }, completion: { (finished: Bool) -> Void in
                                if finished {
                                    fromView.transform = CGAffineTransformIdentity
                                    transitionContext.completeTransition(true)
                                }
                        })
                        
                    }
            })
        } else {
            
            containerView.insertSubview(toView, belowSubview: fromView!)
            toView.transform = CGAffineTransformMakeScale(0.9, 0.9)
            
            UIView.animateWithDuration(halfDuration, delay: 0.4, usingSpringWithDamping: 0.5, initialSpringVelocity: 10.0,
                options: UIViewAnimationOptions.CurveLinear,
                animations: { () -> Void in
                    fromView!.frame = CGRect(x: containerView.frame.width, y: 0, width: fromView!.frame.width, height: fromView!.frame.height)
                }, completion: { (finished: Bool) -> Void in
                    if finished {
                        UIView.animateWithDuration(
                            halfDuration,
                            delay: 0,
                            usingSpringWithDamping: 0.5,
                            initialSpringVelocity: 10.0,
                            options: UIViewAnimationOptions.CurveLinear,
                            animations: { () -> Void in
                                toView.transform = CGAffineTransformIdentity
                            },
                            completion: { (finished: Bool) -> Void in
                                if finished {
                                    transitionContext.completeTransition(true)
                                }
                            })
                    }
            })
        }
        
        
        
        
        
    
    }
}
