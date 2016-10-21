//
//  ButtonAnimController.swift
//  WatchOSDevDay
//
//  Created by Daniel Rocha on 21/10/16.
//  Copyright © 2016 Daniel Rocha. All rights reserved.
//

import WatchKit
import Foundation


class ButtonAnimController: WKInterfaceController {

    // ←, →, ↑, e ↓
    
    @IBOutlet var circle: WKInterfaceGroup!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func leftClick() {
        animate(withDuration: 0.3) { 
            self.circle.setHorizontalAlignment(.left)
        }
    }
    
    @IBAction func topClick() {
        animate(withDuration: 0.3) {
            self.circle.setVerticalAlignment(.top)
        }
    }
    
    @IBAction func rightClick() {
        animate(withDuration: 0.3) {
            self.circle.setHorizontalAlignment(.right)
        }
    }
    
    @IBAction func bottomClick() {
        animate(withDuration: 0.3) {
            self.circle.setVerticalAlignment(.bottom)
        }
        
    }
    //obs.: Ainda nao existe, oficialmente, um jeito de realizar uma função no final da animação
//    func animateWithCompletion(duration: TimeInterval, customAnimation: () -> Void, completion: (() -> Void)?) {
//        
//        animate(withDuration: duration, animations: customAnimation)
//        let completionDelay = dispatch_time(DISPATCH_TIME_NOW, Int64(duration * Double(NSEC_PER_SEC)))
//        dispatch_after(completionDelay, dispatch_get_main_queue()) {
//            completion?()
//        }
//        
//    }

}
