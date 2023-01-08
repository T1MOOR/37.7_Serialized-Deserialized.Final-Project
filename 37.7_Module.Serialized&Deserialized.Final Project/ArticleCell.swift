//
//  ArticleCell.swift
//  37.7_Module.Serialized&Deserialized.Final Project
//
//  Created by Тимур Гарипов on 08.01.23.
//

import UIKit

class ArticleCell: UITableViewCell {
    
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var cellLabelDescription: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
