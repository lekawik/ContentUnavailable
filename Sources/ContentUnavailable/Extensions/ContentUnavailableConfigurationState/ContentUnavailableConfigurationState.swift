//
//  ContentUnavailableConfigurationState.swift
//
//
//  Created by Soren SAMAMA on 20/02/2024.
//

import UIKit

public struct ContentUnavailableConfigurationState: UIConfigurationState {
    
    public var traitCollection: UITraitCollection
    public var searchText: String? = nil
    
    private var customValues: [UIConfigurationStateCustomKey: AnyHashable] = [:]
    
    public init(traitCollection: UITraitCollection) {
        self.traitCollection = traitCollection
    }
    
    public subscript(key: UIConfigurationStateCustomKey) -> AnyHashable? {
        get {
            return customValues[key]
        }
        set(newValue) {
            if let newValue {
                customValues[key] = newValue
            } else {
                customValues.removeValue(forKey: key)
            }
        }
    }
}
