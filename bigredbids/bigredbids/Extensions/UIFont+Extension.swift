//
//  UIFont+Extension.swift
//  bigredbids
//
//  Created by Daniel Xie on 11/28/23.
//

import UIKit

extension UIFont {

    var rounded: UIFont {
        guard let desc = self.fontDescriptor.withDesign(.rounded) else { return self }
        return UIFont(descriptor: desc, size: self.pointSize)
    }

}
