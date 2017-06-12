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
let label = UILabel()

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
        
        //spring弹簧效果
        /*
         *mass 质量, 影响图层运动时的弹簧惯性, 质量越大, 弹簧拉伸和压缩的幅度越大
         动画的速度变慢, 并且波动幅度变大
         stiffness 刚度系数 刚度系数越大, 形变产生的力就越大, 运动越快
         damping 阻尼系数, 阻止弹簧伸缩的系数, 阻尼系数越大, 停止越快
         initialVelocity: 初始速率, 动画视图的初始速度大小, 速率为正数时, 速度方向与运动方向一致, 速率为负数时, 速度方向与运动防线反向
         settingDuration: 结算时间 返回弹簧动画到停止时的估算时间, 根据当前的动画参数估算, 通常弹簧的动画时间使用结算时间比较准确
         
       */
        label.frame = CGRect(x: 200, y: 100, width: 100, height: 40)
        label.backgroundColor = UIColor.cyan
        let spring = CASpringAnimation(keyPath: "position.x")
        spring.damping = 5
        spring.stiffness = 100
        spring.mass = 1
        spring.initialVelocity = -20
        spring.fromValue = label.layer.position.x
        spring.toValue = label.layer.position.x + 50
        spring.duration = spring.settlingDuration
        label.layer.add(spring, forKey: spring.keyPath)
        view.addSubview(label)
        
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
    

   }

