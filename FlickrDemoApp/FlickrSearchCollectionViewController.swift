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
//private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
//private let itemsPerRow: CGFloat = 3

class FlickrSearchCollectionViewController: UICollectionViewController {

//    var homeDelegate: HomeDelegate?
    let apiKey = "13d06d53446547f65aa8ede22777a7f5"
    var queryString: String = ""
    var page: String = ""
    
    
    
    var photos = [Photo]()

//    func changeDisplay() {
//        if let queryString = productName, let text = explainText, let image = imageName{
//            navigationItem.title = name
//            explainLabel.text = text
//        }
//    }
    
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
        layout?.itemSize = CGSize(width: width, height: width + 80)
        fetchData()
        
//        print("text: \(queryString)")
//        print("page: \(page)")
    }
    
    
    // MARK: UICollectionViewDataSource
    
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
    
    // MARK: UICollectionViewDelegate
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
    
}

//extension FlickrSearchCollectionViewController : UICollectionViewDelegateFlowLayout {
//    //1
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        sizeForItemAt indexPath: IndexPath) -> CGSize {
//        //2
//        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
//        let availableWidth = view.frame.width - paddingSpace
//        let widthPerItem = availableWidth / itemsPerRow
//
//        return CGSize(width: widthPerItem, height: widthPerItem)
//    }
//
//    //3
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        insetForSectionAt section: Int) -> UIEdgeInsets {
//        return sectionInsets
//    }
//
//    // 4
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return sectionInsets.left
//    }
//}

//extension FlickrSearchCollectionViewController : UITextFieldDelegate {
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        // 1
//        let activityIndicator = UIActivityIndicatorView(style: .gray)
//        textField.addSubview(activityIndicator)
//        activityIndicator.frame = textField.bounds
//        activityIndicator.startAnimating()
//
//        flickr.searchFlickr(for: textField.text!) { searchResults in
//            activityIndicator.removeFromSuperview()
//
//            switch searchResults {
//            case .error(let error) :
//                print("Error Searching: \(error)")
//            case .results(let results):
//                print("Found \(results.searchResults.count) matching \(results.searchTerm)")
//                self.searches.insert(results, at: 0)
//
//                // 4
//                self.collectionView?.reloadData()
//            }
//        }
//
//        textField.text = nil
//        textField.resignFirstResponder()
//        return true
//    }
//}

extension FlickrSearchCollectionViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if let viewControllers = tabBarController.viewControllers {
            if viewController == viewControllers[0] {
                return false
            }
        }
        return true
    }
}
