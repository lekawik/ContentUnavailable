//
//  ContentUnavailableView+UIContentView.swift
//  
//
//  Created by Soren SAMAMA on 20/02/2024.
//

import UIKit

extension ContentUnavailableView: UIContentView {
    public var configuration: UIContentConfiguration {
        get {
            return _configuration ?? .empty()
        }
        set(newValue) {
            self._configuration = newValue as? ContentUnavailableConfiguration
        }
    }
}

