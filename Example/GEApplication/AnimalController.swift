//
//  ViewController.swift
//  GAEventApplication
//
//  Created by harald bregu on 26/08/18.
//  Copyright © 2018 atom. All rights reserved.
//

import UIKit
import GEApplication

class AnimalController: UIViewController, AlertController {
    @IBOutlet weak var labelLog: UILabel!
    @IBOutlet var animalsButtons: [UIButton]?
    @IBOutlet weak var nextButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.labelLog.isHidden = true
        self.animalsButtons?.forEach ({ $0.layer.cornerRadius = 3 })
        self.nextButton.layer.cornerRadius = 3

        GEApplication.current.addListener(self) { (application) in
            let felinsEvents = application.fireEvents(["Lion", "Cat", "Tiger", "Leopard"], match: true)
            
            if felinsEvents {
                self.presentAlert(title: "Felins fired", message: "Lion, Cat, Tiger, Leopard")
            }
            
            DispatchQueue.main.async {
                self.animalsButtons?.forEach { (button) in
                    button.isEnabled = true
                    button.backgroundColor = hexStringToUIColor(hex: "57AC61")
                    if application.containEvent(button.currentTitle!) {
                        button.backgroundColor = button.backgroundColor?.withAlphaComponent(0.5)
                        button.isEnabled = false
                    }
                }
            }

        }
    }
    
    @IBAction func selectAnimal(_ sender: UIButton) {
        self.showAndHideLabel(sender.currentTitle!)
        let event = GAEvent()
        event.name = sender.currentTitle!
        GEApplication.current.sendEvent(event)
    }
    
}

extension AnimalController {
    
    func showAndHideLabel(_ title: String) {
        self.labelLog.text = "Item selected is \(title)"
        self.labelLog.isHidden = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.labelLog.isHidden = true
        }
    }
}

//        let wildAnimals = ["Leopard", "Tiger", "Lion", "Wolf"]
//        let animals = ["Leopard", "Tiger", "Cat"]
//
//        // Array degli elementi che councidono
//        let matching = SUIEventals).intersection(wildAnimals)
//        print("Matching: \(matching)")
//
//        // Non hanno nessun match // False se hanno almeno un match
//        let matchDisjoint = Set(animals).isDisjoint(with: Set(wildAnimals))
//        print("MatchDisjoint: \(matchDisjoint)")
//
//        // Match all elements
//        let matchAllItems = Set(animals).isSubset(of: wildAnimals)
//        print("MatchAllItems: \(matchAllItems)")
//
//        // Set A is a superset of another set B if
//        // every member of B is also a member of A.
//        let matchSomeItems = Set(animals).isSuperset(of: wildAnimals)

