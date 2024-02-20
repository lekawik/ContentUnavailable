//
//  UIViewController+.swift
//
//
//  Created by Soren SAMAMA on 20/02/2024.
//

import Foundation
import UIKit

extension UIViewController {
    private static var _myComputedProperty = [String: Any]()
    
    public var newContentUnavailableConfiguration: ContentUnavailableConfiguration? {
        get {
            let tmpAddress = "newContentUnavailableConfiguration"
            return UIViewController._myComputedProperty[tmpAddress] as? ContentUnavailableConfiguration
        }
        set(newValue){
            let tmpAddress = "newContentUnavailableConfiguration"
            UIViewController._myComputedProperty[tmpAddress] = newValue
            
            _udpateConfigurationState()
            _setupContentUnavailableView()
        }
    }
    
    public var newContentUnavailableConfigurationState: ContentUnavailableConfigurationState {
        get {
            let tmpAddress = "newContentUnavailableConfigurationState"
            return UIViewController._myComputedProperty[tmpAddress] as? ContentUnavailableConfigurationState ?? .init(traitCollection: .current)
        }
        set(newValue) {
            let tmpAddress = "newContentUnavailableConfigurationState"
            UIViewController._myComputedProperty[tmpAddress] = newValue
        }
    }
    
    private var _contentUnavailableView: ContentUnavailableView? {
        get {
            let tmpAddress = "_contentUnavailableView"
            return UIViewController._myComputedProperty[tmpAddress] as? ContentUnavailableView
        }
        set(newValue) {
            let tmpAddress = "_contentUnavailableView"
            UIViewController._myComputedProperty[tmpAddress] = newValue
        }
    }
    
    private func _udpateConfigurationState() {
        var searchText: String? = nil
        
        if let searchController = navigationItem.searchController {
            searchText = searchController.searchBar.text
        }
        
        newContentUnavailableConfigurationState = ContentUnavailableConfigurationState(traitCollection: traitCollection)
        newContentUnavailableConfigurationState.searchText = searchText
    }
    
    private func _setupContentUnavailableView() {
        _contentUnavailableView?.removeFromSuperview()
        
        _contentUnavailableView = newContentUnavailableConfiguration?.updated(for: newContentUnavailableConfigurationState).makeContentView() as? ContentUnavailableView
        _contentUnavailableView?.translatesAutoresizingMaskIntoConstraints = false
        
        if let _contentUnavailableView {
            view.addSubview(_contentUnavailableView)
            
            NSLayoutConstraint.activate([
                _contentUnavailableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                _contentUnavailableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                _contentUnavailableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                _contentUnavailableView.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor)
            ])
        }
    }
}
