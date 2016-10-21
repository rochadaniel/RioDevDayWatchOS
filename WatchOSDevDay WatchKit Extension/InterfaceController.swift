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
        default:
            print(":(")
            
        }
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
