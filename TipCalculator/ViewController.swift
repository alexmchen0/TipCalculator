//
//  ViewController.swift
//  TipCalculator
//
//  Created by Alex Chen on 1/4/17.
//  Copyright © 2017 Alex Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var peopleLabel: UILabel!
    @IBOutlet weak var peopleStepper: UIStepper!
    @IBOutlet weak var costPerPersonLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Dismisses keyboard when screen is tapped
    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    // Sets the slider and percentage values accordingly when slider is changed
    @IBAction func onSliderChanged(_ sender: UISlider) {
        sender.value = roundValue(sender.value, increment: 5)
        percentLabel.text = String("\(Int(sender.value))%")
    }

    // Calculates the tip and total amounts when slider value is changed or bill is changed
    @IBAction func calculateTip(_ sender: AnyObject) {
        let bill = Double(billField.text!) ?? 0
        let tip = bill * Double(0.01 * roundValue(tipSlider.value, increment: 5))
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        let numPeople = peopleStepper.value
        let costPerPerson = total / numPeople
        costPerPersonLabel.text = String(format: "$%.2f", costPerPerson)
    }
    
    @IBAction func onStepperChanged(_ sender: UIStepper) {
        peopleLabel.text = String(Int(sender.value))
    }
    
    // Rounds a given value to a given increment
    func roundValue(_ value: Float, increment: Float) -> Float {
        return round(value / increment) * increment
    }
}

