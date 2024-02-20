//
//  ContentUnaivalableConfiguration+ImageProperties.swift
//
//
//  Created by Soren SAMAMA on 20/02/2024.
//

import UIKit

extension ContentUnavailableConfiguration {
    public struct ImageProperties: Hashable {
        public var preferredSymbolConfiguration: UIImage.SymbolConfiguration?
        public var tintColor: UIColor?
        public var cornerRadius: CGFloat
        public var maximumSize: CGSize
        public var accessibilityIgnoresInvertColors: Bool
        
        public func hash(into hasher: inout Hasher) {
            hasher.combine(preferredSymbolConfiguration)
            hasher.combine(tintColor)
            hasher.combine(cornerRadius)
            hasher.combine(maximumSize.width)
            hasher.combine(maximumSize.height)
            hasher.combine(accessibilityIgnoresInvertColors)
        }
        
        internal static func `default`() -> Self {
            
            let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 48)
            
            return ImageProperties(
                preferredSymbolConfiguration: symbolConfiguration,
                tintColor: .secondaryLabel,
                cornerRadius: .zero,
                maximumSize: .zero,
                accessibilityIgnoresInvertColors: false
            )
        }
    }
}
