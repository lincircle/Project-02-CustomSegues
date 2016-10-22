//
//  SecondCustomSegue.swift
//  CustomSegues
//
//  Created by Yuhsuan Lin on 2016/10/20.
//  Copyright © 2016年 cgua. All rights reserved.
//

import UIKit

class SecondCustomSegue: UIStoryboardSegue {

    
    override func perform() {
        
        let first_vc_view = source.view as UIView!
        
        let third_vc_view = destination.view as UIView!
        
        let window = UIApplication.shared.keyWindow
        
        window?.insertSubview(third_vc_view!, belowSubview: first_vc_view!)
        
        third_vc_view?.transform = third_vc_view!.transform.scaledBy(x: 0.001, y: 0.001)
        
        UIView.animate(withDuration: 0.5, animations: { () -> Void in
            
            first_vc_view!.transform = (third_vc_view?.transform)!.scaledBy(x: 0.001, y: 0.001)
            
        }) { (Finished) -> Void in
            
            UIView.animate(withDuration: 0.5, animations: { () -> Void in
                third_vc_view!.transform = CGAffineTransform.identity
                
                }, completion: { (Finished) -> Void in
                    
                    first_vc_view?.transform = CGAffineTransform.identity
                    self.source.present(self.destination, animated: false, completion: nil)
            })
        }
    }
}
