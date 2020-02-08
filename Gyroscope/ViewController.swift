//
//  ViewController.swift
//  Gyroscope
//
//  Created by Kristoforus David on 07/01/20.
//  Copyright © 2020 Kristoforus David. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    @IBOutlet weak var xGyroLabel: UILabel!
    @IBOutlet weak var yGyroLabel: UILabel!
    @IBOutlet weak var zGyroLabel: UILabel!
    
    var motion = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myGyroscope()
    }

    func myGyroscope(){
        motion.gyroUpdateInterval = 0.1
        if motion.isGyroAvailable{
            motion.startGyroUpdates(to: .main) { (data, error) in
                if let trueData = data{
                    let x = trueData.rotationRate.x
                    let y = trueData.rotationRate.y
                    let z = trueData.rotationRate.z
                    
                    self.xGyroLabel.text = "x: \(x)"
                    self.yGyroLabel.text = "x: \(y)"
                    self.zGyroLabel.text = "x: \(z)"
                    
                    self.view.backgroundColor = UIColor.init(displayP3Red: CGFloat(x/3), green: CGFloat(y/3), blue: CGFloat(z/3), alpha: 1)
                }
            }
        }
    }

}

