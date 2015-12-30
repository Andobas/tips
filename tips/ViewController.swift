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
    
    @IBOutlet weak var tipTitleLabel: UILabel!
    
    @IBOutlet weak var totalTitleLabel: UILabel!
    @IBOutlet weak var whiteFrameView: UIView!
    
    var lowestTip: Float!
    var midTip: Float!
    var highestTip: Float!
    let userDefaults = NSUserDefaults.standardUserDefaults()
    var currencyFormatter = NSNumberFormatter()
    
    @IBOutlet weak var person: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Sets the title in the Navigation Bar
        self.title = "Tip Calculator"
        
        // Do any additional setup after loading the view, typically from a nib.
        
        person.image = UIImage()
        
       
       tipLabel.text = currencyFormatter.stringFromNumber(0.00)
       totalLabel.text = currencyFormatter.stringFromNumber(0.00)
       
        
    }

    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        
        lowestTip = userDefaults.floatForKey("lowest_tip");
        midTip = userDefaults.floatForKey("mid_tip");
        highestTip = userDefaults.floatForKey("highest_tip");
        
        tipControl.setTitle("\(Int(lowestTip))%", forSegmentAtIndex: 0)
        tipControl.setTitle("\(Int(midTip))%", forSegmentAtIndex: 1)
        tipControl.setTitle("\(Int(highestTip))%", forSegmentAtIndex: 2)
        userDefaults.synchronize()
        
        
        
        currencyFormatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        currencyFormatter.locale = NSLocale.currentLocale()
        
        billField.becomeFirstResponder()
        
        
        self.tipLabel.alpha = 0
        self.tipTitleLabel.alpha = 0
        self.totalLabel.alpha = 0
        self.totalTitleLabel.alpha = 0
        self.whiteFrameView.alpha = 0

        
        
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
            person.image = UIImage(named: "shoes-sad.png")

        }
        if (tipControl.selectedSegmentIndex == 1) {
            tipPercentage = Double(userDefaults.floatForKey("mid_tip")) / 100.0
            person.image = UIImage(named: "indifferent person.png")
            
        }
        if (tipControl.selectedSegmentIndex == 2) {
            tipPercentage = Double(userDefaults.floatForKey("highest_tip")) / 100.0
            person.image = UIImage(named: "star.png")
            
        }
        
        
        // Optionally initialize the property to a desired starting value
        self.tipLabel.alpha = 0
        self.tipTitleLabel.alpha = 0
        self.totalLabel.alpha = 0
        self.totalTitleLabel.alpha = 0
        self.person.alpha = 1
        UIView.animateWithDuration(2, animations: {
            // This causes first view to fade in and second view to fade out
            self.tipLabel.alpha = 1
            self.tipTitleLabel.alpha = 1
            self.totalLabel.alpha = 1
            self.totalTitleLabel.alpha = 1
            self.person.alpha = 0
        })


        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        
        
        tipLabel.text = currencyFormatter.stringFromNumber(tip)
        totalLabel.text = currencyFormatter.stringFromNumber(total)
        
        
        
       // tipLabel.text = String(format: "$%.2f", tip)
        //totalLabel.text = String(format: "$%.2f", total)
        
        
    }

//    @IBAction func onTap(sender: AnyObject) {
//        view.endEditing(true)
//    }
}






