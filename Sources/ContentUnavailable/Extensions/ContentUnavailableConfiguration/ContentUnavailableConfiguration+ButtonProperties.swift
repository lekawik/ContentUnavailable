//
//  ContentUnavailableConfiguration+ButtonProperties.swift
//
//
//  Created by Soren SAMAMA on 20/02/2024.
//

import UIKit

extension ContentUnavailableConfiguration {
    public struct ButtonProperties: Hashable {
        public var primaryAction: UIAction? = nil
        public var menu: UIMenu? = nil
        public var isEnabled: Bool = true
        public var role: UIButton.Role = .normal
    }
}
