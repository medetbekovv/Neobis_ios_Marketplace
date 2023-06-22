//
//  BaseViewController.swift
//  Neobis_ios_Marketplace
//
//  Created by user on 23/6/23.
//

import UIKit
import SnapKit

class BaseViewController : UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        setupViews()
        setupConstraints()
        addTarget()
        textFieldDelegate()
    }
    
    func addTarget() {}
    func setupViews() {}
    func setupConstraints() {}
    func textFieldDelegate() {}
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
         textField.resignFirstResponder()
         return true
     }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
           self.view.endEditing(true)
       }
    
  
    
}
