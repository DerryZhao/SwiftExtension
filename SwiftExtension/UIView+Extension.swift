//
//  UIViewExtension.swift
//  SwiftExtension
//
//  Created by zhaoheqiang on 16/6/5.
//  Copyright © 2016年 zhaoheqiang. All rights reserved.
//

import UIKit

//MARK: UIView布局
extension public UIView {

   public func setX(x: CGFloat) {
        self.frame.origin.x = x
    }
    
   public func setY(y: CGFloat) {
        self.frame.origin.y = y
    }
    
    public func x() -> CGFloat {
        return self.frame.origin.x
    }
    
    public func y() -> CGFloat {
        return self.frame.origin.y
    }
    
    public func setCenterX(centerX: CGFloat) {
        self.center.x = centerX
    }
    
    public func setCenterY(centerY: CGFloat) {
        self.center.y = centerY
    }
    
    public func centerX() -> CGFloat {
        return self.center.x
    }
    
    public func centerY() -> CGFloat {
        return self.center.y
    }
    
    public func setWidth(width: CGFloat) {
        self.frame.size.width = width
    }
    
    public func setHeight(height: CGFloat){
        self.frame.size.height = height
    }
    
    public func width() -> CGFloat {
        return self.bounds.width
    }
    
    public func height() -> CGFloat {
        return self.bounds.height
    }
    
    public func setSize(size: CGSize) {
        self.frame.size = size
    }
    
    public func setOrigin(origin: CGPoint) {
        self.frame.origin = origin
    }
    
    public func size() -> CGSize {
        return self.frame.size
    }
    
    public func origin() -> CGPoint {
        return self.frame.origin
    }

}

//MARK: UIView view操作
extension public UIView {

    public func removeAllSubview() {
        for view in self.subviews {
            view.removeFromSuperview()
        }
    }
}


