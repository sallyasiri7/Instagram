//
//  AuthenticationViewModel.swift
//  Instgram
//
//  Created by sally asiri on 04/05/1443 AH.
//

import UIKit

protocol FormViewModel {
     
    func updateForm()
}

protocol AuthenticationViewModel {
    var formIsValid: Bool {get}
    var buttonBackgroundColor: UIColor {get}
    var buttonTitleColor: UIColor {get}
    
}

struct LoginViewMpdel: AuthenticationViewModel {
    var email: String?
    var password: String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false && password?.isEmpty == false
    }
    // الشفافيه 
    var buttonBackgroundColor: UIColor {
        return formIsValid  ? .systemBlue : .systemPurple.withAlphaComponent(0.5)
        
    }
    
    var buttonTitleColor: UIColor {
        return formIsValid ? .white : UIColor(white: 1, alpha: 1)
    }
    
}

struct RegistrationViewModel: AuthenticationViewModel {
 
    var email: String?
    var password: String?
    var fullname: String?
    var username: String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false && password?.isEmpty == false
        && fullname?.isEmpty == false && username?.isEmpty == false
    }
    
    var buttonBackgroundColor: UIColor {
        return formIsValid ? .white : UIColor(white: 1, alpha: 1)
        
    }
    
    var buttonTitleColor: UIColor {
        
        return formIsValid ? .white : UIColor(white: 1, alpha: 1)
        
    }
    
    
}
