//
//  MovieHeaderSmall.swift
//  SDKFrontiOS
//
//  Created by Carlos Bailon Perez on 17/10/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import UIKit

class MovieHeaderSmall: Module {

    
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieSubtitleBtn: UIButton!
    @IBOutlet weak var movieGenres: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected( selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
