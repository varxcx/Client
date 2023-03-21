//
//  VideoTableViewCell.swift
//  ClientApp


import UIKit
import AVKit
import AVFoundation


class VideoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleDescription: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var video: UIView!
    @IBOutlet weak var des: UILabel!
    
    var player: AVPlayer!
    var playerViewController = AVPlayerViewController()

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        video.layer.cornerRadius = 10
        video.layer.masksToBounds =  true
        
        DataFetch.fetchData {
            DispatchQueue.main.async {
                let title = DataFetch.dataModels[0].videoTitle
                self.title.text = title
                let url = DataFetch.dataModels[0].videoURL
                self.videoPlayer(view: self.video, videoURL: URL(string: url)!)
                let description = DataFetch.dataModels[0].videoDescription
                self.des.text = description
                let titleDescription = DataFetch.dataModels[0].titleDescription
                self.titleDescription.text = titleDescription
                ViewController.tbv.reloadData()
            }
        }
        
        

        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }
    
    func videoPlayer(view: UIView, videoURL: URL) {
        
        player = AVPlayer(url: videoURL)
        playerViewController.view.layer.masksToBounds = true
        playerViewController.player = player
        playerViewController.view.layer.cornerRadius = 10
        playerViewController.view.frame.size.height = view.frame.size.height
        playerViewController.view.frame.size.width = view.frame.size.width
        view.addSubview(playerViewController.view)

    
        
    }
    
}





