//
//  UIViewControllerExt.swift
//  GoalPost
//
//  Created by Zach Cervi on 11/9/17.
//  Copyright © 2017 Zach Cervi. All rights reserved.
//

import UIKit

extension UIViewController{
    func presentDetail(_ viewControllerToPresent: UIViewController){
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        self.view.window?.layer.add(transition, forKey: kCATransition)
        
        present(viewControllerToPresent, animated: false, completion: nil)
    }
    
    func presentSecondaryDetail(_ viewControllerToPresent: UIViewController){
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        
        guard let presentedViewController =  presentedViewController else {return}
        presentedViewController.dismiss(animated: false)
        self.view.window?.layer.add(transition, forKey: kCATransition)
        self.present(viewControllerToPresent, animated: false, completion: nil)
        
    }
    func dismissDetail(){
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromLeft
        self.view.window?.layer.add(transition, forKey: kCATransition)
        
        dismiss(animated: false, completion: nil)
    }
    
    
}
