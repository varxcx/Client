//
//  DataTableViewCell.swift
//  ClientApp
//
//  Created by Vardhan Chopada on 3/20/23.
//

import UIKit

class DataTableViewCell: UITableViewCell {

    @IBOutlet weak var des: UILabel!
    @IBOutlet weak var desImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        desImage.layer.cornerRadius = 10
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
