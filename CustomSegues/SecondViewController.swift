//
//  SecondViewController.swift
//  CustomSegues
//
//  Created by Yuhsuan Lin on 2016/10/20.
//  Copyright © 2016年 cgua. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet var second_message_label: UILabel!
    
    var message: String!


    override func viewDidLoad() {
        super.viewDidLoad()

        second_message_label.text = message
        
        let swipeGestureRecognizer: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.showFirstViewController))
        
        swipeGestureRecognizer.direction = UISwipeGestureRecognizerDirection.down
        
        self.view.addGestureRecognizer(swipeGestureRecognizer)
    }
    
    func showFirstViewController() {
        
        self.performSegue(withIdentifier: "idFirstSegueUnwind", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "idFirstSegueUnwind" {
            
            let first_view_controller = segue.destination as! ViewController
            
            first_view_controller.one_message_label.text = "You just came back from the 2nd VC"
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
