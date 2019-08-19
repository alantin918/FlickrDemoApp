//
//  ViewController.swift
//  FlickrDemoApp
//
//  Created by weilun on 2019/8/13.
//  Copyright © 2019 weilun. All rights reserved.
//

//protocol HomeDelegate: NSObjectProtocol {
//    func userDoneInput(text: String)
//}


import UIKit

private let reuseIdentifier = "Cell"

class FlickrSearchCollectionViewController: UICollectionViewController {

    let apiKey = "13d06d53446547f65aa8ede22777a7f5"
    var queryString: String = ""
    var page: String = ""
    var photos = [Photo]()
    
    func fetchData() {
        
        print("text: \(queryString)")
        print("page: \(page)")
    
            if let url = URL(string: "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=\(apiKey)&%20format=json&nojsoncallback=1&safe_search=1&per_page=\(page)&text=\(queryString)") {
                let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                    if let data = data, let searchData = try? JSONDecoder().decode(SearchData.self, from: data) {
                        self.photos = searchData.photos.photo
                        
                        DispatchQueue.main.async {
                            self.collectionView.reloadData()
                    }
                    }
                }
                
                task.resume()
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.tabBar.isHidden = false
        
        let layout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        let width = (view.bounds.width - 10) / 2
//        let width = self.view.frame.size.width - 30
        layout?.itemSize = CGSize(width: width, height: width + 80)
        fetchData()
        layout?.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout?.minimumLineSpacing = CGFloat(integerLiteral: 0)
        layout?.minimumInteritemSpacing = CGFloat(integerLiteral: 0)
        
        collectionView.reloadData()
        
        self.navigationItem.title = "搜尋結果 \(queryString)"
        
    }
    
    

    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PhotoCollectionViewCell
        
        // Configure the cell
        let photo = photos[indexPath.item]
        cell.titleLabel.text = photo.title
        cell.imageURL = photo.imageUrl
        cell.photoImageView.image = nil
        
        NetworkUtility.downloadImage(url: cell.imageURL) { (image) in
            if cell.imageURL == photo.imageUrl, let image = image  {
                DispatchQueue.main.async {
                    cell.photoImageView.image = image
                }
            }
        }
        
        return cell
    }
    
}

