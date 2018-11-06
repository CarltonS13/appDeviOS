//
//  AddMajorTableViewCell.swift
//  Toy
//
//  Created by Carlton Segbefia on 11/6/18.
//  Copyright © 2018 Carlton Segbefia. All rights reserved.
//

import UIKit

class AddMajorTableViewCell: UITableViewCell {

    @IBOutlet weak var TextView: UITextView!
    
    
    @IBOutlet weak var PickerView: UIPickerView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
