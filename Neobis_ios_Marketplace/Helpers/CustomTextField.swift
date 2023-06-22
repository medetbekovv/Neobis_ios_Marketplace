//
//  CustomTextField.swift
//  Neobis_ios_Marketplace
//
//  Created by user on 23/6/23.
//

import Foundation
import UIKit
import SnapKit

class CustomTextField: UITextField {
    
    var floatingLabel: UILabel = UILabel()
    var defaultPlaceholderColor: UIColor = UIColor.lightGray

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    func commonInit() {
        floatingLabel.textColor = defaultPlaceholderColor
        floatingLabel.font = UIFont.systemFont(ofSize: 16)
        addSubview(floatingLabel)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.attributedPlaceholder = nil
        if floatingLabel.superview == nil {
            addSubview(floatingLabel)
        }
        if isFirstResponder || !(text?.isEmpty ?? true) {
            floatingLabel.frame = CGRect(x: 8, y: 0, width: bounds.width, height: 16)
            floatingLabel.textColor = defaultPlaceholderColor
            floatingLabel.font = UIFont.systemFont(ofSize: 12)
        } else {
            floatingLabel.frame = CGRect(x: 8, y: 0, width: bounds.width, height: bounds.height)
            floatingLabel.textColor = defaultPlaceholderColor
            floatingLabel.font = UIFont.systemFont(ofSize: 16)

        }

    }

    override var placeholder: String? {
        didSet {
            floatingLabel.text = placeholder
        }
    }

    override var text: String? {
        didSet {
            layoutSubviews()
        }
    }

    override func becomeFirstResponder() -> Bool {
        let result = super.becomeFirstResponder()
        UIView.animate(withDuration: 0.3) {
            self.layoutSubviews()
        }
        return result
    }

    override func resignFirstResponder() -> Bool {
        let result = super.resignFirstResponder()
        UIView.animate(withDuration: 0.3) {
            self.layoutSubviews()
        }
        return result
    }
    
    func hasUpperCaseLetters() -> Bool {
            guard let text = self.text else {
                return false
            }
            let regex = try! NSRegularExpression(pattern: "[A-Z]")
            let matches = regex.matches(in: text, range: NSRange(text.startIndex..., in: text))
            return !matches.isEmpty
        }
    
    func hasNumbers() -> Bool {
           guard let text = self.text else {
               return false
           }
           let regex = try! NSRegularExpression(pattern: "[0-9]")
           let matches = regex.matches(in: text, range: NSRange(text.startIndex..., in: text))
           return !matches.isEmpty
       }
    func hasSpecialSymbols() -> Bool {
           guard let text = self.text else {
               return false
           }
           let regex = try! NSRegularExpression(pattern: "[$@$!%*?&#]")
           let matches = regex.matches(in: text, range: NSRange(text.startIndex..., in: text))
           return !matches.isEmpty
       }
    
    func isEmail() -> Bool {
          return self.text?.isEmail() ?? false
      }
      func isPassword() -> Bool {
          return self.text?.isPassword() ?? false
      }
}

let firstpart = "[A-Z0-9a-z]([A-Z0-9a-z._%+-]{0,30}[A-Z0-9a-z])?"
let serverpart = "([A-Z0-9a-z]([A-Z0-9a-z-]{0,30}[A-Z0-9a-z])?\\.){1,5}"
let emailRegex = firstpart + "@" + serverpart + "[A-Za-z]{2,8}"
let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)

let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[d$@$!%*?&#])[A-Za-z\\dd$@$!%*?&#]{8,15}"
let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)

extension String {
    func isEmail() -> Bool {
        return emailPredicate.evaluate(with: self)
    }
    func isPassword() -> Bool {
        return passwordPredicate.evaluate(with: self)
    }
}
