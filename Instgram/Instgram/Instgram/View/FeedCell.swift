//
//  FeedCell.swift
//  Instgram
//
//  Created by sally asiri on 03/05/1443 AH.
//

import UIKit

class FeedCell: UICollectionViewCell {
    
    // MARK: - Properties // هنا اصلح البروفايل لصوره الصغيره
    
    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        iv.image = UIImage(named:"venom-7")
        return iv
    }()
    
    //الاسم حق البروفايل
    
    private lazy var usernameButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("sally", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        button.addTarget(self, action: #selector(didTapUsername), for: .touchUpInside)
        return button
    }()
    
    // عرض الصوره
    
    private let  postImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        iv.image = UIImage(named:"venom-7")
        return iv
        
    }()
    
    private lazy var likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "like_unselected"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private lazy var commntButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "comment"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private lazy var shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "send2"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private let likesLabel: UILabel = {
        let label = UILabel()
        label.text = " 1 like"
        label.font = UIFont.boldSystemFont(ofSize: 13)
        return label
        
    }()
    
    private let captionLabel: UILabel = {
        let label = UILabel()
        label.text = "some test caption for now.."
        label.font = UIFont.systemFont(ofSize: 14)
        return label
        
    }()
    
    private let postTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "2 days age"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .lightGray
        return label
        
    }()
    
    private var stackView = UIStackView()

    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
   //هنا الصوره الدائريه الصغيره
        
        addSubview(profileImageView)
        profileImageView.anchor(top: topAnchor, left: leftAnchor,
                                paddingTop: 130, pddingLeft: 12)
        profileImageView.setDimensions(height: 40, width: 40)
        profileImageView.layer.cornerRadius = 40 / 2
        
        addSubview(usernameButton)
         usernameButton.centerY(inView: profileImageView,
                               leftAnchor: profileImageView.rightAnchor, paddingLeft: 8)
        
        addSubview(postImageView)
        postImageView.anchor(top: postImageView.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 8)
        
        postImageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true
        
        configureActionButtons()
        
        addSubview(likesLabel)
        likesLabel.anchor(top: likeButton.bottomAnchor, left: leftAnchor, paddingTop: -4, pddingLeft: 8)
        
        addSubview(captionLabel)
        captionLabel.anchor(top: likesLabel.bottomAnchor, left: leftAnchor, paddingTop: 8, pddingLeft: 8)
        
        addSubview(postTimeLabel)
        postTimeLabel.anchor(top: captionLabel.bottomAnchor, left: leftAnchor, paddingTop: 8, pddingLeft: 8)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Actions
    // الفنكشن حق يوزر نيم
    @objc func didTapUsername() {
        print("DEBUG: did tap username")
    }
    
    //MARK: - Helpers
    
    func configureActionButtons() {
       let stackView = UIStackView(arrangedSubviews: [likeButton, commntButton, shareButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        addSubview(stackView)
        stackView.anchor(top: postImageView.bottomAnchor, width: 120, height: 50)
        
    }
}
