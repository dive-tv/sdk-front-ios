//
//  GalleryCollectionViewCell.swift
//  SDKFrontiOS
//
//  Created by Sergio Girao on 17/10/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import UIKit

class GalleryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageViewItem : UIImageView!;

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateCell(_ image : Image){
        // TODO: need to download thumb
        self.imageViewItem.backgroundColor = UIColor.blue;
    }

}
