//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Alex Chen on 1/4/17.
//  Copyright © 2017 Alex Chen. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var peopleStepper: UIStepper!
    @IBOutlet weak var peopleLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        let tipPercentage = defaults.integer(forKey: "tipPercentage")
        let numPeople = defaults.integer(forKey: "numPeople")
        tipSlider.value = Float(tipPercentage)
        percentLabel.text = String("\(tipPercentage)%")
        peopleStepper.value = Double(numPeople)
        peopleLabel.text = String(numPeople)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        defaults.set(Int(tipSlider.value), forKey: "tipPercentage")
        defaults.set(Int(peopleStepper.value), forKey: "numPeople")
    }
    
    @IBAction func onSliderChanged(_ sender: UISlider) {
        percentLabel.text = String("\(Int(sender.value))%")
    }
    
    @IBAction func onStepperChanged(_ sender: UIStepper) {
        peopleLabel.text = String(Int(sender.value))
    }

}
