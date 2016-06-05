//
//  UIViewExtension.swift
//  SwiftExtension
//
//  Created by zhaoheqiang on 16/6/5.
//  Copyright © 2016年 zhaoheqiang. All rights reserved.
//

import UIKit

//MARK: UIView布局
extension UIView {

    func setX(x: CGFloat) {
        self.frame.origin.x = x
    }
    
    func setY(y: CGFloat) {
        self.frame.origin.y = y
    }
    
    func x() -> CGFloat {
        return self.frame.origin.x
    }
    
    func y() -> CGFloat {
        return self.frame.origin.y
    }
    
    func setCenterX(centerX: CGFloat) {
        self.center.x = centerX
    }
    
    func setCenterY(centerY: CGFloat) {
        self.center.y = centerY
    }
    
    func centerX() -> CGFloat {
        return self.center.x
    }
    
    func centerY() -> CGFloat {
        return self.center.y
    }
    
    func setWidth(width: CGFloat) {
        self.frame.size.width = width
    }
    
    func setHeight(height: CGFloat){
        self.frame.size.height = height
    }
    
    func width() -> CGFloat {
        return self.bounds.width
    }
    
    func height() -> CGFloat {
        return self.bounds.height
    }
    
    func setSize(size: CGSize) {
        self.frame.size = size
    }
    
    func setOrigin(origin: CGPoint) {
        self.frame.origin = origin
    }
    
    func size() -> CGSize {
        return self.frame.size
    }
    
    func origin() -> CGPoint {
        return self.frame.origin
    }

}

//MARK: UIView view操作
extension UIView {

    func removeAllSubview() {
        for view in self.subviews {
            view.removeFromSuperview()
        }
    }
}


