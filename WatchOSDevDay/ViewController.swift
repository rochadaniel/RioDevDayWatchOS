//
//  ViewController.swift
//  WatchOSDevDay
//
//  Created by Daniel Rocha on 21/10/16.
//  Copyright © 2016 Daniel Rocha. All rights reserved.
//

import UIKit
import WatchConnectivity
import NotificationCenter

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var myTable: UITableView!
    
    
    var myArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        myTable.dataSource = self
        myTable.delegate = self
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.teste), name: Notification.Name("myNotName"), object: nil)
    }
    
    
    func teste(notification: Notification) {
        DispatchQueue.main.async {
            //update table
            print("update table: \(notification.object)")
            self.setMessages(message: notification.object as! String)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setMessages(message: String) {
        myArray.append(message)
        myTable.reloadData()
    }


    @IBAction func enviar(_ sender: AnyObject) {
        if textField.text != nil {
            if let texto : String = textField.text {
                let message = ["resp": texto]
                setMessages(message: texto)
                WCSession.default().sendMessage(
                    message, replyHandler: { (replyMessage) -> Void in
                        print("Chegou: \(replyMessage)")
                }) { (error) -> Void in
                    print(error.localizedDescription)
                }
            } else {
                print("nao tem texto")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        
        cell.textLabel?.text = myArray[indexPath.row]
        
        
        return cell
    }
    
}

