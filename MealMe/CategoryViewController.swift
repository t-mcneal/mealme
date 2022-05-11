//
//  CategoryViewController.swift
//  MealMe
//
//  Created by Kai McNeal on 3/17/22.
//

import UIKit
import CoreHaptics


class CategoryViewController: UIViewController {
    var recipes: [Recipe]?

    @IBOutlet weak var breakfastButton: UIButton!
    @IBOutlet weak var lunchButton: UIButton!
    @IBOutlet weak var dinnerButton: UIButton!
    @IBOutlet weak var dessertButton: UIButton!
    
    var selectedCategory: String?
    var categories: Set<String> = ["breakfast", "lunch", "dinner", "dessert"]
    
    var engine: CHHapticEngine!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        if supportsHaptics {
            do {
                engine = try CHHapticEngine()
            } catch let error {
                fatalError("Engine Creation Error: \(error)")
            }
            engine.resetHandler = {
                
                print("Reset Handler: Restarting the engine.")
                
                do {
                    // Try restarting the engine.
                    try self.engine.start()

                } catch {
                    fatalError("Failed to restart the engine: \(error)")
                }
            }
            
            engine.stoppedHandler = { reason in
                print("Stop Handler: The engine stopped for reason: \(reason.rawValue)")
                switch reason {
                    case .audioSessionInterrupt: print("Audio session interrupt")
                    case .applicationSuspended: print("Application suspended")
                    case .idleTimeout: print("Idle timeout")
                    case .systemError: print("System error")
                    case .notifyWhenFinished: print("Systme finished")
                    case .engineDestroyed: print("Engine destroyed")
                    case .gameControllerDisconnect: print("Controller disconnect")
                    @unknown default: print("Unknown error")
                }
            }
            
        }
    }
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        // Handles Core Haptics
        if supportsHaptics {
            let hapticDict = [
                CHHapticPattern.Key.pattern: [
                    [CHHapticPattern.Key.event: [
                        CHHapticPattern.Key.eventType: CHHapticEvent.EventType.hapticTransient,
                        CHHapticPattern.Key.time: CHHapticTimeImmediate,
                        CHHapticPattern.Key.eventDuration: 1.0]
                    ]
                ]
            ]
            do {
                let pattern = try CHHapticPattern(dictionary: hapticDict)
                let player = try engine.makePlayer(with: pattern)
                engine.notifyWhenPlayersFinished { error in
                    return .stopEngine
                }

                try engine.start()
                try player.start(atTime: 0)
            } catch let error {
                fatalError("Failed to play pattern.: \(error)")
            }
            
        }
        
        // Handles storing the button's title for segue preparation
        if let category = sender.titleLabel?.text {
            selectedCategory = category
        }
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationVC = segue.destination as? UINavigationController
        if let target = navigationVC?.viewControllers.first as? CategoryTableViewController {
            target.categoryTitle = selectedCategory
        }
    }
}
