//
//  HomeViewController.swift
//  FlickrDemoApp
//
//  Created by weilun on 2019/8/14.
//  Copyright © 2019 weilun. All rights reserved.
//

//protocol HomeDelegate{
//    func userDoneInput(text: String)
//}

import UIKit

class HomeViewController: UIViewController,UITextFieldDelegate{
    
//    func userDoneInput(text: String) {
//        //
//    }
    
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var perPage: UITextField!
    @IBOutlet weak var inputBtn: UIButton!
//    var homeDelegate: HomeDelegate?
//    var photos: [FlickrPhoto] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        perPage.delegate = self
        
        textField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        perPage.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
//        self.navigationItem.title = "搜尋輸入頁"
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PhotoSegue" {
            let controller = segue.destination as! FlickrSearchCollectionViewController
            
            controller
                .queryString = textField.text!
            controller.page = perPage.text!
//            print("text1: \(textField.text)")
//            print("page1: \(perPage.text)")
//            print("text2: \(controller.queryString)")
//            print("page2: \(controller.page)")
//            controller.homeDelegate = self
        }
        
//        if segue.identifier == "Send" {
//
//            let secondVC = segue.destination as! testloginViewController
//            secondVC.recevieText = inputTextfield.text!
//
//        }
    }
    
    @IBAction func buttonPress(_ sender:Any) {
        //self.performSegue(withIdentifier: "PhotoSegue", sender: nil)
//        textField.text = ""
//        perPage.text = ""
    }
    
    @objc func textFieldChanged(_ target:UITextField) {
        let text = textField.text
        let page = perPage.text
        let formFilled = text != nil && text != "" && page != nil && page != ""
        setinputBtn(enabled: formFilled)
    }
    
    func setinputBtn(enabled:Bool) {
        if enabled {
//            inputBtn.alpha = 1.0
            inputBtn.backgroundColor = UIColor.blue
            inputBtn.isEnabled = true
        } else {
//            inputBtn.alpha = 0.5
            inputBtn.backgroundColor = UIColor.gray
            inputBtn.isEnabled = false
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
