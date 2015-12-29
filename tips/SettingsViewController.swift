//
//  SettingsViewController.swift
//  tips
//
//  Created by Juan Hernandez on 12/14/15.
//  Copyright © 2015 codepath. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    var lowestTip: Float!
    var midTip: Float!
    var highestTip: Float!
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    
    

    @IBOutlet weak var newTipField: UITextField!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        
        lowestTip = userDefaults.floatForKey("lowest_tip");
        midTip = userDefaults.floatForKey("mid_tip");
        highestTip = userDefaults.floatForKey("highest_tip");
        
        segmentControl.setTitle("\(Int(lowestTip))%", forSegmentAtIndex: 0)
        segmentControl.setTitle("\(Int(midTip))%", forSegmentAtIndex: 1)
        segmentControl.setTitle("\(Int(highestTip))%", forSegmentAtIndex: 2)
        userDefaults.synchronize()
        
        newTipField.becomeFirstResponder()
        
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
    
    @IBAction func segmentControlTapped(sender: AnyObject) {
        print(segmentControl.selectedSegmentIndex)
        print(newTipField.text)
        if segmentControl.selectedSegmentIndex == 0 {
            newTipField.text = "\(lowestTip)"
        }
        if segmentControl.selectedSegmentIndex == 1 {
            newTipField.text = "\(midTip)"
        }
        if segmentControl.selectedSegmentIndex == 2 {
            newTipField.text = "\(highestTip)"
        }
      
        
    }

    
    
    
    @IBAction func defaultInputTyped(sender: AnyObject){
        print(newTipField.text)
        if segmentControl.selectedSegmentIndex == 0 {
            lowestTip = NSString(string: newTipField.text!).floatValue
        }
        if segmentControl.selectedSegmentIndex == 1 {
            midTip = NSString(string: newTipField.text!).floatValue
        }
        if segmentControl.selectedSegmentIndex == 2 {
            highestTip = NSString(string: newTipField.text!).floatValue
        }
        
        
        segmentControl.setTitle(newTipField.text, forSegmentAtIndex: segmentControl.selectedSegmentIndex)
        
        
        
    }
    
    
    
    @IBAction func onTap(sender: UITapGestureRecognizer) {
        
        view.endEditing(true)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
