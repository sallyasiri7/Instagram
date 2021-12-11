//
//  ImageUploader.swift
//  Instgram
//
//  Created by sally asiri on 04/05/1443 AH.
//

//فايربيس

import FirebaseStorage
import UIKit

struct ImageUploader {
    
    static func uploadImage(image: UIImage, completion: @escaping(String) -> Void) {
        
        guard let imageData = image.jpegData(compressionQuality: 0.75) else { return }
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        
        ref.putData(imageData, metadata: nil) { metadata, error in
            if let error = error {
                print("DEBUG: Failed to upload image \(error.localizedDescription)")
                return
            }
            
            ref.downloadURL { (url, error) in
                guard let imageurl = url?.absoluteString else { return }
                completion(imageurl)
            }
        }
    }
}
