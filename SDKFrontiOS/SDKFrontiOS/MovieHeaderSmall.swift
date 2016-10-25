//
//  MovieHeaderSmall.swift
//  SDKFrontiOS
//
//  Created by Sergio Girao on 24/10/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import UIKit
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}


class MovieHeaderSmall: Module {

    @IBOutlet weak var viewBackground : UIView!;
    @IBOutlet weak var imageViewItem : UIImageView!;
    @IBOutlet weak var labelTitle : UILabel!;
    @IBOutlet weak var labelProducer : UILabel!;
    @IBOutlet weak var labelGenre : UILabel!;
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    override func setCardDetail(_ _configModule: ConfigModule, _cardDetail: CardDetail) {
        super.setCardDetail(_configModule, _cardDetail: _cardDetail);
        // TODO: need to put the color of the background
        self.viewBackground.backgroundColor = UIColor.blue;
        
        self.labelTitle.text = self.cardDetail.title;
        if let container = self.cardDetail.containers[ContainerContentType.Movie], let catalogContainer = container.data.first as? CatalogContainerData{
            self.labelProducer.text = catalogContainer.director;
            self.setGenres(catalogContainer.genres);
            
            if(catalogContainer.backGroundImage != nil && catalogContainer.backGroundImage?.characters.count > 0){
                // TODO: need to download the image
            }
            
            self.labelTitle.text = self.labelTitle.text! + "(\(catalogContainer.year))";
            
        }
        
        
    }
    
    // MARK: Private
    fileprivate func setGenres(_ genres : [String]){
        var text = "";
        var i = 0;
        for genre in genres{
            // TODO: Put the localizable strings
            //let string = "CATALOG_MOVIE_FILTER_GENRE_\(genre.uppercaseString)";
            let string = genre;
            if(i == genres.count - 1){
                //text = text + NSLocalizedString(string, comment: "");
                text = text + string;
            }
            else{
                //text = text + NSLocalizedString(string, comment: "") + " · ";
                text = text + string + ", ";
            }
            i += 1;
            
        }
        self.labelGenre.text = text;
    }
}
