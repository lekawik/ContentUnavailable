//
//  UIView+.swift
//
//
//  Created by Soren SAMAMA on 20/02/2024.
//

import UIKit

extension UIView {
    internal func findConstraint(forLayoutAttribute attribute: NSLayoutConstraint.Attribute) -> NSLayoutConstraint? {
        constraints.first { $0.firstAttribute == attribute || $0.secondAttribute == attribute }
    }
}

