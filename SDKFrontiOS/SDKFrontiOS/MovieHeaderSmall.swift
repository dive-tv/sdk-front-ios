//
//  MovieHeaderSmall.swift
//  SDKFrontiOS
//
//  Created by Carlos Bailon Perez on 17/10/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import UIKit

class MovieHeaderSmall: Module {

    var movieHeaderSmallView : MovieHeaderSmallView?;
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        self.movieHeaderSmallView = NSBundle.mainBundle().loadNibNamed("MovieHeaderSmallView", owner: self, options: nil)?[0] as? MovieHeaderSmallView;
        
        self.contentView.addSubview(self.movieHeaderSmallView!);
        self.movieHeaderSmallView?.translatesAutoresizingMaskIntoConstraints = false;
        
        let constraintHorizontal = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[myView]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["myView": self.movieHeaderSmallView!]);
        
        let constraintVertical = NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[myView]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["myView": self.movieHeaderSmallView!]);
        
        
        self.contentView.addConstraints(constraintHorizontal);
        self.contentView.addConstraints(constraintVertical);
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
    }
    
    
    override func setCardDetail(_configModule: ConfigModule, _cardDetail: CardDetail) {
        super.setCardDetail(_configModule, _cardDetail: _cardDetail);
        // TODO: need to put the color of the background
        self.movieHeaderSmallView?.backgroundColor = UIColor.blueColor();
        
        self.movieHeaderSmallView?.labelTitle.text = self.cardDetail.title;
        if let container = self.cardDetail.containers[ContainerContentType.Movie], catalogContainer = container.data.first as? CatalogContainerData{
            self.movieHeaderSmallView?.labelProducer.text = catalogContainer.director;
            self.setGenres(catalogContainer.genres);
            
            if(catalogContainer.backGroundImage != nil && catalogContainer.backGroundImage?.characters.count > 0){
                // TODO: need to download the image
            }
            
            self.movieHeaderSmallView?.labelTitle.text = self.movieHeaderSmallView!.labelTitle.text! + "(\(catalogContainer.year))";
            
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
        self.movieHeaderSmallView?.labelGenre.text = text;
    }
}
