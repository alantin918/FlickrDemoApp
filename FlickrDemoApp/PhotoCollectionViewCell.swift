//
//  PhotoCollectionViewCell.swift
//  FlickrDemoApp
//
//  Created by weilun on 2019/8/13.
//  Copyright © 2019 weilun. All rights reserved.
//

import UIKit

//private let reuseIdentifier = "Cell"

class PhotoCollectionViewCell: UICollectionViewCell {

        @IBOutlet weak var photoImageView: UIImageView!
        @IBOutlet weak var titleLabel: UILabel!
        var imageURL: URL!    
}
