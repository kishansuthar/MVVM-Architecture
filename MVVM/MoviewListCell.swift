//
//  MoviewListCell.swift
//  MVVM
//
//  Created by Kishan Suthar on 07/06/20.
//  Copyright © 2020 Kishan Suthar. All rights reserved.
//

import UIKit

class MoviewListCell: UITableViewCell {

    @IBOutlet weak var imgPoster: UIImageView!
    
    @IBOutlet weak var lblMovieName: UILabel!
    
    @IBOutlet weak var lblMovieDate: UILabel!
    
    @IBOutlet weak var lblMovieDetail: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
