//
//  FirstCustomSegueUnwind.swift
//  CustomSegues
//
//  Created by Yuhsuan Lin on 2016/10/20.
//  Copyright © 2016年 cgua. All rights reserved.
//

import UIKit

class FirstCustomSegueUnwind: UIStoryboardSegue {

    
    override func perform() {
        
        let secondVCView = self.source.view as UIView!
        
        let firstVCView = self.destination.view as UIView!
        
        let screenHeight = UIScreen.main.bounds.size.height
        
        
        let window = UIApplication.shared.keyWindow
        
        window?.insertSubview(firstVCView!, aboveSubview: secondVCView!)
        
        UIView.animate(withDuration: 0.4, animations: { () -> Void in
            
            firstVCView?.frame = (firstVCView?.frame.offsetBy(dx: 0.0, dy: screenHeight))!
            
            secondVCView?.frame = (secondVCView?.frame.offsetBy(dx: 0.0, dy: screenHeight))!
            
        }) { (Finished) -> Void in
            
            self.source.dismiss(animated: false, completion: nil)
        }
    }
}
