import UIKit
import PlaygroundSupport

class ColorViewController: UIViewController {
    var color: UIColor = #colorLiteral(red: 0.831372549, green: 0.568627451, blue: 0.1490196078, alpha: 1)
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = self.color
        self.view = view
    }
}

let flicts = ColorViewController()
flicts.title = "Flicts"

let vermelho = ColorViewController()
vermelho.color = .red
vermelho.title = "Red"
vermelho.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)

let verde = ColorViewController()
verde.color = .green
verde.title = "Verde"

let itemImage = UIImage(systemName: "paperplane")
verde.tabBarItem = UITabBarItem(title: nil, image: itemImage, tag: 0)

let azul = ColorViewController()
azul.color = .blue
azul.title = "Blue"

let blueItemImage = UIImage(systemName: "moon.fill")
azul.tabBarItem.image = blueItemImage
azul.tabBarItem.badgeValue = "1"


let viewControllers = [ /* suas telas */
    flicts,
    vermelho,
    verde,
    azul
]

let tabBarController = UITabBarController(screenType: .mac)
tabBarController.viewControllers = viewControllers
PlaygroundPage.current.liveView = tabBarController.scaleToFit()
