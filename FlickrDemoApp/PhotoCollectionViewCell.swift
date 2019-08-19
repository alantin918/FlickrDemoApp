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
    
//    var myphotos: Photo!
    
    @IBAction func myfavoriteBtn(_ sender: Any) {
    
        if let image = photoImageView.image {
            //儲存照片
            //建立照片路徑，存的位置, String轉URL一定要用 fileURLWithPath
            let homeURL = URL(fileURLWithPath: NSHomeDirectory())
            let documents = homeURL.appendingPathComponent("Documents")
            guard let text = titleLabel.text else { return }
            let fileName = "\(text).jpg"
            let fileURL = documents.appendingPathComponent(fileName)
            
            if let imageData = image.jpegData(compressionQuality: 1) {
                do{

                    try imageData.write(to: fileURL, options: [.atomicWrite])
//                    self.myphotos.imageName = fileName
                    print("Success!")
                }catch{
                    print("error \(error)")
                }

                }

        }
    
    }
}
