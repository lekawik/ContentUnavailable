//
//  ContentUnavailableConfiguration.swift
//
//
//  Created by Soren SAMAMA on 20/02/2024.
//

import UIKit

public struct ContentUnavailableConfiguration: Hashable {
    
    internal var _isLoading: Bool = false
    internal var _hasCustomizedText: Bool = false
    
    private var _image: UIImage?
    private var _imageProperties: ContentUnavailableConfiguration.ImageProperties = .default()
    private var _text: String? = nil
    private var _textProperties: ContentUnavailableConfiguration.TextProperties = .textDefault()
    private var _attributedText: NSAttributedString? = nil
    private var _secondaryText: String? = nil
    private var _secondaryAttributedText: NSAttributedString? = nil
    private var _secondaryTextProperties: ContentUnavailableConfiguration.TextProperties = .secondaryTextDefault()
    private var _button: UIButton.Configuration = getDefaultButtonConfiguration()
    private var _buttonProperties: ContentUnavailableConfiguration.ButtonProperties = .init()
    private var _secondaryButton: UIButton.Configuration = getDefaultButtonConfiguration()
    private var _secondaryButtonProperties: ContentUnavailableConfiguration.ButtonProperties = .init()
    private var _imageToTextPadding: CGFloat = 15
    private var _textToSecondaryTextPadding: CGFloat = 3
    private var _textToButtonPadding: CGFloat = 20
    private var _buttonToSecondaryButtonPadding: CGFloat = 15
    private var _background: UIBackgroundConfiguration = .clear()
    
    public var image: UIImage? {
        get {
            return self._image
        }
        set {
            self._image = newValue
        }
    }
    public var imageProperties: ContentUnavailableConfiguration.ImageProperties {
        get {
            return self._imageProperties
        }
        set {
            self._imageProperties = newValue
        }
    }
    public var text: String? {
        get {
            return self._text
        }
        set {
            self._hasCustomizedText = true
            self._text = newValue
        }
    }
    public var textProperties: ContentUnavailableConfiguration.TextProperties {
        get {
            return self._textProperties
        }
        set {
            self._textProperties = newValue
        }
    }
    public var attributedText: NSAttributedString? {
        get {
            return self._attributedText
        }
        set {
            self._attributedText = newValue
        }
    }
    public var secondaryText: String? {
        get {
            return self._secondaryText
        }
        set {
            self._secondaryText = newValue
        }
    }
    public var secondaryTextProperties: ContentUnavailableConfiguration.TextProperties {
        get {
            return self._secondaryTextProperties
        }
        set {
            self._secondaryTextProperties = newValue
        }
    }
    public var secondaryAttributedText: NSAttributedString? {
        get {
            return self._secondaryAttributedText
        }
        set {
            self._secondaryAttributedText = newValue
        }
    }
    public var button: UIButton.Configuration {
        get {
            return self._button
        }
        set {
            self._button = newValue
        }
    }
    public var buttonProperties: ContentUnavailableConfiguration.ButtonProperties {
        get {
            return self._buttonProperties
        }
        set {
            self._buttonProperties = newValue
        }
    }
    public var secondaryButton: UIButton.Configuration {
        get {
            return self._secondaryButton
        }
        set {
            self._secondaryButton = newValue
        }
    }
    public var secondaryButtonProperties: ContentUnavailableConfiguration.ButtonProperties {
        get {
            return self._secondaryButtonProperties
        }
        set {
            self._secondaryButtonProperties = newValue
        }
    }
    public var imageToTextPadding: CGFloat {
        get {
            return self._imageToTextPadding
        }
        set {
            self._imageToTextPadding = newValue
        }
    }
    public var textToSecondaryTextPadding: CGFloat {
        get {
            return self._textToSecondaryTextPadding
        }
        set {
            self._textToSecondaryTextPadding = newValue
        }
    }
    public var textToButtonPadding: CGFloat {
        get {
            return self._textToButtonPadding
        }
        set {
            self._textToButtonPadding = newValue
        }
    }
    public var buttonToSecondaryButtonPadding: CGFloat {
        get {
            return self._buttonToSecondaryButtonPadding
        }
        set {
            self._buttonToSecondaryButtonPadding = newValue
        }
    }
    public var background: UIBackgroundConfiguration {
        get {
            return self._background
        }
        set {
            self._background = newValue
        }
    }
    
    internal init(image: UIImage? = nil, imageProperties: ContentUnavailableConfiguration.ImageProperties = .default()) {
        self._image = image
        self._imageProperties = imageProperties
    }
    
    private static func getDefaultButtonConfiguration() -> UIButton.Configuration {
        var backgroundConfiguration = UIBackgroundConfiguration.clear()
        backgroundConfiguration.cornerRadius = 14
        
        var configuration = UIButton.Configuration.plain()
        configuration.buttonSize = .small
        configuration.cornerStyle = .dynamic
        configuration.imagePlacement = .leading
        configuration.imagePadding = 0
        configuration.titlePadding = 1
        configuration.titleAlignment = .center
        configuration.automaticallyUpdateForSelection = true
        configuration.background = backgroundConfiguration
        
        return configuration
    }
}

extension ContentUnavailableConfiguration {
    public static func empty() -> Self {
        ContentUnavailableConfiguration()
    }
    
    public static func loading() -> Self {
        var configuration = ContentUnavailableConfiguration()
        
        configuration._isLoading = true
        configuration._text = "Loading..."
        configuration._textProperties = .secondaryTextDefault()
        configuration._imageToTextPadding = 8
        
        return configuration
    }

    public static func search() -> Self {
        var configuration = ContentUnavailableConfiguration()
        
        configuration._image = UIImage(systemName: "magnifyingglass")
        configuration._text = "No Results"
        configuration._secondaryText = "Check the spelling or try a new search."
        
        return configuration
    }
}

extension ContentUnavailableConfiguration: UIContentConfiguration {
    public func makeContentView() -> UIView & UIContentView {
        let view = ContentUnavailableView()
        view.configuration = self
        
        return view
    }
    
    public func updated(for state: UIConfigurationState) -> ContentUnavailableConfiguration {
        var configuration = self
        
        if let state = state as? ContentUnavailableConfigurationState,
           let searchText = state.searchText,
           !_isLoading,
           !_hasCustomizedText
        {
            configuration._text = "No Results for \"\(searchText)\""
        }
        
        return configuration
    }
}
