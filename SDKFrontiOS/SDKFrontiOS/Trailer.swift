//
//  Trailer.swift
//  SDKFrontiOS
//
//  Created by Sergio Girao on 24/10/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import UIKit
import youtube_ios_player_helper

class Trailer: VideoModule {
    
    @IBOutlet weak var playerView: YTPlayerView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override class func validate(_ cardDetail : CardDetail) throws {
        guard let container = cardDetail.containers[ContainerContentType.Trailer] , container.data.count > 0 else{
            // TODO: create error
            try DataModelErrors.ThrowError(DataModelErrors.CreateCardDetailErrors.emptyData);
            return;
        }
    }
    
    
    override func setCardDetail(_ _configModule: ConfigModule, _cardDetail: CardDetail) {
        super.setCardDetail(_configModule, _cardDetail: _cardDetail);
        
        // This is not needed because if not pass the validate this will never be call
        if let container = self.cardDetail.containers[ContainerContentType.Trailer], let linkContainer = container.data.first as? LinkContainerData{
            
            // This is only for youtube
            let arrayString = linkContainer.url.components(separatedBy: "v=");
            
            
            self.labelTitleModule.text = "Trailer".uppercased();
            let playerOptions = ["playsinline":0, "autoplay":0, "controls" : 0, "showinfo": 0, "rel" : 0, "modestbranding": 1, "origin" : "http://www.touchvie.com"] as [String : Any];
            self.playerView.load(withVideoId: arrayString[1], playerVars: playerOptions);
            
            /*let session = AVAudioSession.sharedInstance();
            do {
                try session.setCategory(AVAudioSessionCategoryPlayback);
            }
            catch let error as NSError {
                print("SetCategory: \(error)");
            };
            
            do {
                try session.setActive(true);
            }
            catch let error as NSError {
                print("SetActive: \(error)");
            };*/
        }
        
        
    }
    
}
