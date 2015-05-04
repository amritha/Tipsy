//
//  ViewController.swift
//  Tipsy
//
//  Created by Amritha Prasad on 5/2/15.
//  Copyright (c) 2015 Amritha Prasad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var blueContainer: UIView!
    @IBOutlet weak var totalTwoLabel: UILabel!
    @IBOutlet weak var totalThreeLabel: UILabel!
    @IBOutlet weak var baller: UIImageView!
    
    //people images, is there a better way to do this?
    //split one way
    @IBOutlet weak var oneDude: UIImageView!
    
    //split two ways
    @IBOutlet weak var twoDudeOne: UIImageView!
    @IBOutlet weak var twoDudeTwo: UIImageView!
    
    //split three ways
    @IBOutlet weak var threeDudeOne: UIImageView!
    @IBOutlet weak var threeDudeTwo: UIImageView!
    @IBOutlet weak var threeDudeThree: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Hiding everything except the bill field
        self.tipLabel.alpha = 0
        self.totalLabel.alpha = 0
        self.totalTwoLabel.alpha = 0
        self.totalThreeLabel.alpha = 0
        self.tipControl.alpha = 0
        self.blueContainer.alpha = 0
        
        self.oneDude.alpha = 0
        self.twoDudeOne.alpha = 0
        self.twoDudeTwo.alpha = 0
        self.threeDudeOne.alpha = 0
        self.threeDudeTwo.alpha = 0
        self.threeDudeThree.alpha = 0
        self.baller.alpha = 0
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //Editing the bill field
    @IBAction func onEditingChanged(sender: AnyObject) {
        
        //Populating the segment controller with tip %
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        //Calculating the bill
        var billAmount = NSString(string: billField.text).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        var totalTwo = (billAmount + tip) / 2
        var totalThree = (billAmount + tip) / 3
        
        //Baller Aziz image
        var baller = UIImage(named: "Baller.png")
        var ballerImageView = UIImageView(image: baller)
        
        //Fade in calculations only when bill field a number
        if(billField.hasText()){
            UIView.animateWithDuration(0.4, animations: {
                self.tipLabel.alpha = 1
                self.totalLabel.alpha = 1
                self.totalTwoLabel.alpha = 1
                self.totalThreeLabel.alpha = 1
                self.tipControl.alpha = 1
                self.blueContainer.alpha = 1
                
                self.oneDude.alpha = 1
                self.twoDudeOne.alpha = 1
                self.twoDudeTwo.alpha = 1
                self.threeDudeOne.alpha = 1
                self.threeDudeTwo.alpha = 1
                self.threeDudeThree.alpha = 1
            })
        }
        //Fade out calculations when bill field is empty
        else {
            UIView.animateWithDuration(0.4, animations: {
                self.tipLabel.alpha = 0
                self.totalLabel.alpha = 0
                self.totalTwoLabel.alpha = 0
                self.totalThreeLabel.alpha = 0
                self.tipControl.alpha = 0
                self.blueContainer.alpha = 0
                
                self.oneDude.alpha = 0
                self.twoDudeOne.alpha = 0
                self.twoDudeTwo.alpha = 0
                self.threeDudeOne.alpha = 0
                self.threeDudeTwo.alpha = 0
                self.threeDudeThree.alpha = 0
            })
        }
        
        //Fade in Baller Aziz image when the bill amount reaches swag status
        if (billAmount > 200){
            UIView.animateWithDuration(1.2, animations: {
              self.baller.alpha = 1
            })
        }
        else {
            UIView.animateWithDuration(1.2, animations: {
                self.baller.alpha = 0
        })
        }
        
        //Format fields
        tipLabel.text = String(format: "+ $%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        totalTwoLabel.text = String(format: "$%.2f", totalTwo)
        totalThreeLabel.text = String(format: "$%.2f", totalThree)
    }
    
    
    //Dismiss keyboard on tap
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

}

