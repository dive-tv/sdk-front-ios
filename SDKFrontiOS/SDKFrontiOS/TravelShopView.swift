//
//  TravelShopView.swift
//  SDKFrontiOS
//
//  Created by Sergio Girao on 20/10/16.
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

fileprivate func >= <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l >= r
  default:
    return !(lhs < rhs)
  }
}


class TravelShopView: UIView {
    
    @IBOutlet weak var imageViewItem : UIImageView!;
    @IBOutlet weak var labelTitle : UILabel!;
    @IBOutlet weak var labelSubtitle : UILabel!;
    @IBOutlet weak var widthImageStar1Constraint : NSLayoutConstraint!;
    @IBOutlet weak var widthImageStar2Constraint : NSLayoutConstraint!;
    @IBOutlet weak var widthImageStar3Constraint : NSLayoutConstraint!;
    @IBOutlet weak var widthImageStar4Constraint : NSLayoutConstraint!;
    @IBOutlet weak var widthImageStar5Constraint : NSLayoutConstraint!;
    @IBOutlet weak var imageStar1 : UIImageView!;
    @IBOutlet weak var imageStar2 : UIImageView!;
    @IBOutlet weak var imageStar3 : UIImageView!;
    @IBOutlet weak var imageStar4 : UIImageView!;
    @IBOutlet weak var imageStar5 : UIImageView!;
    @IBOutlet weak var buttonBook : UIButton!;
    @IBOutlet weak var labelSince : UILabel!;
    @IBOutlet weak var labelPrice : UILabel!;
    @IBOutlet weak var imageViewLogo : UIImageView!;
    
    
    func setData(_ product : TravelProduct){
        
        // TODO: Download the image and the logo image
        self.labelTitle.text = product.title;
        //self.labelSubtitle.text = product.
        
        if(product.address != nil){
            self.labelSubtitle.text = product.address! + ", \(product.city != nil ? product.city! : "")";
        }
        else{
            self.labelSubtitle.text = "";
        }
        
        self.labelSince.text = "desde";
        self.labelPrice.text = "\(product.price)€";
        
        self.setRating(product.rating);
    }
    
    // MARK: Private Methods
    fileprivate func setRating(_ rating : Float?){
        
        self.widthImageStar1Constraint.constant = 13;
        self.widthImageStar2Constraint.constant = 13;
        self.widthImageStar3Constraint.constant = 13;
        self.widthImageStar4Constraint.constant = 13;
        self.widthImageStar5Constraint.constant = 13;
        
        self.imageStar1.image = UIImage(named: "ico_star");
        self.imageStar2.image = UIImage(named: "ico_star");
        self.imageStar3.image = UIImage(named: "ico_star");
        self.imageStar4.image = UIImage(named: "ico_star");
        self.imageStar5.image = UIImage(named: "ico_star");
        
        if(rating != nil){
            let value = String(format: "%.1f", rating!);
            let splitValue = value.components(separatedBy: ".");
            let intValue = Int(splitValue[0]);
            let decimalValue = Int(splitValue[1]);
            
            switch intValue!{
            case 0:
                self.widthImageStar2Constraint.constant = 0;
                self.widthImageStar3Constraint.constant = 0;
                self.widthImageStar4Constraint.constant = 0;
                self.widthImageStar5Constraint.constant = 0;
                if(decimalValue >= 5){
                    self.widthImageStar1Constraint.constant = 7;
                    self.imageStar1.image = UIImage(named: "ico_star_mitad");
                }
                else{
                    self.widthImageStar1Constraint.constant = 0;
                }
                
                break;
            case 1:
                self.widthImageStar3Constraint.constant = 0;
                self.widthImageStar4Constraint.constant = 0;
                self.widthImageStar5Constraint.constant = 0;
                if(decimalValue >= 5){
                    self.widthImageStar2Constraint.constant = 7;
                    self.imageStar2.image = UIImage(named: "ico_star_mitad");
                }
                else{
                    self.widthImageStar2Constraint.constant = 0;
                }
                break;
            case 2:
                self.widthImageStar4Constraint.constant = 0;
                self.widthImageStar5Constraint.constant = 0;
                if(decimalValue >= 5){
                    self.widthImageStar3Constraint.constant = 7;
                    self.imageStar3.image = UIImage(named: "ico_star_mitad");
                }
                else{
                    self.widthImageStar3Constraint.constant = 0;
                }
                break;
            case 3:
                self.widthImageStar5Constraint.constant = 0;
                if(decimalValue >= 5){
                    self.widthImageStar4Constraint.constant = 7;
                    self.imageStar4.image = UIImage(named: "ico_star_mitad");
                }
                else{
                    self.widthImageStar4Constraint.constant = 0;
                }
                break;
            case 4:
                if(decimalValue >= 5){
                    self.widthImageStar5Constraint.constant = 7;
                    self.imageStar5.image = UIImage(named: "ico_star_mitad");
                }
                else{
                    self.widthImageStar5Constraint.constant = 0;
                }
                break;
            case 5:
                break;
            default:
                break;
            }
        }
        else{
            self.widthImageStar1Constraint.constant = 0;
            self.widthImageStar2Constraint.constant = 0;
            self.widthImageStar3Constraint.constant = 0;
            self.widthImageStar4Constraint.constant = 0;
            self.widthImageStar5Constraint.constant = 0;
        }
        
        
        
        
        
    }

}
