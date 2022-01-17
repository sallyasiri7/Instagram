//
//  ScondVC.swift
//  exercise1
//
//  Created by sally asiri on 10/06/1443 AH.
//

import UIKit

class ScondVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func buton2(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func nextButon(_ sender: Any) {
        
        let VC = storyboard?.instantiateViewController(withIdentifier: "therdVC")
        if let ViewController = VC {
            present(ViewController, animated: true, completion: nil)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
