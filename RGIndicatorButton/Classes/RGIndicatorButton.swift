//
//  RGIndicatorButton.swift
//
//  Created by realgreys on 2016. 5. 10..
//  Copyright © 2016 realgreys. All rights reserved.
//

import UIKit

public struct RGButtonOptions {
    
    public var indicatorStyle: UIActivityIndicatorViewStyle = .White
    public var cornerRadius: CGFloat = 4.0 {
        didSet {
            if cornerRadius < 0.0 {
                cornerRadius = 0.0
            } else if cornerRadius > RGButtonOptions.MaxCornerRadius {
                cornerRadius = RGButtonOptions.MaxCornerRadius
            }
        }
    }
    public var normalColor: UIColor?
    public var highlightedColor: UIColor?
    
    public static let MaxCornerRadius: CGFloat = 10.0
    
    public init() {}
}

// MARK: -

public class RGIndicatorButton: UIButton {
    
    var options: RGButtonOptions!
    
    lazy private var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(frame: .zero)
        indicator.hidesWhenStopped = true
        return indicator
    }()
    
    // MARK: - lifecycle
    
    public override convenience init(frame: CGRect) {
        self.init(frame: frame, options: RGButtonOptions())
    }
    
    public init(frame: CGRect, options: RGButtonOptions) {
        super.init(frame: frame)
        
        setupView()
        configure(options)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        if activityIndicator.isAnimating() {
            titleLabel?.frame = .zero
            activityIndicator.frame = CGRectMake((self.frame.size.width - activityIndicator.frame.size.width) / 2.0,
                (self.frame.size.height - activityIndicator.frame.size.height) / 2.0,
                activityIndicator.frame.size.width,
                activityIndicator.frame.size.height);
        }
    }
    
    // MARK: - layout
    
    private func setupView() {
        self.addSubview(activityIndicator)
    }
    
    // MARK: - public
    
    public func configure(options: RGButtonOptions) {
        self.options = options
        
        setColorIfNeeded()
    }
    
    public func showIndicator(show: Bool) {
        if show {
            userInteractionEnabled = false
            activityIndicator.activityIndicatorViewStyle = options.indicatorStyle
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
            userInteractionEnabled = true
        }
        
        self.setNeedsLayout()
    }
    
    // MARK:
    
    private func validateType() {
        guard buttonType == .Custom else {
            NSException(name: "RGIndicatorButton", reason: "Button type must be .Custom", userInfo: nil).raise()
            return
        }

    }
    
    private func setColorIfNeeded() {
        guard options.normalColor != nil || options.highlightedColor != nil else {
            return
        }
        
        let capInsets = UIEdgeInsetsMake(options.cornerRadius, options.cornerRadius, options.cornerRadius, options.cornerRadius);
        
        if let normalColor = options.normalColor {
            let normalImage = buildImageFromColor(normalColor)
            self.setBackgroundImage(normalImage.resizableImageWithCapInsets(capInsets), forState: .Normal)
        }
        
        if let highlightedColor = options.highlightedColor {
            let highlightedImage = buildImageFromColor(highlightedColor)
            self.setBackgroundImage(highlightedImage.resizableImageWithCapInsets(capInsets), forState: .Highlighted)
        }
    }
    
    private func buildImageFromColor(color: UIColor) -> UIImage {
        let size = RGButtonOptions.MaxCornerRadius * 2.0
        let fillRect = CGRectMake(0, 0, size, size);
        
        UIGraphicsBeginImageContextWithOptions(fillRect.size, false, UIScreen.mainScreen().scale);
        let context = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(context, color.CGColor);
        CGContextAddPath(context, UIBezierPath(roundedRect: fillRect, cornerRadius: options.cornerRadius).CGPath)
        CGContextClip(context);
        CGContextFillRect(context, fillRect);
        let bgImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return bgImage
    }
    
    

}
