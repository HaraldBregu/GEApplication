//
//  FruitController.swift
//  GAEventApplication
//
//  Created by harald bregu on 17/09/18.
//  Copyright © 2018 atom. All rights reserved.
//

import UIKit
import GEApplication

class FruitController: UIViewController, AlertController {
    @IBOutlet weak var labelLog: UILabel!
    @IBOutlet var fruitsButtons: [UIButton]?
    @IBOutlet weak var nextButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // LISTENER
        GEApplication.current.addListener(self) { application in
            let lionEatedBanana = application.fireEvents(["Lion", "Banana"], match: true)
            
            if lionEatedBanana {
                self.presentAlert(title: "Event fired", message: "Lion eated banana")
            }

            DispatchQueue.main.async {
                self.fruitsButtons?.forEach { (button) in
                    button.isEnabled = true
                    button.backgroundColor = hexStringToUIColor(hex: "CBB555")
                    if application.containEvent(button.currentTitle!) {
                        button.backgroundColor = button.backgroundColor?.withAlphaComponent(0.5)
                        button.isEnabled = false
                    }
                }
            }
        }

        self.labelLog.isHidden = true
        self.fruitsButtons?.forEach ({ $0.layer.cornerRadius = 3 })
        self.nextButton.layer.cornerRadius = 3

    }
 
    @IBAction func selectFruit(_ sender: UIButton) {
        self.showAndHideLabel(sender.currentTitle!)
        let event = GAEvent()
        event.name = sender.currentTitle!
        GEApplication.current.sendEvent(event)
    }
}

extension FruitController {
    
    func showAndHideLabel(_ title: String) {
        self.labelLog.text = "Item selected is \(title)"
        self.labelLog.isHidden = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.labelLog.isHidden = true
        }
    }
}
