//: Playground - noun: a place where people can play

import UIKit

class Circle : UIView {
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        path.move(to: .zero)
//        path.addLine(to: CGPoint(x: 100, y: 100))
        
        // x^2 + y^2 = r^2
        
        // cos(θ) = x/r ==> x = r * cos(θ)
        // sin(θ) = y/r == y = r * sin(θ)
        
        let radius:Double = Double(rect.width) / 2 - 20
        
        let center = CGPoint(x: rect.width / 2 , y: rect.height / 2)
        
        path.move(to: CGPoint(x: center.x + CGFloat(radius) , y: center.y))
        for i in stride(from: 0, to: 361, by: 1) {
            
            // radians = degrees * PI / 180
            
            let radians = Double(i) * Double.pi / 180
            
            let x = Double(center.x) + radius * cos(radians)
            let y = Double(center.y) + radius * sin(radians)
            
            
//            print(x,y)
            path.addLine(to: CGPoint(x: x, y: y))
        }
        UIColor.blue.setStroke()
        path.lineWidth = 5
        path.stroke()
    }
}


let view = Circle(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
view.backgroundColor = UIColor.yellow
