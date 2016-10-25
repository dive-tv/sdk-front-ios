//
//  CarouselCell.swift
//  SDKFrontiOS
//
//  Created by Carlos Bailon Perez on 27/9/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import UIKit

class CarouselCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    
    fileprivate var cellData : CarouselCellData!;
    fileprivate var sections = [UIView]();
    //private var carouselViews = [CarouselView]();
    
    
    deinit {
        print("cell removed");
    }
    
    
    //MARK: Cell configuration
    
    
    /**
     Sets the cell information for create the sections and the cards
     
     - parameter _cards: <#_cards description#>
     */
    func setCarouselCell (_ _cards : CarouselCellData) {
        self.cellData = _cards;
        
        if (!self.sections.isEmpty) {
            self.cleanCellForReuse();
        }
        
        self.createSectionsForCards();
        self.addViewToSection();
        
    }
    
    
    
    //MARK: Private methods
    
    
    /**
     Clean the cell of subviews for the new sections and cells
     */
    fileprivate func cleanCellForReuse () {
        
        for view in self.containerView.subviews {
            view.removeFromSuperview();
        }
        
        self.sections.removeAll();
        
    }
    
    /**
     Create the sections with the same width for the cards views. In a cell can be up to 3 sections, depending of the cards.
     */
    fileprivate func createSectionsForCards () {
        
        for idx in 0..<self.cellData.cards.count {
            
            let sectionView = UIView();
            sectionView.backgroundColor = UIColor.clear;
            sectionView.translatesAutoresizingMaskIntoConstraints = false;
            self.sections.append(sectionView);
            
            self.containerView.addSubview(sectionView);
            
            
            var left = NSLayoutConstraint();
            
            if (idx == 0) {
                
                left = NSLayoutConstraint(item: sectionView, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: self.containerView, attribute: NSLayoutAttribute.left, multiplier: 1, constant: 0);
            } else {
                
                left = NSLayoutConstraint(item: sectionView, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: self.sections[idx - 1], attribute: NSLayoutAttribute.right, multiplier: 1, constant: 0);
                
                let width = NSLayoutConstraint(item: sectionView, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: self.sections.first!, attribute: NSLayoutAttribute.width, multiplier: 1, constant: 0);
                self.containerView.addConstraint(width);
            }
            
            let top = NSLayoutConstraint(item: sectionView, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: self.containerView, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 0);
            
            let bottom = NSLayoutConstraint(item: sectionView, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: self.containerView, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: 0);
            
            
            if (idx == self.cellData.cards.count - 1) {
                
                let right = NSLayoutConstraint(item: sectionView, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: self.containerView, attribute: NSLayoutAttribute.right, multiplier: 1, constant: 0);
                self.containerView.addConstraint(right);
            }
            
            self.containerView.addConstraints([left, top, bottom]);
        }
    }
    
    
    /**
     Add the card view to the sections of the cell
     */
    fileprivate func addViewToSection () {
        
        for idx in 0..<self.sections.count {
            
            let carouselView = self.getViewForType(self.cellData.cards[idx].data.type);
            
            let top = NSLayoutConstraint(item: carouselView, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: self.sections[idx], attribute: NSLayoutAttribute.top, multiplier: 1, constant: 0);
            
            let bottom = NSLayoutConstraint(item: carouselView, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: self.sections[idx], attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: 0);
            
            let left = NSLayoutConstraint(item: carouselView, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: self.sections[idx], attribute: NSLayoutAttribute.left, multiplier: 1, constant: 0);
            
            let right = NSLayoutConstraint(item: carouselView, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: self.sections[idx], attribute: NSLayoutAttribute.right, multiplier: 1, constant: 0);
            
            carouselView?.translatesAutoresizingMaskIntoConstraints = false;
            self.sections[idx].addSubview(carouselView!);
            self.sections[idx].addConstraints([top, bottom, left, right]);
            
            carouselView?.setView(self.cellData.cards[idx]);
        }
    }
    
    fileprivate func getViewForType (_ _type : TypeOfCard) -> CarouselView! {
        
        switch _type {
            
        case TypeOfCard.Trivia:
            return CarouselView.loadFromNibNamed(.Curiosity)! as! CarouselView;
            
        default:
            return CarouselView.loadFromNibNamed(.PhotoAndTitle)! as! CarouselView;
        }
        
    }
    
}
