import UIKit
import PlaygroundSupport

// 每个UIView都有一个锚点，这是动画发生的点。通常这是视图的中心 - X：0.5 Y：0.5 - 这意味着如果旋转视图，它将围绕其中心旋转。

// 如果您希望视图围绕其顶角旋转，就好像有人将钉子钉入该点并且您正在围绕该角落而不是中心旋转视图，您可以使用该layer.anchorPoint属性更改锚点。

// 但是，存在一个问题：更改锚点也会更改计算视图位置的点，这意味着更改锚点也会移动视图的位置。

// 所以，如果你想在不移动它的情况下更改视图的锚点，这里有一个小扩展来做到这一点：

extension UIView {
    func setAnchorPoint(_ point: CGPoint) {
        var newPoint = CGPoint(x: bounds.size.width * point.x, y: bounds.size.height * point.y)
        var oldPoint = CGPoint(x: bounds.size.width * layer.anchorPoint.x, y: bounds.size.height * layer.anchorPoint.y);
        
        newPoint = newPoint.applying(transform)
        oldPoint = oldPoint.applying(transform)
        
        var position = layer.position
        
        position.x -= oldPoint.x
        position.x += newPoint.x
        
        position.y -= oldPoint.y
        position.y += newPoint.y
        
        layer.position = position
        layer.anchorPoint = point
    }
}

let container = UIView.init(frame: .init(x: 0, y: 0, width: 500, height: 500))
PlaygroundPage.current.liveView = container

let box = UIView(frame: CGRect(x: 50.0, y: 50.0, width: 256.0, height: 256.0))
box.backgroundColor = .blue
container.addSubview(box)
// 围绕它的左上角旋转
box.setAnchorPoint(CGPoint(x: 0.0, y: 0.0))
UIView.animate(withDuration: 3) {
    box.transform = CGAffineTransform(rotationAngle: .pi)
}


