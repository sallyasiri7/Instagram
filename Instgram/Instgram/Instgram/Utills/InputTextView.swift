//
//  InputTextView.swift
//  Instgram
//
//  Created by sally asiri on 07/05/1443 AH.
//

import UIKit

class InputTextView: UITextView {
    
    
    // MARK: Properties
    
    
    var placeholderText: String? {
        didSet { placeholderLabel.text = placeholderText}
    }
    
     private let placeholderLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        return label
        
    }()
    
    // MARK: - Lifecyle
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        
        addSubview(placeholderLabel)
        placeholderLabel.anchor(top: topAnchor, left: leftAnchor, paddingTop: 6, pddingLeft: 8)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleTextDidChange), name: UITextView.textDidChangeNotification, object: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    
    @objc func handleTextDidChange() {
        placeholderLabel.isHidden = !text.isEmpty
    }
}
