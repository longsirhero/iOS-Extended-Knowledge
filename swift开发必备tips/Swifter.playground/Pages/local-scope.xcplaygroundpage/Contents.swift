import UIKit
import PlaygroundSupport

func local(_ closure: ()->()) {
    closure()
}

func loadView() {
    
    let view = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 480))
    view.backgroundColor = .white
    
    local {
        let titleLabel = UILabel(frame: CGRect(x: 150, y: 30, width: 200, height: 40))
        titleLabel.textColor = .red
        titleLabel.text = "Title"
        view.addSubview(titleLabel)
    }
    
    local {
        let textLabel = UILabel(frame: CGRect(x: 150, y: 80, width: 200, height: 40))
        textLabel.textColor = .red
        textLabel.text = "Text"
        view.addSubview(textLabel)
    }
    
    PlaygroundPage.current.liveView = view
}

loadView()

let titleLabel: UILabel = {
    let label = UILabel(frame: CGRect(x: 150, y: 30, width: 200, height: 40))
    label.textColor = .red
    label.text = "Title"
    return label
}()