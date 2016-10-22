//
//  SecondCustomSegueUnwind.swift
//  CustomSegues
//
//  Created by Yuhsuan Lin on 2016/10/20.
//  Copyright © 2016年 cgua. All rights reserved.
//

import UIKit

class SecondCustomSegueUnwind: UIStoryboardSegue {

    
    override func perform() {
        
        let first_vc_view = destination.view! as UIView!
        let third_vc_view = source.view! as UIView!
        
        let screenHeight = UIScreen.main.bounds.size.height
        
        first_vc_view!.frame = first_vc_view!.frame.offsetBy(dx: 0.0, dy: screenHeight)
        
        first_vc_view!.transform =  (first_vc_view?.transform)!.scaledBy(x: 0.001, y: 0.001)
        
        let window = UIApplication.shared.keyWindow
        
        window?.insertSubview(first_vc_view!, aboveSubview: third_vc_view!)
        
        
        UIView.animate(withDuration:0.5, animations: { () -> Void in
            
            third_vc_view!.transform = (third_vc_view!.transform).scaledBy(x: 0.001, y: 0.001)
            third_vc_view!.frame.offsetBy(dx: 0.0, dy: -screenHeight)
            
            first_vc_view!.transform = CGAffineTransform.identity
            first_vc_view!.frame = first_vc_view!.frame.offsetBy(dx: 0.0, dy: -screenHeight)
            
        }) { (Finished) -> Void in
            
            self.source.dismiss(animated:false, completion: nil)
        }
    }
}
