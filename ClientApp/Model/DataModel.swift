//
//  InfoTableViewCell.swift
//  ClientApp

import Foundation


struct DataModel: Codable {
    let videoURL, videoTitle, videoDescription, titleDescription: String
    let content: [Content]
}


struct Content: Codable {
    let imageURL, title, description, backgroundColor: String
}
