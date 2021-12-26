//
//  CustomTextField.swift
//  Instgram
//
//  Created by sally asiri on 03/05/1443 AH.
//

import UIKit

class CustomTextField: UITextField {
    
     init(placeholder: String) {
         super.init(frame: .zero)
         
         backgroundColor = UIColor(named: "Dark")
         
         let spacer = UIView()
         spacer.setDimensions(height: 50, width: 12)
         leftView = spacer
         leftViewMode = .always
        
        borderStyle = .none
        textColor = .white
        keyboardAppearance = .dark
        keyboardType = .emailAddress
        backgroundColor = UIColor(white: 1, alpha: 0.1)
        setHeight(height: 50)
        attributedPlaceholder = NSAttributedString(string: placeholder,
                                                      attributes: [.foregroundColor:UIColor(white: 1, alpha: 0.7)])
     
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
