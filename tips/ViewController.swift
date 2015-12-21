//
//  ViewController.swift
//  tips
//
//  Created by Juan Hernandez on 12/13/15.
//  Copyright © 2015 codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    var lowestTip: Float!
    var midTip: Float!
    var highestTip: Float!
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
//        tipLabel.text = "$0.00"
//        totalLabel.text = "$0.00"
    }

    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        
        lowestTip = userDefaults.floatForKey("lowest_tip");
        midTip = userDefaults.floatForKey("mid_tip");
        highestTip = userDefaults.floatForKey("highest_tip");
        
        tipControl.setTitle("\(lowestTip)", forSegmentAtIndex: 0)
        tipControl.setTitle("\(midTip)", forSegmentAtIndex: 1)
        tipControl.setTitle("\(highestTip)", forSegmentAtIndex: 2)
        userDefaults.synchronize()
        
        print("view will appear")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        
        userDefaults.setFloat(lowestTip, forKey: "lowest_tip")
        userDefaults.setFloat(midTip, forKey: "mid_tip")
        userDefaults.setFloat(highestTip, forKey: "highest_tip")
        userDefaults.synchronize()
        
        print("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentage = 0.0
        if (tipControl.selectedSegmentIndex == 0) {
            tipPercentage = Double(userDefaults.floatForKey("lowest_tip")) / 100.0
        }
        if (tipControl.selectedSegmentIndex == 1) {
            tipPercentage = Double(userDefaults.floatForKey("mid_tip")) / 100.0
        }
        if (tipControl.selectedSegmentIndex == 2) {
            tipPercentage = Double(userDefaults.floatForKey("highest_tip")) / 100.0
        }
        
        

        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        
    }

//    @IBAction func onTap(sender: AnyObject) {
//        view.endEditing(true)
//    }
}






