//
//  FirstCustomSegue.swift
//  CustomSegues
//
//  Created by Yuhsuan Lin on 2016/10/20.
//  Copyright © 2016年 cgua. All rights reserved.
//

import UIKit

class FirstCustomSegue: UIStoryboardSegue {
    
    override func perform() {
        
        //指定來源與目標視圖給區域變數
        
        var firstVCView = self.source.view as UIView!
        
        var secondVCView = self.destination.view as UIView!
        
        let screenWidth = UIScreen.main.bounds.size.width
        
        let screenHight = UIScreen.main.bounds.size.height
        
        secondVCView!.frame = CGRect(x: 0.0, y: screenHight, width: screenWidth, height: screenHight)
        
        let window = UIApplication.shared.keyWindow
        
        window?.insertSubview(secondVCView!, aboveSubview: firstVCView!)
        
        //轉移動畫
        /*
        UIView.animate(withDuration: 0.4, animations:{ () -> void in
         
            firstVCView?.frame = CGRect.offsetBy(firstVCView?.frame, 0.0, -screenHight)
            
            secondVCView?.frame = CGRect.offsetBy(secondVCView.frame, 0.0, -screenHight)
        
        }) { (Finished) -> Void in
            
            self.source.presentedViewController(self.destination as! UIViewController, animate: false, completion: nil)
            
        }
        */
        
        UIView.animate(withDuration: 0.4, animations: { () -> Void in
            firstVCView?.frame = (firstVCView?.frame.offsetBy(dx: 0.0, dy: -screenHight))!
            secondVCView?.frame = (secondVCView?.frame.offsetBy(dx: 0.0, dy: -screenHight))!
            
        }) { (Finished) -> Void in
            self.source.present(self.destination as UIViewController,
                    animated: false,
                    completion: nil)
        }
    }

}
