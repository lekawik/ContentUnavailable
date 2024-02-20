//
//  ContentUnavailableView.swift
//  
//
//  Created by Soren SAMAMA on 20/02/2024.
//

import UIKit

internal class ContentUnavailableView: UIView {
 
    internal var _configuration: ContentUnavailableConfiguration? = nil{
        didSet { updateUI(for: _configuration) }
    }
    
    private var _contentView: UIView!
    
    private var _imageView: UIImageView!
    private var _activityIndicator: UIActivityIndicatorView!
    private var _textLabel: UILabel!
    private var _secondaryTextLabel: UILabel!
    private var _button: UIButton!
    private var _secondaryButton: UIButton!
    
    private var _textLabelTopAnchor: NSLayoutConstraint?
    private var _secondaryTextLabelTopAnchor: NSLayoutConstraint?
    private var _buttonTopAnchor: NSLayoutConstraint?
    private var _secondaryButtonTopAnchor: NSLayoutConstraint?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        _setupContentView()
        _setupImageView()
        _setupActivityIndicator()
        _setupTextLabel()
        _setupSecondaryTextLabel()
        _setupButton()
        _setupSecondaryButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ContentUnavailableView {
    private func _setupContentView() {
        _contentView = UIView()
        _contentView.clipsToBounds = true
        _contentView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(_contentView)
        
        NSLayoutConstraint.activate([
            _contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            _contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            _contentView.centerXAnchor.constraint(equalTo: centerXAnchor),
            _contentView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    private func _setupImageView() {
        _imageView = UIImageView()
        _imageView.translatesAutoresizingMaskIntoConstraints = false
        
        _contentView.addSubview(_imageView)
        
        NSLayoutConstraint.activate([
            _imageView.centerXAnchor.constraint(equalTo: _contentView.centerXAnchor),
            _imageView.topAnchor.constraint(equalTo: _contentView.topAnchor)
        ])
    }
    
    private func _setupActivityIndicator() {
        _activityIndicator = UIActivityIndicatorView()
        _activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        _activityIndicator.style = .large
        
        _contentView.addSubview(_activityIndicator)
        
        NSLayoutConstraint.activate([
            _activityIndicator.topAnchor.constraint(equalTo: _imageView.bottomAnchor),
            _activityIndicator.centerXAnchor.constraint(equalTo: _contentView.centerXAnchor)
        ])
    }
    
    private func _setupTextLabel() {
        _textLabel = UILabel()
        _textLabel.translatesAutoresizingMaskIntoConstraints = false
        _textLabel.textAlignment = .center
        
        _contentView.addSubview(_textLabel)
        
        _textLabelTopAnchor = _textLabel.topAnchor.constraint(equalTo: _activityIndicator.bottomAnchor)
        _textLabelTopAnchor?.isActive = true
        
        NSLayoutConstraint.activate([
            _textLabel.centerXAnchor.constraint(equalTo: _contentView.centerXAnchor),
            _textLabel.leadingAnchor.constraint(greaterThanOrEqualTo: _contentView.leadingAnchor),
            _textLabel.trailingAnchor.constraint(lessThanOrEqualTo: _contentView.trailingAnchor)
        ])
    }
    
    private func _setupSecondaryTextLabel() {
        _secondaryTextLabel = UILabel()
        _secondaryTextLabel.translatesAutoresizingMaskIntoConstraints = false
        _secondaryTextLabel.textAlignment = .center
        
        _contentView.addSubview(_secondaryTextLabel)
        
        _secondaryTextLabelTopAnchor = _secondaryTextLabel.topAnchor.constraint(equalTo: _textLabel.bottomAnchor)
        _secondaryTextLabelTopAnchor?.isActive = true
        
        NSLayoutConstraint.activate([
            _secondaryTextLabel.centerXAnchor.constraint(equalTo: _contentView.centerXAnchor),
            _secondaryTextLabel.leadingAnchor.constraint(greaterThanOrEqualTo: _contentView.leadingAnchor),
            _secondaryTextLabel.trailingAnchor.constraint(lessThanOrEqualTo: _contentView.trailingAnchor)
        ])
    }
    
    private func _setupButton() {
        _button = UIButton()
        _button.translatesAutoresizingMaskIntoConstraints = false
        
        _contentView.addSubview(_button)
        
        _buttonTopAnchor = _button.topAnchor.constraint(equalTo: _secondaryTextLabel.bottomAnchor)
        _buttonTopAnchor?.isActive = true
        
        NSLayoutConstraint.activate([
            _button.centerXAnchor.constraint(equalTo: _contentView.centerXAnchor),
            _button.leadingAnchor.constraint(greaterThanOrEqualTo: _contentView.leadingAnchor),
            _button.trailingAnchor.constraint(lessThanOrEqualTo: _contentView.trailingAnchor)
        ])
    }
    
    private func _setupSecondaryButton() {
        _secondaryButton = UIButton()
        _secondaryButton.translatesAutoresizingMaskIntoConstraints = false
        
        _contentView.addSubview(_secondaryButton)
        
        _secondaryButtonTopAnchor = _secondaryButton.topAnchor.constraint(equalTo: _button.bottomAnchor)
        _secondaryButtonTopAnchor?.isActive = true
        
        NSLayoutConstraint.activate([
            _secondaryButton.centerXAnchor.constraint(equalTo: _contentView.centerXAnchor),
            _secondaryButton.leadingAnchor.constraint(greaterThanOrEqualTo: _contentView.leadingAnchor),
            _secondaryButton.trailingAnchor.constraint(lessThanOrEqualTo: _contentView.trailingAnchor),
            _secondaryButton.bottomAnchor.constraint(equalTo: _contentView.bottomAnchor)
        ])
    }
}

extension ContentUnavailableView {
    private func updateUI(for configuration: ContentUnavailableConfiguration?) {
        _configureImageView(image: configuration?.image, properties: configuration?.imageProperties)
        _configureActivityIndicator(isLoading: configuration?._isLoading)
        _configureText(text: configuration?.text, imageToTextPadding: configuration?.imageToTextPadding, properties: configuration?.textProperties)
        _configureSecondaryText(text: configuration?.secondaryText, textToSecondaryTextPadding: configuration?.textToSecondaryTextPadding, properties: configuration?.secondaryTextProperties)
        _configureButton(configuration?.button, textToButtonPadding: configuration?.textToButtonPadding, properties: configuration?.buttonProperties)
        _configureSecondaryButton(configuration?.secondaryButton, buttonToSecondaryButtonPadding: configuration?.textToButtonPadding, properties: configuration?.secondaryButtonProperties)
    }
    
    private func _configureImageView(image: UIImage?, properties: ContentUnavailableConfiguration.ImageProperties?) {
        _imageView.isHidden = image == nil
        
        _imageView.image = image
        
        _imageView.preferredSymbolConfiguration = properties?.preferredSymbolConfiguration
        _imageView.tintColor = properties?.tintColor
        _imageView.accessibilityIgnoresInvertColors = properties?.accessibilityIgnoresInvertColors ?? false
        
        if let maximumSize = properties?.maximumSize,
           maximumSize != .zero
        {
            _imageView.removeConstraints(_imageView.constraints)
            
            NSLayoutConstraint.activate([
                _imageView.widthAnchor.constraint(lessThanOrEqualToConstant: maximumSize.width),
                _imageView.heightAnchor.constraint(lessThanOrEqualToConstant: maximumSize.height)
            ])
        }
    }
    
    private func _configureActivityIndicator(isLoading: Bool?) {
        
        if isLoading ?? true {
            _activityIndicator.startAnimating()
        } else {
            _activityIndicator.stopAnimating()
        }
        
        let isHidden = !(isLoading ?? true)
        
        _activityIndicator.isHidden = isHidden
        
        let constraint = _activityIndicator.findConstraint(forLayoutAttribute: .height) ?? _activityIndicator.heightAnchor.constraint(equalToConstant: 0)
        constraint.isActive = isHidden
    }
    
    private func _configureText(text: String?, imageToTextPadding: CGFloat?, properties: ContentUnavailableConfiguration.TextProperties?) {
        _textLabel.isHidden = text == nil
        
        _textLabel.text = text
        
        _textLabel.font = properties?.font
        _textLabel.textColor = properties?.color
        _textLabel.lineBreakMode = properties?.lineBreakMode ?? .byWordWrapping
        _textLabel.numberOfLines = properties?.numberOfLines ?? 0
        _textLabel.adjustsFontSizeToFitWidth = properties?.adjustsFontSizeToFitWidth ?? false
        _textLabel.minimumScaleFactor = properties?.minimumScaleFactor ?? 0
        _textLabel.allowsDefaultTighteningForTruncation = properties?.allowsDefaultTighteningForTruncation ?? false
        
        _textLabelTopAnchor?.constant = imageToTextPadding ?? 0
    }
    
    private func _configureSecondaryText(text: String?, textToSecondaryTextPadding: CGFloat?, properties: ContentUnavailableConfiguration.TextProperties?) {
        _secondaryTextLabel.isHidden = text == nil
        
        _secondaryTextLabel.text = text
        
        _secondaryTextLabel.font = properties?.font
        _secondaryTextLabel.textColor = properties?.color
        _secondaryTextLabel.lineBreakMode = properties?.lineBreakMode ?? .byWordWrapping
        _secondaryTextLabel.numberOfLines = properties?.numberOfLines ?? 0
        _secondaryTextLabel.adjustsFontSizeToFitWidth = properties?.adjustsFontSizeToFitWidth ?? false
        _secondaryTextLabel.minimumScaleFactor = properties?.minimumScaleFactor ?? 0
        _secondaryTextLabel.allowsDefaultTighteningForTruncation = properties?.allowsDefaultTighteningForTruncation ?? false
        
        _secondaryTextLabelTopAnchor?.constant = textToSecondaryTextPadding ?? 0
    }
    
    private func _configureButton(_ buttonConfiguration: UIButton.Configuration?, textToButtonPadding: CGFloat?, properties: ContentUnavailableConfiguration.ButtonProperties?) {
        _button.isHidden = buttonConfiguration?.title == nil
        
        _button.configuration = buttonConfiguration
            
        if let primaryAction = properties?.primaryAction {
            _button.addAction(primaryAction, for: .touchUpInside)
        }
        
        _button.menu = properties?.menu
        _button.isEnabled = properties?.isEnabled ?? true
        _button.role = properties?.role ?? .normal
        
        _buttonTopAnchor?.constant = textToButtonPadding ?? 0
        
        let constraint = _button.findConstraint(forLayoutAttribute: .height) ?? _button.heightAnchor.constraint(equalToConstant: 0)
        constraint.isActive = buttonConfiguration?.title == nil
        
        _buttonTopAnchor?.constant = buttonConfiguration?.title == nil ? 0 : (textToButtonPadding ?? 0)
    }
    
    private func _configureSecondaryButton(_ buttonConfiguration: UIButton.Configuration?, buttonToSecondaryButtonPadding: CGFloat?, properties: ContentUnavailableConfiguration.ButtonProperties?) {
        _secondaryButton.isHidden = buttonConfiguration?.title == nil
        
        _secondaryButton.configuration = buttonConfiguration
            
        if let primaryAction = properties?.primaryAction {
            _secondaryButton.addAction(primaryAction, for: .touchUpInside)
        }
        
        _secondaryButton.menu = properties?.menu
        _secondaryButton.isEnabled = properties?.isEnabled ?? true
        _secondaryButton.role = properties?.role ?? .normal
        
        
        let constraint = _secondaryButton.findConstraint(forLayoutAttribute: .height) ?? _secondaryButton.heightAnchor.constraint(equalToConstant: 0)
        constraint.isActive = buttonConfiguration?.title == nil
        
        _secondaryButtonTopAnchor?.constant = buttonConfiguration?.title == nil ? 0 : (buttonToSecondaryButtonPadding ?? 0)
    }
}

