//
//  String+HtmlToString.swift
//  SwiftExtension
//
//  Created by zhaoheqiang on 16/6/4.
//  Copyright © 2016年 zhaoheqiang. All rights reserved.
//

import UIKit

extension String {
    //MARK: html to format string
   public func htmlFormatString() -> String{
        let str = self.dataUsingEncoding(NSUTF8StringEncoding)
        let attributedStr = try? NSAttributedString(data: str!, options: [NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType,NSCharacterEncodingDocumentAttribute:NSUTF8StringEncoding], documentAttributes: nil)
        return (attributedStr?.string.stringByReplacingOccurrencesOfString("%", withString: " "))!
    }
    
    public func toDate() -> String {
        let index = self.startIndex.advancedBy(10)
        let str = self.substringToIndex(index)
        let timeSta:NSTimeInterval = Double(str)!
        let dfmatter = NSDateFormatter()
        dfmatter.dateFormat="yyyy-MM-dd hh:mm"
        let date = NSDate(timeIntervalSince1970: timeSta)
        return dfmatter.stringFromDate(date)
    }
    
}