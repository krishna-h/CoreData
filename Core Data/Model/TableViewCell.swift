//
//  TableViewCell.swift
//  Core Data
//
//  Created by Mac on 01/08/20.
//  Copyright © 2020 Gunde Ramakrishna Goud. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var Sname: UILabel!
    @IBOutlet weak var SEmail: UILabel!
    @IBOutlet weak var SmobileNo: UILabel!
    @IBOutlet weak var Saddress: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
