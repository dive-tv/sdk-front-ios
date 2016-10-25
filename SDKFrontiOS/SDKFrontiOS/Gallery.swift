//
//  Gallery.swift
//  SDKFrontiOS
//
//  Created by Sergio Girao on 24/10/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import UIKit

class Gallery: Module, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var viewBackground : UIView!;
    @IBOutlet weak var labelModuleTitle : UILabel!;
    @IBOutlet weak var viewAll : UIView!;
    @IBOutlet weak var labelAll : UILabel!;
    @IBOutlet weak var imageViewNext : UIImageView!;
    @IBOutlet weak var collectionView : UICollectionView!;
    @IBOutlet weak var heightCollectionViewConstraint : NSLayoutConstraint!;
    @IBOutlet weak var buttonAll : UIButton!;
    
    fileprivate var data = [ImageContainerData]();
    
    fileprivate var isFirstTime = true;

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.collectionView.register(UINib(nibName: "GalleryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "GalleryCollectionViewCell");
        //self.collectionView.backgroundColor = UIColor.clearColor();
        self.collectionView.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0);
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    override class func validate(_ cardDetail : CardDetail) throws {
        guard let container = cardDetail.containers[ContainerContentType.Gallery] , container.data.count > 0 else{
            // TODO: create error
            try DataModelErrors.ThrowError(DataModelErrors.CreateCardDetailErrors.emptyData);
            return;
        }
    }
    
    
    override func setCardDetail(_ _configModule: ConfigModule, _cardDetail: CardDetail) {
        super.setCardDetail(_configModule, _cardDetail: _cardDetail);
        
        // This is not needed because if not pass the validate this will never be call
        if let container = self.cardDetail.containers[ContainerContentType.Gallery]{
            self.data = container.data as! [ImageContainerData];
            
            // TODO: need to put the localizable string
            self.labelModuleTitle.text = "Galería".uppercased();
            if(self.data.count > 6){
                self.labelAll.text = "Ver todas";
                self.imageViewNext.isHidden = false;
                self.buttonAll.isHidden = false;
            }
            else{
                self.labelAll.text = "";
                self.imageViewNext.isHidden = true;
                self.buttonAll.isHidden = true;
            }
            
            
            self.collectionView.reloadData();
            self.layoutIfNeeded();
            self.heightCollectionViewConstraint.constant = self.collectionView.contentSize.height;
            
            // TODO: need to find a better solution
            /*if(self.isFirstTime){
                self.isFirstTime = false;
                self.sectionDelegate?.reloadTable();
            }*/
        }
    }
    
    // MARK: IBAction
    @IBAction func openGallery(){
        // TODO: need to do the logic
    }
    
    // MARK: UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    /*func collectionView(collectionView: UICollectionView, willDisplayCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
     self.heightCollectionViewConstraint.constant = collectionView.contentSize.height;
     }*/
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(self.data.count > 0) {
            return min(self.data.count, 6);
        }
        else {
            return 0;
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell : UICollectionViewCell?;
        if let galleryCell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryCollectionViewCell", for: indexPath) as? GalleryCollectionViewCell {
            
            galleryCell.updateCell(self.data[(indexPath as NSIndexPath).row].image);
            cell = galleryCell;
        }
        else {
            cell = UICollectionViewCell();
        }
        
        
        return cell!;
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0);
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0.0;
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
        return CGSize(width: 110, height: 110);
    }
}
