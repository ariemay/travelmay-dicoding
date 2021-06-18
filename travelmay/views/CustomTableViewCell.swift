//
//  CustomTableViewCell.swift
//  travelmay
//
//  Created by Arie May Wibowo on 18/06/21.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageWisata: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        imageWisata.frame.size = CGSize(width: 80, height: 60)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
