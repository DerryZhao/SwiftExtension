//
//  UIImageView+DownLoadImage.swift
//  SwiftExtension
//
//  Created by zhaoheqiang on 16/6/4.
//  Copyright © 2016年 zhaoheqiang. All rights reserved.
//

import UIKit

extension UIImageView {

    public func loadImageWithUrl(url: String) -> NSURLSessionDownloadTask?{
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
    
    public func setZYHWebImage(url: String?, defaultImage: String?, isCache: Bool){
        var currentImage: UIImage?
        if url == nil {
            return
        }
        //设置默认图片
        if defaultImage != nil {
            self.image=UIImage(named: defaultImage!)
        }
        //是否进行缓存处理
        if isCache {
            //缓存管理类
            let data:NSData? = readCacheFromUrl(url!)
            if data != nil {
                currentImage = UIImage(data: data!)
                self.image = currentImage
            }else{
               setImageForImageView(url!, isCache: true)
            }
        }else{
            setImageForImageView(url!, isCache: false)
        }
    }
    
    public func setImageForImageView(urlString: String, isCache: Bool) {
        let dispatch = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)
        dispatch_async(dispatch) {
            let url = NSURL(string: urlString)
            let data: NSData? = NSData(contentsOfURL: url!)
            if data != nil {
               let currentImage = UIImage(data: data!)
                if isCache {
                    self.writeCacheToUrl(urlString, data: data!)
                }
                dispatch_async(dispatch_get_main_queue(), {
                    self.image = currentImage
                })
            }
        }
    }
    
    public func readCacheFromUrl(url: String) -> NSData?{
        var data:NSData?
        let path = getFullCachePathFromUrl(url)
        if NSFileManager.defaultManager().fileExistsAtPath(path) {
            data = NSData.dataWithContentsOfMappedFile(path) as? NSData
        }
        return data
    }
    
    public func writeCacheToUrl(url: String, data: NSData){
        let path = getFullCachePathFromUrl(url)
        print(data.writeToFile(path, atomically: true))
    }
    //设置缓存路径
    public func getFullCachePathFromUrl(url: String)-> String{
        var chchePath=NSHomeDirectory().stringByAppendingString("/Library/Caches/ImageCache")
        let fileManager:NSFileManager=NSFileManager.defaultManager()
        if !(fileManager.fileExistsAtPath(chchePath)) {
            try! fileManager.createDirectoryAtPath(chchePath, withIntermediateDirectories: true, attributes: nil)
        }
        let imageName = createCacheName(url as String)
        chchePath = chchePath.stringByAppendingFormat("/%@", imageName)
        return chchePath
    }
    
    public func createCacheName(data: String) -> String {
        let stringArray = data.componentsSeparatedByString("/")
        var str = ""
        for string in stringArray {
            if !string.containsString("http") && !string.containsString("www.") {
                str += string
            }
        }
        return str
    }

}

