//
//  UploadPostController.swift
//  Instgram
//
//  Created by sally asiri on 07/05/1443 AH.
//

import UIKit

class UploadPostController: UIViewController {
    
    
    // MARK: - Properties
    
    private let photoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.image = UIImage(named: "venom-7")
        return iv
    }()
    
    private lazy var captionTextView: InputTextView = {
        let tv = InputTextView()
        tv.placeholderText = "Enter caption.."
        tv.font = UIFont.systemFont(ofSize: 16)
        tv.delegate = self
        return tv
    }()
    
    private let characterCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "0/100"
        return label
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Actions
    
    @objc func didTapCancel() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func didTapDone() {
     print("DEBUG: Share post here..")
    }
    
    
    // MARK: - Helpers
    
    func checMaxLength(_ textView: UITextView) {
        if (textView.text.count) > 100 {
            textView.deleteBackward()
        }
    }
    
    func configureUI() {
        view.backgroundColor = .white
        navigationItem.title = "Upload post"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel,
                                                           target: self,
                                                           action: #selector(didTapCancel))
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Share", style: .done,                                         target: self, action: #selector(didTapDone))
        
        
        view.addSubview(photoImageView)
        photoImageView.setDimensions(height: 180, width: 180)
        photoImageView.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 8)
        photoImageView.centerX(inView: view)
        photoImageView.layer.cornerRadius = 10
        

        view.addSubview(captionTextView)
        captionTextView.anchor(top: photoImageView.bottomAnchor, left: view.leftAnchor,
                               right: view.rightAnchor, paddingTop: 16, pddingLeft: 12,
                               paddingRight: 12, height: 64)
        
        
        view.addSubview(characterCountLabel)
        characterCountLabel.anchor(bottom: captionTextView.bottomAnchor, right: view.rightAnchor,             paddingBottom: -8, paddingRight: 12)
    }
}

// MARK: - UITextFildDelegat

extension UploadPostController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        checMaxLength(textView)
        let count = textView.text.count
        characterCountLabel.text = "\(count)/100"
        
    }
    
}
