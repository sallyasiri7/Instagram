//
//  FeedController.swift
//  Instgram
//
//  Created by sally asiri on 02/05/1443 AH.
//

import UIKit
import Firebase

private let reuseldentifier = "cell"

class FeedController: UICollectionViewController {
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
    
    //MARK: - Actions
    
    @objc func handleLogout() {
            do {
                try Auth.auth().signOut()
                let controller = LoginController()
                controller.delegate = self.tabBarController as? MainTabController
                  let nav = UINavigationController(rootViewController: controller)
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true, completion: nil)
            } catch {
                print("DEBUG Failed to sign out")
            }
        }
    
    //MARK: - Helpers
    
    func configureUI() {
        collectionView.backgroundColor = .white
        collectionView.register(FeedCell.self, forCellWithReuseIdentifier: reuseldentifier)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(handleLogout))
        navigationItem.title = "Feed"
                                                            
        
    }
}

//MARK: - UICollectionViewDataSource

extension FeedController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseldentifier, for: indexPath) as! FeedCell
        return cell
    }
    
}

//MARK: - UICollectionViewDelegateFlowLayout
extension FeedController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //المسافه حقت الصوره
        let width = view.frame.width
        var height = width + 8 + 40 + 8
        height += 50
        height += 60
        
        return CGSize(width: width, height:height)
    }
}
