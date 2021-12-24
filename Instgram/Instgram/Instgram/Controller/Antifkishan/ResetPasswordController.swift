//
//  ResetPasswordController.swift
//  Instgram
//
//  Created by sally asiri on 16/05/1443 AH.
//

import UIKit

protocol ResetPasswordControllerDelegate: class {
    func controllerDidSendResetPasswordLink(_ controller: ResetPasswordController)
}

class ResetPasswordController: UIViewController {
    
    //MARK: - Properties
    
    private let emailTextField = CustomTextField(placeholder: "Email")
    private var viewModel = ResetPasswordViewModel()
    weak var delegate:ResetPasswordControllerDelegate?
    var email: String?
    
    private let iconImage : UIImageView = {
        let iv = UIImageView (image: UIImage(named: "Instagram_logo_white"))
        iv.contentMode = .scaleAspectFill
        return iv
    }()

    
    private let resetPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Reset Password", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemPurple.withAlphaComponent(0.5)
        button.layer.cornerRadius = 5
        button.setHeight(height: 50)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.isEnabled = false
        button.addTarget(self, action: #selector(handleResetPassword), for: .touchUpInside)
        return button
    }()
    
    private let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.addTarget(self, action: #selector(handleDismissal), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        configureUI()
    }
    
    //MARK: - Actions
    
    @objc func handleResetPassword() {
        guard let email = emailTextField.text else { return }
        
        showLoader(true)
        AuthService.resetPassword(withEmail: email) { error in
            if let error = error {
                self.showMessage(withTitle: "Error", message: error.localizedDescription)
                self.showLoader(false)
                return
            }
            
            self.delegate?.controllerDidSendResetPasswordLink(self)
        }
    }
    
    @objc func textDidChange(sender: UITextField) {
        if sender == emailTextField {
            viewModel.email = sender.text
        }
        updateForm()
    }
    
    @objc func handleDismissal() {
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Helpers
    
    func configureUI() {
        configureGradientLayer()

        emailTextField.text = email
        viewModel.email = email
        updateForm()
        emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        
        view.addSubview(backButton)
        backButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor,                          paddingTop: 16, pddingLeft: 16)
        
        view.addSubview(iconImage)
        iconImage.centerX(inView: view)
        iconImage.setDimensions(height: 80, width: 120)
        iconImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        
        let stack = UIStackView(arrangedSubviews: [emailTextField, resetPasswordButton])
        stack.axis = .vertical
        stack.spacing = 20
        
        view.addSubview(stack)
        stack.anchor(top: iconImage.bottomAnchor, left: view.leftAnchor,
                     right: view.rightAnchor, paddingTop: 32, pddingLeft: 32, paddingRight: 32)
    }
}

//MARK: - FormViewModel
extension ResetPasswordController: FormViewModel {
    func updateForm() {
        // الشفافيه
//        resetPasswordButton.backgroundColor = viewModel.buttonBackgroundColor
//        resetPasswordButton.setTitleColor(viewModel.buttonBackgroundColor, for: .normal)
        resetPasswordButton.isEnabled = viewModel.formIsValid

    }
}

