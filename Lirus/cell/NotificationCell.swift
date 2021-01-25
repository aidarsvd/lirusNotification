//
//  NotificationCell.swift
//  Lirus
//
//  Created by Айдар Чакиев on 22/1/21.
//

import UIKit

class NotificationCell: UITableViewCell {

    @IBOutlet weak var typeLb: UILabel!
    @IBOutlet weak var titleLb: UILabel!
    @IBOutlet weak var iconType: UIImageView!
    @IBOutlet weak var textLb: UILabel!
    @IBOutlet weak var createdDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
