//
//  DataFetch.swift
//  


import Foundation
import Firebase
import FirebaseDatabase


class DataFetch {
    
    static var dataModels = [DataModel]()
    
    static func fetchData(completion: @escaping () -> Void) {
        
        let ref = Database.database().reference().child("data")
        ref.observeSingleEvent(of: .value, with: { snapshot in
            guard let value = snapshot.value as? [[String: Any]] else {
                return
            }
            
            for data in value {
                guard let contentArray = data["content"] as? [[String: String]] else {
                    return
                }
                
                var content = [Content]()
                
                for item in contentArray {
                    guard let imageURL = item["imageURL"],
                          let title = item["title"],
                          let description = item["description"],
                          let backgroundColor = item["backgroundColor"] else {
                        continue
                    }
                    
                    content.append(Content(imageURL: imageURL, title: title, description: description, backgroundColor: backgroundColor))
                }
                
                guard let videoURL = data["videoURL"] as? String,
                      let videoTitle = data["videoTitle"] as? String,
                      let videoDescription = data["videoDescription"] as? String,
                      let titleDescription = data["titleDescription"] as? String else {
                    continue
                }
                
                let dataModel = DataModel(videoURL: videoURL, videoTitle: videoTitle, videoDescription: videoDescription, titleDescription: titleDescription, content: content)
                
                DataFetch.dataModels.append(dataModel)
            }
            
            // Reload your table view after the data has been fetched and appended
            
           
            completion()
        })
    }
}
