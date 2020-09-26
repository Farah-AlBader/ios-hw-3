//
//  ViewController.swift
//  ios-hw-3-p1
//
//  Created by Mac on 9/24/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var heightField: UITextField!
    @IBOutlet weak var weightField: UITextField!
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet var background: UIView!
    @IBOutlet weak var wallpaper: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculateButton(_ sender: Any) {
        
        let height = Double(heightField.text!)
        let weight = Double(weightField.text!)
        let bmi = countBmi(height: height!, weight: weight!)
        bmiLabel.text = String(format: "%.1f", bmi)
        let status = statusValues(bmi)
        statusLabel.text = status
    }
    func countBmi(height: Double, weight: Double) -> Double {
        let bmiValue = weight / (height*height)
        return bmiValue
        
        }
    
    let wallpapers = ["1242x2688-wallpaper-53.jpg", "1242x2688-Wallpaper-428.jpg", "1242x2688-Wallpaper-123.jpg"]
    func statusValues (_ a: Double) -> String {
        //let color: UIColor
        if a < 16.0 {
       // self.wallpaper = UIImageView[wallpaper(0)]
        self.background.backgroundColor = #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)
        return "Severe Thinness"
        }else if a <= 17.0 {
       // self.background.backgroundColor = #colorLiteral(red: 0.6027250886, green: 0.9717847705, blue: 0.5553504825, alpha: 1)
        self.background.backgroundColor = #colorLiteral(red: 1, green: 0.8643681407, blue: 0.1842108369, alpha: 1)
        return "Moderate Thinness"
        }else if a <= 18.0{
       // self.background.backgroundColor = #colorLiteral(red: 0.7172529101, green: 0.1197857037, blue: 0.03862849995, alpha: 1)
        self.background.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        return "Mild Thinness"
        
        }else if a <= 25.0 {
        self.background.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
       return "Normal"
        
        }else if a <= 30.0 {
        self.background.backgroundColor = #colorLiteral(red: 0.9308661222, green: 0.5941160917, blue: 0.4049729407, alpha: 1)
        return "Overweight"
        }else if a <= 35.0 {
        self.background.backgroundColor = #colorLiteral(red: 1, green: 0.4968215823, blue: 0.4712712169, alpha: 1)
        return "Obese Class I"
        }else if a <= 40.0 {
        self.background.backgroundColor = #colorLiteral(red: 1, green: 0.3224865198, blue: 0.3390672803, alpha: 1)
       return "Obese Class II"
    }else {
        self.background.backgroundColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
       return "Obese Class III"
        }
    }
}
