//
//  InterfaceController.swift
//  WatchOSDevDay WatchKit Extension
//
//  Created by Daniel Rocha on 21/10/16.
//  Copyright © 2016 Daniel Rocha. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var myTable: WKInterfaceTable!
    
    let myArray: [String] = ["Navigation", "Animations", "Communication", "Notifications"]
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        print("awake")
        // Configure interface objects here.
        configTable()
    }
    
    // Configurações da tabela
    func configTable() {
        
        //seta o numero de linhas
        myTable.setNumberOfRows(myArray.count, withRowType: "myTableRow")
        
        for index in 0..<myArray.count {
            if let rowController = myTable.rowController(at: index) as? MyTableRowController {
                rowController.label.setText(myArray[index])
            }
        }
        
    }
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        //Chama uma nova tela
        switch rowIndex {
        case 0:
            pushController(withName: "MyNavigation", context: ["parametro1", "parametro2"])
        case 1:
            pushController(withName: "Animations", context: nil)
            
        case 2:
            pushController(withName: "Communication", context: nil)
            
        case 3:
            pushController(withName: "Notifications", context: nil)
            
        default:
            print(":(")
            
        }
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        print("willActivate")
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
        print("didDeactivate")
    }
    
    @IBAction func okClick() {
        
        let myAction: WKAlertAction = WKAlertAction(title: "action1", style: .default, handler: {() -> Void in
                print("click")
            })
        
        self.presentAlert(withTitle: "Titulo", message: "msg", preferredStyle: .actionSheet, actions: [myAction])
    }
    

}
