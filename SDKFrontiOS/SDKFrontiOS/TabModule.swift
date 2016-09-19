//
//  TabModule.swift
//  SDKFrontiOS
//
//  Created by Sergio Girao on 16/9/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import UIKit

class TabModule: Module, UIScrollViewDelegate {

    @IBOutlet weak var tabBtnContainer: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollViewContainer: UIView!
    @IBOutlet weak var scrollViewHeight: NSLayoutConstraint!
    
    private var tabTargets : [Target]!;
    private var sections = [Section]();
    private var scrollViewConstraints = [[String:NSLayoutConstraint]]();
    
    private var actualPage:Int {
        get{
            return Int(floor((self.scrollView.contentOffset.x * 2.0 + self.scrollView.frame.size.width) / (self.scrollView.frame.size.width * 2.0)));
        }
    }
    
    //MARK: INIT
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    override func setCardData(_configModule: ConfigModule, _cardData: CardData) {
        super.setCardData(_configModule, _cardData: _cardData);
        
        self.scrollView.delegate = self;
        
        if (self.configModule.targets != nil && !self.configModule.targets!.isEmpty) {
            
            self.tabTargets = self.configModule.targets!;
            
            if (self.sections.isEmpty) {
                
                self.setTabButtons();
                
                var keys = [String]();
                for target in self.tabTargets {
                    if (target.sectionId != nil) {
                        keys.append(target.sectionId!);
                    }
                }
                
                self.sections = self.cardDelegate!.createSections(keys);
                self.scrollView.contentSize = CGSizeMake((self.frame.width * CGFloat(self.sections.count)), self.scrollView.frame.height);
                
                for idx in 0..<self.sections.count {
                    
                    self.scrollViewConstraints.append([String:NSLayoutConstraint]());
                    
                    self.scrollViewConstraints[idx]["top"] = NSLayoutConstraint(item: self.sections[idx].view, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.scrollViewContainer, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 0);
                    
                    self.scrollViewConstraints[idx]["bottom"] = NSLayoutConstraint(item: self.sections[idx].view, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self.scrollViewContainer, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0);
                    
                    self.scrollViewConstraints[idx]["width"] = NSLayoutConstraint(item: self.sections[idx].view, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: self.frame.width);
                    
                    self.scrollViewConstraints[idx]["left"] = NSLayoutConstraint(item: self.sections[idx].view, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: self.scrollView, attribute: NSLayoutAttribute.Left, multiplier: 1, constant: self.frame.width * CGFloat(idx));
                    
                    self.sections[idx].view.translatesAutoresizingMaskIntoConstraints = false;
                    
                    self.scrollView.addSubview(self.sections[idx].view);
                    self.scrollViewContainer.addConstraints([self.scrollViewConstraints[idx]["top"]!, self.scrollViewConstraints[idx]["bottom"]!, self.scrollViewConstraints[idx]["width"]!, self.scrollViewConstraints[idx]["left"]!]);
                    
                    self.sections[idx].tableView!.scrollEnabled = false;
                }
            }
            
            self.refreshScrollViewConstraints();
            self.refreshHeight();
        }
    }
    
    //MARK: Private methods
    
    private func refreshHeight () {
        
        self.sections[self.actualPage].tableView!.layoutIfNeeded();
        if (self.scrollViewHeight.constant != self.sections[self.actualPage].tableView.contentSize.height) {
            self.scrollViewHeight.constant = self.sections[self.actualPage].tableView.contentSize.height;
            self.sectionDelegate?.reloadTable();
        }
    }
    
    private func refreshScrollViewConstraints () {
        
        for idx in 0..<self.sections.count {
            
            self.scrollViewConstraints[idx]["top"]!.constant = 0;
            
            self.scrollViewConstraints[idx]["bottom"]!.constant = 0;
            
            self.scrollViewConstraints[idx]["width"]!.constant = self.frame.width;
            
            self.scrollViewConstraints[idx]["left"]!.constant = self.frame.width * CGFloat(idx);
            
        }
        
        self.scrollView.contentSize = CGSizeMake((self.frame.width * CGFloat(self.sections.count)), self.scrollView.frame.height);
    }
    
    private func setTabButtons () {
        
        var buttons = [UIButton]();
        
        for idx in 0..<self.tabTargets.count {
            
            let button = UIButton();
            button.setTitle(self.tabTargets[idx].text, forState: .Normal);
            button.tag = idx;
            button.addTarget(self, action: #selector(TabModule.goToPage(_:)), forControlEvents: .TouchUpInside);
            button.translatesAutoresizingMaskIntoConstraints = false;
            buttons.append(button);

            self.tabBtnContainer.addSubview(button);
            
            
            var left = NSLayoutConstraint();
            
            if (idx == 0) {
                
                left = NSLayoutConstraint(item: button, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: self.tabBtnContainer, attribute: NSLayoutAttribute.Left, multiplier: 1, constant: 0);
            } else {
                
                left = NSLayoutConstraint(item: button, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: buttons[idx - 1], attribute: NSLayoutAttribute.Right, multiplier: 1, constant: 0);
                
                let width = NSLayoutConstraint(item: button, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: buttons.first!, attribute: NSLayoutAttribute.Width, multiplier: 1, constant: 0);
                self.tabBtnContainer.addConstraint(width);
            }
            
            let top = NSLayoutConstraint(item: button, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.tabBtnContainer, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 0);
            
            let bottom = NSLayoutConstraint(item: button, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self.tabBtnContainer, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0);
            
            
            
            if (idx == self.tabTargets.count - 1) {
                
                let right = NSLayoutConstraint(item: button, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: self.tabBtnContainer, attribute: NSLayoutAttribute.Right, multiplier: 1, constant: 0);
                self.tabBtnContainer.addConstraint(right);
            }
            
            self.tabBtnContainer.addConstraints([left, top, bottom]);
            
        }
        
    }
    
    //MARK: ScrollView delegate
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        self.refreshHeight();
        self.refreshScrollViewConstraints();
    }
    
    //MARK: Tabs Navigation
    
    func goToPage (sender : UIButton) {
        self.scrollView.setContentOffset(CGPoint(x: CGFloat(sender.tag) * self.frame.width, y: 0), animated: true)
    }
    
}
