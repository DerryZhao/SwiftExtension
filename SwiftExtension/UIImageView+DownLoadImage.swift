//
//  UIImageView+DownLoadImage.swift
//  SwiftExtension
//
//  Created by zhaoheqiang on 16/6/4.
//  Copyright © 2016年 zhaoheqiang. All rights reserved.
//

import UIKit

extension UIImageView {

    func loadImageWithUrl(url: String) -> NSURLSessionDownloadTask?{
        let url = NSURL(string: url)
        let downloadTask = NSURLSession.sharedSession().downloadTaskWithURL(url!) { (newUrl, response, error) -> Void in
            if error != nil {
                debugPrint(error)
                return
            }
            if let data = NSData(contentsOfURL: newUrl!), image = UIImage(data: data){
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.image = image
                })
                
            }
        }
        downloadTask.resume()
        return downloadTask
    }

}
