//
//  FLAlertView.swift
//  FLAlertView
//
//  Created by Denis Andreev on 01.02.2021.
//

import UIKit

public class FLAlertView: UIView {
    
    public var title: String?
    public var subTitle: String?
    public var alertImage: UIImage?
    public var autoHideSeconds = 0
    public var colorScheme: UIColor?
    public var titleColor: UIColor = .black
    public var subTitleColor: UIColor = .black
    public var dismissOnOutsideTouch = false
    
    private var alertView: UIView?
    private var alertViewContainer: UIView?
    private var buttons = [UIButton]()
    
    // AlertView Background : Probably take frame out & make it constant
    let alertContainerBackgroundView: UIView = {
        let alertContainerBackgroundView = UIView()
        alertContainerBackgroundView.backgroundColor = UIColor(white: 0, alpha: 0.35)
        return alertContainerBackgroundView
    }()
    
    let circleLayer: CAShapeLayer = {
        let circle = CAShapeLayer()
        circle.fillColor = UIColor.white.cgColor
        return circle
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    // MARK: Default Init
    public convenience init() {
        let result = UIScreen.main.bounds.size
        let frame = CGRect(x: 0, y: 0, width: result.width, height: result.height)
        self.init(frame: frame)
    }
    
    public convenience init(type: FLAlertType) {
        self.init()
        
        switch type {
        case .caution:
            makeCautionUI()
        case .warning:
            makeWarningUI()
        case .success:
            makeSuccessUI()
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Touch Events
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let touchPoint = touch.location(in: alertContainerBackgroundView)
            let touchPoint2 = touch.location(in: alertViewContainer)
            
            let isPointInsideBackview = alertContainerBackgroundView.point(inside: touchPoint, with: nil)
            let isPointInsideAlertView = alertContainerBackgroundView.point(inside: touchPoint2, with: nil)
            
            if dismissOnOutsideTouch && isPointInsideBackview && !isPointInsideAlertView {
                dismissAlertView()
            }
        }
    }
    
    // MARK: Draw
    public override func draw(_ rect: CGRect) {
        alpha = 0
        let alertViewFrame = setupAlertViewFrame()
        alertViewContainer = UIView(frame: alertViewFrame)
        alertViewContainer!.backgroundColor = .clear
        addSubview(alertViewContainer!)
        
        alertView = UIView(frame: CGRect(x: 0, y: 0, width: alertViewFrame.size.width, height: alertViewFrame.size.height))
        
        //  Setting Background Color of AlertView
        if alertImage != nil {
            alertView!.backgroundColor = .clear
        } else {
            alertView!.backgroundColor = .white
        }
        alertViewContainer!.addSubview(alertView!)
        
        // CREATING ALERTVIEW
        // CUSTOM SHAPING - Displaying Cut out circle for Vector Type Alerts
        if alertImage != nil {
            renderCircleCutout(withAlertViewFrame: alertViewFrame)
        }
        
        //  HEADER VIEW - With Title & Subtitle
        renderHeader(withAlertViewFrame: alertViewFrame)
        
        //  Button(s) View - Section containing all Buttons
        
        // View only contains DONE/DISMISS Button
        if(buttons.isEmpty) {
            let doneButton = UIButton(type: .system)
            if let colorScheme = self.colorScheme {
                doneButton.backgroundColor = colorScheme
                doneButton.tintColor = .white
            } else {
                doneButton.backgroundColor = .white
            }
            
            doneButton.frame = CGRect(
                x: 0,
                y: alertViewFrame.size.height - 45,
                width: alertViewFrame.size.width,
                height: 45)
            doneButton.setTitle("Ok", for: .normal)
            doneButton.actionHandler(controlEvents: .touchUpInside, forAction: {})
            doneButton.titleLabel!.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.medium)
            
            
            alertView!.addSubview(doneButton)
        }
        else {
            let buttonsView = UIView(frame: CGRect(
                                        x: 0,
                                        y: alertViewFrame.height - CGFloat(buttons.count <= 2 ? 1 : buttons.count) * FLAlertConstants.buttonHeight,
                                        width: alertViewFrame.width,
                                        height: CGFloat(buttons.count <= 2 ? 1 : buttons.count) * FLAlertConstants.buttonHeight))
            
            alertView!.addSubview(buttonsView)
            
            var buttonNumber = 0
            for button in buttons {
                if buttons.count <= 2 {
                    button.frame = CGRect(
                        x: (Int(alertViewFrame.width) / 2) * buttonNumber + buttonNumber * 2,
                        y: 0,
                        width: (Int(alertViewFrame.width) / buttons.count ) - buttonNumber * 2,
                        height: Int(FLAlertConstants.buttonHeight)
                    )
                    let spearator = visualEffectSeparator(rect: CGRect(
                                                            x: (Int(alertViewFrame.width) / 2) * buttonNumber,
                                                            y: 0,
                                                            width: 2,
                                                            height: Int(FLAlertConstants.buttonHeight)))
                    
                    if buttonNumber > 0 {
                        buttonsView.addSubview(spearator)
                    }
                } else {
                    button.frame = CGRect(
                        x: 0,
                        y: Int(FLAlertConstants.buttonHeight) * buttonNumber + 2,
                        width: Int(alertViewFrame.width),
                        height: Int(FLAlertConstants.buttonHeight - CGFloat(buttonNumber * 2))
                    )
                    let spearator = visualEffectSeparator(rect: CGRect(
                                                            x: 0,
                                                            y: Int(FLAlertConstants.buttonHeight) * buttonNumber,
                                                            width: Int(alertViewFrame.width),
                                                            height: 2))
                    
                    if buttonNumber > 0 {
                        buttonsView.addSubview(spearator)
                    }
                }
                
                buttonsView.addSubview(button)
                buttonNumber += 1
            }
        }
        
        
        circleLayer.path = UIBezierPath(ovalIn: CGRect(x: alertViewContainer!.frame.size.width / 2 - 30.0, y: -30.0, width: 60.0, height: 60.0)).cgPath
        
        
        let imageViewButton = UIButton(type: .system)
        imageViewButton.frame = CGRect(
            x: alertViewContainer!.frame.size.width / 2 - 15.0,
            y: -15.0,
            width: 30.0,
            height: 30.0)
        imageViewButton.setImage(alertImage, for: .normal)
        imageViewButton.isUserInteractionEnabled = false
        imageViewButton.tintColor = colorScheme
        
        //  VIEW Border - Rounding Corners of AlertView
        alertView?.layer.cornerRadius = FLAlertConstants.cornerRadius
        alertView?.clipsToBounds = true
        
        if alertImage != nil {
            alertViewContainer!.layer.addSublayer(circleLayer)
            alertViewContainer!.addSubview(imageViewButton)
        }
        
        //  Scaling AlertView - Before Animation
        alertViewContainer!.transform = CGAffineTransform(scaleX: 1.15, y: 1.15)
        
        //  Applying Shadow
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 10
        layer.shadowOffset = CGSize(width: 0, height: 0)
        
        showAlertView()
    }
}

// MARK: UI make actions
extension FLAlertView {
    // MARK: Drawing AlertView
    private func setupAlertViewFrame() -> CGRect {
        let screenSize = UIScreen.main.bounds.size
        let viewWidth = screenSize.width - FLAlertConstants.spacing
        let horizontalPosition = self.bounds.width / 2 - (viewWidth / 2)
        var alertViewFrame: CGRect
        
        
        alertContainerBackgroundView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        
        //  Adjusting AlertView Frames
        if alertImage != nil {
            alertViewFrame = CGRect(x: horizontalPosition,
                                    y: self.frame.size.height / 2 - (200.0 / 2),
                                    width: viewWidth,
                                    height: FLAlertConstants.height)
        } else {
            alertViewFrame = CGRect(x: horizontalPosition,
                                    y: self.frame.size.height / 2 - (170.0 / 2),
                                    width: viewWidth,
                                    height: FLAlertConstants.height - 30)
        }
        
        //  Frames for when AlertView doesn't contain a title
        if title == nil {
            alertViewFrame = CGRect(x: horizontalPosition,
                                    y: self.bounds.height / 2 - ((alertViewFrame.size.height - 50) / 2),
                                    width: viewWidth,
                                    height: alertViewFrame.size.height - 10)
        }
        
        //  Frames for when AlertView has buttons
        if buttons.isEmpty {
            alertViewFrame = CGRect(x: horizontalPosition,
                                    y: self.frame.size.height / 2 - ((alertViewFrame.size.height - 50) / 2),
                                    width: screenSize.width - FLAlertConstants.spacing,
                                    height: alertViewFrame.size.height - 45)
        } else {
            let buttonsHeight: CGFloat = CGFloat(buttons.count) * FLAlertConstants.buttonHeight
            let verticalPosition = CGFloat(self.bounds.height / 2) - CGFloat((alertViewFrame.size.height - 50) + buttonsHeight / 2)
            alertViewFrame = CGRect(x: horizontalPosition,
                                    y:verticalPosition,
                                    width: viewWidth,
                                    height: alertViewFrame.size.height - 50 + (CGFloat(buttons.count <= 2 ? 1 : buttons.count) * FLAlertConstants.buttonHeight))
        }
        return alertViewFrame
    }
    
    private func renderCircleCutout(withAlertViewFrame alertViewFrame: CGRect) {
        let radius = alertView!.frame.size.width
        let rectPath = UIBezierPath(roundedRect: CGRect(
                                        x: 0,
                                        y: 0,
                                        width: frame.size.width,
                                        height: alertView!.frame.size.height),
                                    cornerRadius: 0)
        let circlePath = UIBezierPath(roundedRect: CGRect(
                                        x: alertViewFrame.size.width / 2 - 33.75,
                                        y: -33.75,
                                        width: 67.5,
                                        height: 67.5),
                                      cornerRadius: radius)
        
        rectPath.append(circlePath)
        rectPath.usesEvenOddFillRule = true
        
        let fillLayer = CAShapeLayer()
        fillLayer.path = rectPath.cgPath
        fillLayer.fillRule = CAShapeLayerFillRule.evenOdd
        fillLayer.fillColor = UIColor.white.cgColor
        fillLayer.opacity = 1
        
        alertView!.layer.addSublayer(fillLayer)
    }
    
    private func renderHeader(withAlertViewFrame alertViewFrame: CGRect) {
        
        let titleLabel = UILabel(frame: CGRect(
                                    x: 15.0,
                                    y: 20.0 + CGFloat(((alertImage != nil) ? 1 : 0) * 30),
                                    width: alertViewFrame.size.width - 30.0,
                                    height: 20.0))
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.medium)
        titleLabel.numberOfLines = 1
        titleLabel.textColor = titleColor
        titleLabel.text = title
        titleLabel.textAlignment = .center
        
        let descriptionLevel = (title == nil) ? 25 : 45
        
        let messageLabel = UILabel(frame: CGRect(
                                        x: 25.0,
                                        y: CGFloat(descriptionLevel + ((alertImage != nil) ? 1 : 0) * 30),
                                        width: alertViewFrame.size.width - 50.0,
                                        height: 60.0))
        messageLabel.font = (title == nil) ? UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.regular):
            UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.light)
        
        messageLabel.numberOfLines = 4
        messageLabel.textColor = subTitleColor
        messageLabel.text = subTitle
        messageLabel.textAlignment = .center
        messageLabel.adjustsFontSizeToFitWidth = true
        
        //  Adding Contents - Conteained in Header and Separator Views
        alertViewContainer!.addSubview(titleLabel)
        alertViewContainer!.addSubview(messageLabel)

        if !buttons.isEmpty {
            let spearator = visualEffectSeparator(rect: CGRect(
                                                    x: 0,
                                                    y: alertViewFrame.size.height - (CGFloat(buttons.count <= 2 ? 1 : buttons.count) * FLAlertConstants.buttonHeight),
                                                    width: alertViewFrame.size.width,
                                                    height: 2))
            alertViewContainer!.addSubview(spearator)
        }
    }
    
    private func visualEffectSeparator(rect: CGRect) -> UIView {
        let separatorLineView = UIView(frame: rect)
        separatorLineView.backgroundColor = UIColor(white: 100 / 255, alpha: 1)
        let blurEffect = UIBlurEffect(style: .extraLight)
        let visualEffectView = UIVisualEffectView(effect: blurEffect)
        visualEffectView.frame = separatorLineView.bounds
        visualEffectView.isUserInteractionEnabled = false
        
        separatorLineView.addSubview(visualEffectView)
        return separatorLineView
    }
    
    // Default Types of Alerts
    private func makeWarningUI() {
        if let path = Bundle(for: FLAlertView.self).path(forResource: "close-round", ofType: "png") {
            setTheme(iconPath: path, tintColor: .flatRed)
        }
    }
    
    private func makeCautionUI() {
        if let path = Bundle(for: FLAlertView.self).path(forResource: "alert-round", ofType: "png") {
            setTheme(iconPath: path, tintColor: .flatOrange)
        }
    }
    
    private func makeSuccessUI() {
        if let path = Bundle(for: FLAlertView.self).path(forResource: "checkmark-round", ofType: "png") {
            setTheme(iconPath: path, tintColor: .flatGreen)
        }
    }
    
    private func setTheme(iconPath path: String, tintColor color: UIColor) {
        alertImage = UIImage(contentsOfFile: path)
        self.colorScheme = color
    }
    
}

//MARK: button actions adding methods
extension FLAlertView {
    
    public func addAction(title: String, type: FLButtonType = .defaultButton, action: @escaping ()-> Void) {
        let button = UIButton(type: .system)
        
        switch type {
        case .defaultButton:
            button.tintColor = colorScheme
        case .done:
            button.tintColor = .flatGreen
        case .cancel:
            button.tintColor = .flatRed
        }
        
        button.setTitle(title, for: .normal)
        button.backgroundColor = .white
        button.actionHandler(controlEvents: .touchUpInside) {
            action()
            self.dismissAlertView()
        }
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.regular)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.minimumScaleFactor = 0.8
        buttons.append(button)
    }
}

//MARK: Show methods
extension FLAlertView {
    
    public func showAlert(inView view: UIViewController) {
        view.view.window?.addSubview(self)
    }
    
    public func showAlert(inView view: UIViewController,
                          withTitle title: String?,
                          withSubtitle subTitle: String,
                          withCustomImage image: UIImage?,
                          withDoneButtonTitle done: String?) {
        
        self.title = title
        self.subTitle = subTitle
        self.alertImage = image
        addAction(title: done ?? "Done", type: .done, action: dismissAlertView)
        
        
        view.view.window?.addSubview(self)
    }
    
    // Show Alert View
    func showAlertView() {
        UIView.animate(withDuration: 0.3, delay: 0.3, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
            self.alpha = 1
            self.alertViewContainer?.transform = CGAffineTransform(scaleX: 1, y: 1)
        }) { (finished) in
            if self.autoHideSeconds != 0 {
                self.perform(#selector(self.dismissAlertView), with: nil, afterDelay: Double(self.autoHideSeconds))
            }
        }
    }
    
    // Dismissing Alert View
    @objc public func dismissAlertView() {
        UIView.animate(withDuration: 0.175, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
            self.alpha = 0
            self.alertViewContainer?.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }) { (finished) in
            self.removeFromSuperview()
        }
    }
}
