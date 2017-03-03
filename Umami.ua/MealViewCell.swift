//
//  MealViewCell.swift
//  Umami.ua
//
//  Created by October Hammer on 3/1/17.
//  Copyright © 2017 Ocotober Hammer. All rights reserved.
//

import UIKit

class MealViewCell: UITableViewCell {

	@IBOutlet weak var labelPriceWeight: UILabel!
	@IBOutlet weak var labelName: UILabel!
	@IBOutlet weak var mealImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
	@IBAction func addToBasket(_ sender: UIButton) {
	}
}
