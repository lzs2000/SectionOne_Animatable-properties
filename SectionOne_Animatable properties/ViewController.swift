//
//  ViewController.swift
//  SectionOne_Animatable properties
//
//  Created by 刘璐璐 on 2017/6/6.
//  Copyright © 2017年 刘璐璐. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //云
    @IBOutlet weak var cloud1: UIImageView!
    @IBOutlet weak var cloud4: UIImageView!
    @IBOutlet weak var cloud3: UIImageView!
    @IBOutlet weak var cloud2: UIImageView!
    
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var heading: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         print("\(#function) in \(object_getClassName(self))")
        
        
        
        /* here are the properties you can use to modify a view's position and size
         bounds: Animate this property to reposition the view's content within the view's frame
         frame: Animate this property to move and/or scale the view
         center: Animate this property when you want to move the view to a new location on screen
         you can change the appearance of the view's content by either tinting its background or making the view fully or semi-transparent
         .backgroundColor:
         .alpha. Change this property to create fade-in and fade-out effects
         
         transformation
         .transform: Modify this property within an animation block to animate the rotation, scale, and or position of a view
         */
      
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         print("\(#function) in \(object_getClassName(self))")
        heading.center.x -= view.bounds.width
        username.center.x -= view.bounds.width
        password.center.x -= view.bounds.width
        
        cloud1.alpha = 0.0
        cloud2.alpha = 0.0
        cloud3.alpha = 0.0
        cloud4.alpha = 0.0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
         print("\(#function) in \(object_getClassName(self))")
        UIView.animate(withDuration: 0.5) {
            self.heading.center.x += self.view.bounds.width
        }
        UIView.animate(withDuration: 0.5, delay: 0.3, options: [], animations: {
            self.username.center.x += self.view.bounds.width
        }, completion: nil)
        UIView.animate(withDuration: 0.5, delay: 0.4, options: [], animations: {
            self.password.center.x += self.view.bounds.width
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5) {
            self.cloud1.alpha = 1.0
        }
        UIView.animate(withDuration: 0.5, delay: 0.7, options: [], animations: {
            self.cloud2.alpha = 1.0
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.9, options: [], animations: {
            self.cloud3.alpha = 1.0
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 1.1, options: [], animations: {
            self.cloud4.alpha = 1.0
        }, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
         print("\(#function) in \(object_getClassName(self))")
        // Dispose of any resources that can be recreated.
    }


}

