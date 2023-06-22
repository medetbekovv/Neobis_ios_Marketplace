//
//  FlexibleHeightWidth.swift
//  Neobis_ios_Marketplace
//
//  Created by user on 23/6/23.
//

import UIKit

extension NSObject {
    func flexibleHeight(to: CGFloat) -> CGFloat {
        return UIScreen.main.bounds.height * to / 812
    }
    func flexibleWidth(to: CGFloat) -> CGFloat {
        return UIScreen.main.bounds.width * to / 375
    }
}
