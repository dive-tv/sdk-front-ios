//
//  SeasonsView.swift
//  SDKFrontiOS
//
//  Created by Sergio Girao on 17/10/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import UIKit

class SeasonsView: UIView {

    @IBOutlet weak var imageViewSeason : UIImageView!;
    @IBOutlet weak var viewYearAndSeason : UIView!;
    @IBOutlet weak var labelYear : UILabel!;
    @IBOutlet weak var labelSeason : UILabel!;
    
    override func awakeFromNib() {
        super.awakeFromNib();
    }
    
    func setData(season : SeasonsContainerData){
        
        self.labelYear.text = "\(season.year)";
        self.labelSeason.text = "\(season.seasonIndex)ª Temp.";
        
        if(season.image != nil){
            // TODO:need to download the image
        }
        else{
            // TODO: need to do the logic
        }
        
    }

}
