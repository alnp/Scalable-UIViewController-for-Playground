/* MIT License

Copyright (c) 2020 Alessandra Luana Nascimento Pereira

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
*/

import UIKit

public enum ScreenType {
    case iphone11ProMax
    case iphone11Pro
    case iphone11
    case iphoneXR
    case iphone8Plus
    case iphone8
    case ipad
    case ipadPro10_5
    case ipadPro12_9
    case mac
    case other(width: Int, height: Int)
    
    public func size(isPortrait: Bool = true) -> CGSize {
        var size: CGSize
        switch self {
        case .iphone11ProMax:
            size = CGSize(width: 414, height: 896)
        case .iphone11Pro:
            size = CGSize(width: 375, height: 480)
        case .iphone11:
            size = CGSize(width: 414, height: 480)
        case .iphoneXR:
            size = CGSize(width: 414, height: 480)
        case .iphone8Plus:
            size = CGSize(width: 414, height: 480)
        case .iphone8:
            size = CGSize(width: 375, height: 480)
        case .ipad:
            size = CGSize(width: 768, height: 1024)
        case .ipadPro10_5:
            size = CGSize(width: 834, height: 1112)
        case .ipadPro12_9:
            size = CGSize(width: 1024, height: 1366)
        case .mac:
            return CGSize(width: 1440, height: 900)
        case .other(let width, let height):
            size = CGSize(width: width, height: height)
        }
        if !isPortrait {
            return CGSize(width: size.height, height: size.width)
        }
        return size
    }
}

extension UIViewController {
    
    public convenience init(screenType: ScreenType, isPortrait: Bool = true) {
        self.init(nibName: nil, bundle: nil)
        let size = screenType.size(isPortrait: isPortrait)
        view.frame.size = size
        view.clipsToBounds = true
        preferredContentSize = size
    }
    
    func setupForNavigation() {
        guard let self = self as? UINavigationController else { return }
        if let contentSize = self.topViewController?.view.frame.size {
            self.view.frame.size = contentSize == .zero ? view.frame.size : contentSize
        } else {
            print("Erro: Seu Navigation Controller não possui um View Controller")
        }
    }
    
    func setupRootView(_ rootView: UIView, withCenteredSubview: Bool = true) {
        rootView.backgroundColor = .black
        rootView.addSubview(self.view)
        if withCenteredSubview {
            self.view.center = rootView.center
        } else {
            self.view.center.x = rootView.center.x
            self.view.center.y = rootView.frame.minY + self.view.frame.height/2
        }
        
    }
    
    public func scale(to scale: Float) -> UIView {
        setupForNavigation()
        self.view.transform = CGAffineTransform(scaleX: CGFloat(scale), y: CGFloat(scale))
        let rootView = UIView(frame: CGRect(x: 0, y: 0, width: 768, height: 1024))
        setupRootView(rootView)
        self.preferredContentSize = self.view.frame.size
        return rootView
    }
    
    public func scaleToFit(withKeyboard: Bool = false) -> UIView {
        setupForNavigation()
        let viewSize = self.view.frame.size
        let maxRootViewSize = CGSize(width: 768, height: 1024)
        let isViewPortrait = viewSize.height > viewSize.width
        let scale = isViewPortrait ? (maxRootViewSize.height/viewSize.height) : (maxRootViewSize.width/viewSize.width)
        self.view.transform = CGAffineTransform(scaleX: CGFloat(scale), y: CGFloat(scale))
        let rootViewSize = CGSize(width: self.view.frame.width, height: withKeyboard ? 1024 : self.view.frame.height)
        let rootView = UIView(frame: CGRect(x: 0, y: 0, width: rootViewSize.width, height: rootViewSize.height))
        setupRootView(rootView, withCenteredSubview: false)
        self.preferredContentSize = rootView.frame.size
        return rootView
    }
}
