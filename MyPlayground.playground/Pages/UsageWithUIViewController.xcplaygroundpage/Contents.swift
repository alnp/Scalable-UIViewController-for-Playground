import UIKit
import PlaygroundSupport
import Foundation

class MyViewController: UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .orange
        
        let image = #imageLiteral(resourceName: "dukesamoieda.png")
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 10, y: 5, width: 475/2, height: 595/2)
        
        view.addSubview(imageView)
        self.view = view
    }
}

let vc = MyViewController(screenType: .ipadPro12_9, isPortrait: false)
PlaygroundPage.current.liveView = vc.scaleToFit()
