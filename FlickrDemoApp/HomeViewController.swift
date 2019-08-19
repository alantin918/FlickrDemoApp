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
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var perPage: UITextField!
    @IBOutlet weak var inputBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(NSHomeDirectory())
        
        textField.delegate = self
        perPage.delegate = self
        
        textField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        perPage.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        self.tabBarController?.tabBar.isHidden = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PhotoSegue" {
            let controller = segue.destination as! FlickrSearchCollectionViewController
            
            controller.queryString = textField.text!
            controller.page = perPage.text!
        }
        
    }
    
    @IBAction func buttonPress(_ sender:Any) {
    }
    
    @objc func textFieldChanged(_ target:UITextField) {
        let text = textField.text
        let page = perPage.text
        let formFilled = text != nil && text != "" && page != nil && page != ""
        setinputBtn(enabled: formFilled)
    }
    
    func setinputBtn(enabled:Bool) {
        if enabled {

            inputBtn.backgroundColor = UIColor.blue
            inputBtn.isEnabled = true
        } else {

            inputBtn.backgroundColor = UIColor.gray
            inputBtn.isEnabled = false
        }
    }
    


}
