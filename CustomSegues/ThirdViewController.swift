//
//  ThirdViewController.swift
//  CustomSegues
//
//  Created by Yuhsuan Lin on 2016/10/20.
//  Copyright © 2016年 cgua. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeGestureRecognizer: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.showFirstViewController))
        
        swipeGestureRecognizer.direction = UISwipeGestureRecognizerDirection.up
        
        self.view.addGestureRecognizer(swipeGestureRecognizer)
    }

    func showFirstViewController() {
        
        self.performSegue(withIdentifier: "idSecondSegueUnwind", sender: self)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
