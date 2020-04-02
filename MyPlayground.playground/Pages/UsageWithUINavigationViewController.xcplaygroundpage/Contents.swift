import UIKit
import PlaygroundSupport

class FirstViewController: UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .purple
        
        let button = UIButton(frame: CGRect(x: 60, y: 100, width: 250, height: 100))
        button.setTitle("Exibir SecondViewController", for: .normal)
        button.addTarget(nil, action: #selector(tapButton), for: .touchUpInside)
        
        view.addSubview(button)
        self.view = view
    }
    
    @objc func tapButton() {
        print("Apertou botão da FirstViewController")
        navigationController?.pushViewController(secondViewController, animated: true)
    }
}

class SecondViewController: UIViewController {
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .blue
        
        let button = UIButton(frame: CGRect(x: 60, y: 400, width: 250, height: 100))
        button.setTitle("Exibir ThirdViewController", for: .normal)
        button.addTarget(nil, action: #selector(tapButton), for: .touchUpInside)
        
        view.addSubview(button)
        self.view = view
    }
    
    @objc func tapButton() {
        print("Apertou botão da SecondViewController")
        navigationController?.show(thirdViewController, sender: nil)
        navigationController?.navigationBar.isHidden = true
    }
}

class ThirdViewController: UIViewController {
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .yellow
        
        let button = UIButton(frame: CGRect(x: 60, y: 400, width: 250, height: 100))
        button.setTitle("Exibir SecondViewController", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(nil, action: #selector(tapButton), for: .touchUpInside)
        
        view.addSubview(button)
        self.view = view
        
    }
    
    @objc func tapButton() {
        print("Apertou botão da ThirdViewController")
        navigationController?.navigationBar.isHidden = false
        navigationController?.popViewController(animated: true)
    }
}


let firstViewController = FirstViewController()
let secondViewController = SecondViewController()
let thirdViewController = ThirdViewController()

let navigation = UINavigationController(screenType: .ipad, isPortrait: false)
navigation.pushViewController(firstViewController, animated: true)

PlaygroundPage.current.liveView = navigation.scale(to: 0.5)
//: -------------
//: ## Perguntas norteadoras
//: - Qual é a diferença se usamos *dismiss()* ao invés de *popViewController()*? Funciona do mesmo jeito?
//: - Qual é a diferença se usamos *present()* ao invés de *show()* com NavigationControllers?
//: ----------
