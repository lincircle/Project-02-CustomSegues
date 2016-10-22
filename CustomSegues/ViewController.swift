//
//  ViewController.swift
//  CustomSegues
//
//  Created by Yuhsuan Lin on 2016/10/20.
//  Copyright © 2016年 cgua. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var one_message_label: UILabel!
    
    @IBAction func showThirdViewController(sender: Any) {
        
        self.performSegue(withIdentifier: "idSecondSegue", sender: self)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeGestureRecognizer: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.showSecondViewController))
        
        swipeGestureRecognizer.direction = UISwipeGestureRecognizerDirection.up
        
        self.view.addGestureRecognizer(swipeGestureRecognizer)
    }
    
    func showSecondViewController() {
        
        self.performSegue(withIdentifier: "idFirstSegue", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "idFirstSegue" {
            
            let second_view_controller = segue.destination as! SecondViewController
            
            second_view_controller.message = "Hello from the 1st View Controller"
        }
    }
    
    //到第三個視圖按鈕
    @IBAction func returnFromSegueActions(sender: UIStoryboardSegue){
     
        if sender.identifier == "idFirstSegueUnwind" {
            
            let originalColor = self.view.backgroundColor
            
            self.view.backgroundColor = UIColor.red
            
            UIView.animate(withDuration: 0.5, animations: { () -> Void in
            
                self.view.backgroundColor = originalColor
            
            })
        }
        else {
            
            self.one_message_label.text = "Welcome back!"
        }
        
    }
    
    
    override func segueForUnwinding(to toViewController: UIViewController, from fromViewController: UIViewController, identifier: String?) -> UIStoryboardSegue {
        
        if let id = identifier {
            
            if id == "idFirstSegueUnwind" {
                
                let unwindSegue = FirstCustomSegueUnwind(identifier: id, source: fromViewController, destination: toViewController, performHandler: { () -> Void in
                    
                })
                
                return unwindSegue
            }
            else if id == "idSecondSegueUnwind" {
                
                let unwindSegue = SecondCustomSegueUnwind(identifier: id, source: fromViewController, destination: toViewController, performHandler: { () -> Void in
                    
                })
                
                return unwindSegue
                
            }
        }
        
        return super.segueForUnwinding(to: toViewController, from: fromViewController, identifier: identifier)!

    }
    
}

