//
//  TransitionsViewController.swift
//  SectionOne_Animatable properties
//
//  Created by 刘璐璐 on 2017/6/7.
//  Copyright © 2017年 刘璐璐. All rights reserved.
//

import UIKit

var animationContainerView: UIView!
let newView = UIImageView(image: UIImage(named: "12"))
let olderView = UIImageView(image: UIImage(named: "23"))
let btn = UIButton(frame: CGRect(x: 100, y: 600, width: 200, height: 50))


class TransitionsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        animationContainerView = UIView(frame: view.bounds)
        animationContainerView.frame = view.bounds
        view.addSubview(animationContainerView)
        
        btn.setTitle("button", for: .normal)
        btn.backgroundColor = UIColor.blue
        btn.addTarget(self, action: #selector(TransitionsViewController.replaceViewClick), for: .touchUpInside)
        view.addSubview(btn)
        

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //create new view, old view
        newView.center = animationContainerView.center
        olderView.center = animationContainerView.center
        
        //add the new view via transition
        UIView.transition(with: animationContainerView, duration: 0.33, options: [.curveEaseOut, .transitionFlipFromBottom], animations: { 
          animationContainerView.addSubview(newView)
        }, completion: { (true) in
//            
//            if true {
//                UIView.transition(with: animationContainerView, duration: 0.33, options: [.curveEaseOut, .transitionFlipFromBottom], animations: { 
//                    //newView.removeFromSuperview()
//                    newView.isHidden = true
//                }, completion: nil)
//            }
        })
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func  replaceViewClick() {
        
        UIView.transition(from: newView, to: olderView, duration: 0.33, options: .transitionFlipFromTop, completion: nil)
        
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
