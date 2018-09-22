//
//  VehicleController.swift
//  GAEventApplication
//
//  Created by harald bregu on 17/09/18.
//  Copyright © 2018 atom. All rights reserved.
//

import UIKit
import GEApplication

class VehicleController: UIViewController, AlertController {
    @IBOutlet weak var labelLog: UILabel!
    @IBOutlet var vehiclesButtons: [UIButton]?
    @IBOutlet weak var nextButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
      
        // LISTENER
        GEApplication.current.addListener(self) { application in
            let iTookDogAndCat = application.fireEvents(["Dog", "Cat", "Apple", "Car"], match: true)
            
            if iTookDogAndCat {
                self.presentAlert(title: "Event fired", message: "I took dogs and cats, ate an apple and climbed on the car")
            }
            
            DispatchQueue.main.async {
                self.vehiclesButtons?.forEach { (button) in
                    button.isEnabled = true
                    button.backgroundColor = hexStringToUIColor(hex: "A5002F")
                    if application.containEvent(button.currentTitle!) {
                        button.backgroundColor = button.backgroundColor?.withAlphaComponent(0.5)
                        button.isEnabled = false
                    }
                }
            }
        }

        self.labelLog.isHidden = true
        self.vehiclesButtons?.forEach ({ $0.layer.cornerRadius = 3 })
        self.nextButton.layer.cornerRadius = 3
    }
    
    @IBAction func selectVehicle(_ sender: UIButton) {
        self.showAndHideLabel(sender.currentTitle!)
        let event = GAEvent()
        event.name = sender.currentTitle!
        GEApplication.current.sendEvent(event)
    }
    
}

extension VehicleController {
    
    func showAndHideLabel(_ title: String) {
        self.labelLog.text = "Item selected is \(title)"
        self.labelLog.isHidden = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.labelLog.isHidden = true
        }
    }
}


