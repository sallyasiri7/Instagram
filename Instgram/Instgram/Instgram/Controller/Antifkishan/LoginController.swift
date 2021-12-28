//
//  LoginController.swift
//  Instgram
//
//  Created by sally asiri on 03/05/1443 AH.
//

import UIKit

protocol AuthenticationDelegate: class {
    func authenticationDidComplete()
}


class LoginController: UIViewController {
    
    
    //MARK: - Properties
    
    private var viewModel = LoginViewMpdel()
    weak var delegate: AuthenticationDelegate?
    
    private let iconImage : UIImageView = {
        let iv = UIImageView (image: UIImage(named: "Instagram_logo_white"))
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    private let emailTextField: CustomTextField = {
        let tf = CustomTextField(placeholder: (NSLocalizedString("Email", comment: "Email")))
        tf.keyboardType = .emailAddress
        return tf
    }()
    
    private let passwordTextField: UITextField = {
        let tf = CustomTextField(placeholder: (NSLocalizedString("password", comment: "password")))
        
        tf.isSecureTextEntry = true
        return tf
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(NSLocalizedString("Log in", comment: "Log in"), for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemPurple.withAlphaComponent(0.5)
        button.layer.cornerRadius = 5
        button.setHeight(height: 50)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.isEnabled = false
        button.addTarget(self, action: #selector(handeLogin), for: .touchUpInside)
        return button
    }()
    
    
    private let forgotPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.attributedTitle(firstPart:  (NSLocalizedString("Forgot your password?", comment: "Forgot your password?")), secondPart: (NSLocalizedString( "Get help signing in.", comment:  "Get help signing in.")))
        button.addTarget(self, action: #selector(handleShowResetPassword), for: .touchUpInside)
        return button
    }()
    
    
    private let dontHaveAccuntButton: UIButton = {
        let button = UIButton(type: .system)
        button.attributedTitle(firstPart: (NSLocalizedString("Don`t have an account?", comment: "Don`t have an account?")), secondPart: (NSLocalizedString("Sign Up", comment: "Sign Up")) )
        button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
        return button
    }()
    
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureNotificationObservers()
        
    }
    
    //MARK: - Actions
    
    @objc func handeLogin() {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        AuthService.logUserIn(withEmail: email, password: password) { (result, error) in
            
            if let error = error {
                print("DEBUG: Failed to log user in \(error.localizedDescription)")
                return
            }
            self.delegate?.authenticationDidComplete()
            
        }
        
    }
    
    @objc func handleShowSignUp() {
        let controller = RegistrationController()
        controller.delegate = delegate
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func textDidChange(sender: UITextField) {
        if sender == emailTextField {
            viewModel.email = sender.text
        }else {
            viewModel.password = sender.text
        }
        updateForm()
    }
    
    @objc func handleShowResetPassword() {
        let controller = ResetPasswordController()
        controller.delegate = self
        controller.email = emailTextField.text
        navigationController?.pushViewController(controller, animated: true)
    }
    
    //MARK: - Helpers
    
    //اللوقو حق الانستقرام
    
    func configureUI() {
        configureGradientLayer()
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
        
        view.addSubview(iconImage)
        iconImage.centerX(inView: view)
        iconImage.setDimensions(height: 80, width: 120)
        iconImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        
        let stack = UIStackView(arrangedSubviews: [emailTextField, passwordTextField,
                                                   loginButton, forgotPasswordButton])
        stack.axis = .vertical
        stack.spacing = 20
        view.addSubview(stack)
        stack.anchor(top: iconImage.bottomAnchor, left: view.leftAnchor,
                     right: view.rightAnchor, paddingTop: 32, pddingLeft: 32, paddingRight: 32)
        
        view.addSubview(dontHaveAccuntButton)
        dontHaveAccuntButton.centerX(inView: view)
        dontHaveAccuntButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor)
    }
    
    func configureNotificationObservers() {
        emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
    
    
}

//MARK: - FormViewModel
extension LoginController: FormViewModel {
    func updateForm() {
        // الشفافيه
        //        loginButton.backgroundColor = viewModel.buttonBackgroundColor
        //        loginButton.setTitleColor(viewModel.buttonBackgroundColor, for: .normal)
        loginButton.isEnabled = viewModel.formIsValid
        
    }
}

//MARK: - ResetPasswordControllerDelegate

extension LoginController: ResetPasswordControllerDelegate {
    func controllerDidSendResetPasswordLink(_ controller: ResetPasswordController) {
        navigationController?.popViewController(animated: true)
        showMessage(withTitle: (NSLocalizedString("Success", comment: "Success")),
                    message: (NSLocalizedString("We sent a link to your email to reset your password", comment: "We sent a link to your email to reset your password")))
    }
}
