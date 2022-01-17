//
//  ViewController.swift
//  Calculation
//
//  Created by sally asiri on 09/06/1443 AH.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var Tf1: UITextField!
    
    @IBOutlet weak var Tf2: UITextField!
    
    @IBOutlet weak var Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func Buton(_ sender: Any) {
        var number1 = Tf1.text!
        var number2 = Tf2.text!
        
        var total = Int(number1)! + Int(number2)!
         
        Label.text = String(total)
       
        
    }
    
}

