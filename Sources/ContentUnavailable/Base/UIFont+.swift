//
//  UIFont+.swift
//
//
//  Created by Soren SAMAMA on 20/02/2024.
//

import UIKit

extension UIFont {
    internal func weight(_ weight: UIFont.Weight) -> UIFont {
        let newDescriptor = fontDescriptor.addingAttributes([.traits:
                                                                [UIFontDescriptor.TraitKey.weight: weight.rawValue]
                                                            ])
        return UIFont(descriptor: newDescriptor, size: pointSize)
    }
}
