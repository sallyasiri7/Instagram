//
//  ProfileController.swift
//  Instgram
//
//  Created by sally asiri on 02/05/1443 AH.
//

import UIKit

private let cellIdontifier = "profileCell"
private let headerIdontfier = "profileHader"


class ProfileController: UICollectionViewController {
    
    //MARK: - Properties
    
    private var user: User
    
    //MARK: - Lifecycle
    
    init(user: User) {
        self.user = user
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        checkIfUserIsFollowed()
        fetchUserStats()
        
    }
    
    //MARK: - API
    
    func checkIfUserIsFollowed() {
        UserService.checkIfUserIsFolloeed(uid: user.uid) { isFollowed in
            self.user.isFollowed = isFollowed
            self.collectionView.reloadData()
            
           
            
        }
    }
    
    func fetchUserStats() {
        UserService.fetchUserStats(uid: user.uid) { stats in
            self.user.stats = stats
            self.collectionView.reloadData()
            
            print("DEBUG: Stats \(stats)")
        }
    }
    
    //MARK: - Helpers
    
    func configureCollectionView() {
        navigationItem.title = user.username
        collectionView.backgroundColor = .white
        collectionView.register(ProfileCell.self, forCellWithReuseIdentifier: cellIdontifier)
        collectionView.register(ProfileHeader.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: headerIdontfier)
        
        
        
        
    }
}

//MARKT: - UICollectionViewDataSource

extension ProfileController {
    
    //صور الي داخل البروفايل
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdontifier, for: indexPath) as! ProfileCell
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdontfier, for: indexPath) as! ProfileHeader
        
        header.delegate = self
        
        header.viewModel = ProfileHeaderViewModel(user: user)
        
        
        return header
        
    }
    
}

//MARKT: - UICollectionViewDelegate

extension ProfileController {
    
}

//MARKT: - UICollectionViewDelegateFlowLayout

extension ProfileController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 2) / 3
        return CGSize(width: width, height: width)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 240)
    }
}

//MARK: - ProfileHeaderDelegate

extension ProfileController: ProfileHeaderDelegate {
    func header(_ profileHeader: ProfileHeader, didTapActionButtonFor user: User) {
        if user.isCurrentUser {
            print("DEBUG:  Show edit profile here..")
        } else if user.isFollowed{
            UserService.unfollowUser(uid: user.uid) { error in
                self.user.isFollowed = false
                self.collectionView.reloadData()
            }
        } else {
            UserService.follow(uid: user.uid) { error in
                self.user.isFollowed = true
                self.collectionView.reloadData()
            }
        }
        
    }
    
}




