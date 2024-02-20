//
//  ContentUnavailableConfiguration+TextProperties.swift
//  
//
//  Created by Soren SAMAMA on 20/02/2024.
//

import UIKit

extension ContentUnavailableConfiguration {
    public struct TextProperties : Hashable {
        public var font: UIFont
        public var color: UIColor
        public var lineBreakMode: NSLineBreakMode
        public var numberOfLines: Int
        public var adjustsFontSizeToFitWidth: Bool
        public var minimumScaleFactor: CGFloat
        public var allowsDefaultTighteningForTruncation: Bool
        
        internal static func textDefault() -> Self {
            return TextProperties(
                font: .preferredFont(forTextStyle: .title2).weight(.bold),
                color: .label,
                lineBreakMode: .byWordWrapping,
                numberOfLines: 0,
                adjustsFontSizeToFitWidth: false,
                minimumScaleFactor: 0,
                allowsDefaultTighteningForTruncation: false
            )
        }
        
        internal static func secondaryTextDefault() -> Self {
            return TextProperties(
                font: .preferredFont(forTextStyle: .subheadline),
                color: .secondaryLabel,
                lineBreakMode: .byWordWrapping,
                numberOfLines: 0,
                adjustsFontSizeToFitWidth: false,
                minimumScaleFactor: 0,
                allowsDefaultTighteningForTruncation: false
            )
        }
    }
}
