//
//  URLFetch.swift
//  ClientApp
//
//

import Foundation
import FirebaseStorage


//I have added this class if you want to fetch url, but fetching does not always seems to Work so you can rather add a link to your database which is videoURL It has already been integrated.

class URLFetch {
    static var videoURL: URL?

    static func getVideoURL(completion: @escaping () -> Void) {
        let storageRef = Storage.storage().reference(withPath: "path/to/video")
        
        // Generate the download URL
        storageRef.downloadURL { url, error in
            guard let downloadURL = url else {
                print("Error getting download URL: \(error?.localizedDescription ?? "unknown error")")
                completion()
                return
            }
            
            // Assign the download URL to the local variable
            self.videoURL = downloadURL
            
            DispatchQueue.main.async {
                completion()
            }
        }
    }

}
