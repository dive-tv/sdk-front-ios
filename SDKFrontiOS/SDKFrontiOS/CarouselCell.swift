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
    
    private var cellData : CarouselCellData!;
    private var sections = [UIView]();
    //private var carouselViews = [CarouselView]();
    
    
    deinit {
        print("cell removed");
    }
    
    
    //MARK: Cell configuration
    
    
    /**
     Sets the cell information for create the sections and the cards
     
     - parameter _cards: <#_cards description#>
     */
    func setCarouselCell (_cards : CarouselCellData) {
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
    private func cleanCellForReuse () {
        
        for view in self.containerView.subviews {
            view.removeFromSuperview();
        }
        
        self.sections.removeAll();
        
    }
    
    /**
     Create the sections with the same width for the cards views. In a cell can be up to 3 sections, depending of the cards.
     */
    private func createSectionsForCards () {
        
        for idx in 0..<self.cellData.cards.count {
            
            let sectionView = UIView();
            sectionView.backgroundColor = UIColor.clearColor();
            sectionView.translatesAutoresizingMaskIntoConstraints = false;
            self.sections.append(sectionView);
            
            self.containerView.addSubview(sectionView);
            
            
            var left = NSLayoutConstraint();
            
            if (idx == 0) {
                
                left = NSLayoutConstraint(item: sectionView, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: self.containerView, attribute: NSLayoutAttribute.Left, multiplier: 1, constant: 0);
            } else {
                
                left = NSLayoutConstraint(item: sectionView, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: self.sections[idx - 1], attribute: NSLayoutAttribute.Right, multiplier: 1, constant: 0);
                
                let width = NSLayoutConstraint(item: sectionView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: self.sections.first!, attribute: NSLayoutAttribute.Width, multiplier: 1, constant: 0);
                self.containerView.addConstraint(width);
            }
            
            let top = NSLayoutConstraint(item: sectionView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.containerView, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 0);
            
            let bottom = NSLayoutConstraint(item: sectionView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self.containerView, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0);
            
            
            if (idx == self.cellData.cards.count - 1) {
                
                let right = NSLayoutConstraint(item: sectionView, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: self.containerView, attribute: NSLayoutAttribute.Right, multiplier: 1, constant: 0);
                self.containerView.addConstraint(right);
            }
            
            self.containerView.addConstraints([left, top, bottom]);
        }
    }
    
    
    /**
     Add the card view to the sections of the cell
     */
    private func addViewToSection () {
        
        for idx in 0..<self.sections.count {
            
            let carouselView = self.getViewForType(self.cellData.cards[idx].data.type!);
            
            let top = NSLayoutConstraint(item: carouselView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.sections[idx], attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 0);
            
            let bottom = NSLayoutConstraint(item: carouselView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self.sections[idx], attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0);
            
            let left = NSLayoutConstraint(item: carouselView, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: self.sections[idx], attribute: NSLayoutAttribute.Left, multiplier: 1, constant: 0);
            
            let right = NSLayoutConstraint(item: carouselView, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: self.sections[idx], attribute: NSLayoutAttribute.Right, multiplier: 1, constant: 0);
            
            carouselView.translatesAutoresizingMaskIntoConstraints = false;
            self.sections[idx].addSubview(carouselView);
            self.sections[idx].addConstraints([top, bottom, left, right]);
            
            carouselView.setView(self.cellData.cards[idx]);
        }
    }
    
    private func getViewForType (_type : TypeOfCard) -> CarouselView! {
        
        switch _type {
            
        case TypeOfCard.CuriosityCard:
            return CarouselView.loadFromNibNamed(.Curiosity)! as! CarouselView;
            
        default:
            return CarouselView.loadFromNibNamed(.PhotoAndTitle)! as! CarouselView;
        }
        
    }
    
}
