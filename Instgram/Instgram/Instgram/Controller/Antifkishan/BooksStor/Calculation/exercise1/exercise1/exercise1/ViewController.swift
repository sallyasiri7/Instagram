//
//  ViewController.swift
//  exercise1
//
//  Created by sally asiri on 10/06/1443 AH.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buten(_ sender: Any) {
        
        let VC = storyboard?.instantiateViewController(withIdentifier: "SecondVC")
        
        if let ViewController = VC {
            
            navigationController?.pushViewController(ViewController, animated: true)
        }
      
    }
    

}

