import Foundation
import UIKit

class Manager {
    
    static let shared = Manager()
    
    static var photoNameArray = [String?]()
    
    func getphotoNameArray() {
        let filePath = NSHomeDirectory() + "/Documents"
        let fm = FileManager.default
        let items = try! fm.contentsOfDirectory(atPath: filePath)
        for item in items {
            if item.hasSuffix(".jpg"){
                Manager.photoNameArray.append(item)
            }
        }
    }
    
    func getPhoto(imageName: String?) -> UIImage? {
        if let fileName = imageName {
            let homeURL = URL(fileURLWithPath: NSHomeDirectory())
            let documents = homeURL.appendingPathComponent("Documents")
            let filePath = documents.appendingPathComponent(fileName)
            
            if let imageData = try? Data(contentsOf: filePath){
                return UIImage(data: imageData)
            }
        }
        return nil
    }
    
}
