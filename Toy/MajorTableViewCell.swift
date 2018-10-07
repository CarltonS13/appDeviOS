//
//  MajorTableViewCell.swift
//  Toy
//
//  Created by Carlton Segbefia on 10/6/18.
//  Copyright © 2018 Carlton Segbefia. All rights reserved.
//

import UIKit

class MajorTableViewCell: UITableViewCell {

    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var ImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
