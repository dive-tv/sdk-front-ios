//
//  MovieHeader.swift
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


class MovieHeader: Module {
    
    @IBOutlet weak var viewBackground : UIView!;
    @IBOutlet weak var labelTitle : UILabel!;
    @IBOutlet weak var labelProducer : UILabel!;
    @IBOutlet weak var labelGenre : UILabel!;
    @IBOutlet weak var labelTime : UILabel!;
    @IBOutlet weak var buttonDiveIn : UIButton!;
    @IBOutlet weak var imageViewSmall : UIImageView!;
    @IBOutlet weak var imageViewBig : UIImageView!;
    @IBOutlet weak var heightButtonDiveInConstraint : NSLayoutConstraint!;

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
        self.viewBackground.backgroundColor = UIColor.black;
        
        self.labelTitle.text = self.cardDetail.title;
        if let container = self.cardDetail.containers[ContainerContentType.Movie], let catalogContainer = container.data.first as? CatalogContainerData{
            self.labelProducer.text = catalogContainer.director;
            self.setGenres(catalogContainer.genres);
            
            if(catalogContainer.backGroundImage != nil && catalogContainer.backGroundImage?.characters.count > 0){
                // TODO: need to download the image
            }
            self.setDuration(catalogContainer.runtime);
            self.labelTitle.text = self.labelTitle.text! + "(\(catalogContainer.year))";
            if let sync = catalogContainer.sync{
                if(!sync.isSynchronizable){
                    self.heightButtonDiveInConstraint.constant = 0;
                    self.buttonDiveIn.isHidden = true;
                }
                else{
                    // TODO: put the title of the button
                }
            }
            else{
                self.heightButtonDiveInConstraint.constant = 0;
                self.buttonDiveIn.isHidden = true;
            }
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
    
    fileprivate func setDuration(_ duration : Int){
        if(duration > 59){
            let hour = duration / 60;
            let minutes = duration - (hour * 60);
            var stringMinutes = "00";
            if(minutes > 0){
                if(minutes < 10){
                    stringMinutes = "0\(minutes)";
                }
                else{
                    stringMinutes = "\(minutes)";
                }
                
            }
            self.labelTime.text = "\(hour)h \(stringMinutes)m";
            
        }
        else{
            self.labelTime.text = "\(duration) m";
        }
    }
    
}
