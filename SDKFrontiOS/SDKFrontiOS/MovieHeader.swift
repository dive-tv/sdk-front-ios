//
//  MovieHeader.swift
//  SDKFrontiOS
//
//  Created by Sergio Girao on 17/10/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import UIKit

class MovieHeader: Module {

    var movieHeaderView : MovieHeaderView?;
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        self.movieHeaderView = NSBundle.mainBundle().loadNibNamed("MovieHeaderView", owner: self, options: nil)?[0] as? MovieHeaderView;
        
        self.contentView.addSubview(self.movieHeaderView!);
        self.movieHeaderView?.translatesAutoresizingMaskIntoConstraints = false;
        
        let constraintHorizontal = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[myView]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["myView": self.movieHeaderView!]);
        
        let constraintVertical = NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[myView]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["myView": self.movieHeaderView!]);
        
        
        self.contentView.addConstraints(constraintHorizontal);
        self.contentView.addConstraints(constraintVertical);
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
    }
    
    override func setCardDetail(_configModule: ConfigModule, _cardDetail: CardDetail) {
        super.setCardDetail(_configModule, _cardDetail: _cardDetail);
        // TODO: need to put the color of the background
        self.movieHeaderView?.backgroundColor = UIColor.blackColor();
        
        self.movieHeaderView?.labelTitle.text = self.cardDetail.title;
        if let container = self.cardDetail.containers[ContainerContentType.Movie], catalogContainer = container.data.first as? CatalogContainerData{
            self.movieHeaderView?.labelProducer.text = catalogContainer.director;
            self.setGenres(catalogContainer.genres);
            
            if(catalogContainer.backGroundImage != nil && catalogContainer.backGroundImage?.characters.count > 0){
                // TODO: need to download the image
            }
            self.setDuration(catalogContainer.runtime);
            self.movieHeaderView?.labelTitle.text = self.movieHeaderView!.labelTitle.text! + "(\(catalogContainer.year))";
            if let sync = catalogContainer.sync{
                if(!sync.isSynchronizable){
                    self.movieHeaderView?.heightButtonDiveInConstraint.constant = 0;
                    self.movieHeaderView?.buttonDiveIn.hidden = true;
                }
                else{
                    // TODO: put the title of the button
                }
            }
            else{
                self.movieHeaderView?.heightButtonDiveInConstraint.constant = 0;
                self.movieHeaderView?.buttonDiveIn.hidden = true;
            }
        }
    }
    
    // MARK: Private
    private func setGenres(genres : [String]){
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
        self.movieHeaderView?.labelGenre.text = text;
    }
    
    private func setDuration(duration : Int){
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
            self.movieHeaderView?.labelTime.text = "\(hour)h \(stringMinutes)m";
            
        }
        else{
            self.movieHeaderView?.labelTime.text = "\(duration) m";
        }
    }
    
    
    /*override class func validate(data: CardDetail) throws {
     
        /*guard let title = data.title where data.title != nil else{
            try DataModelErrors.ThrowError(DataModelErrors.CreateCardDetailErrors.emptyData);
            return;
        }*/
    }*/
    
}
