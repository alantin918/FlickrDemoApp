
import UIKit

private let reuseIdentifier = "myCell"

class myFavoriteCollectionViewController: UICollectionViewController {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        Manager.shared.getphotoNameArray()
    }
    
    var myphotos = [String]()
    var itemcount = [String]()
    var imageName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let layout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        let width = (view.bounds.width - 10) / 2
        layout?.itemSize = CGSize(width: width, height: width + 80)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return Manager.photoNameArray.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PhotoCollectionViewCell
        
        cell.photoImageView.image = Manager.shared.getPhoto(imageName: Manager.photoNameArray[indexPath.row] ?? "")
        
        cell.titleLabel.text = Manager.photoNameArray[indexPath.row]
        
        return cell
    }

   
}
