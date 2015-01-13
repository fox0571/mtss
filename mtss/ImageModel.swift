//
//  ImageModel.swift
//  mtss
//
//  Created by Bo Hu on 15/1/1.
//  Copyright (c) 2015年 H.Fox. All rights reserved.
//

import Foundation

class ImageModel{
    var searchURLOrigin:NSString="http://image.baidu.com/i?tn=baiduimagejson&width=&height=&word=cute&rn=50&pn="
    
    let maxNumber=999
    var imageArray=Array<String>()
    func encodeURL(url:NSString) -> NSString{
        var searchURLAfterEncode=url.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
        return searchURLAfterEncode!

    }
    
    func getImageArray(){
        for i in 1...20{
            var URLSearch=NSURL(string:encodeURL(searchURLOrigin+i.description))
            var request=NSURLRequest(URL:URLSearch!)
            var response:AutoreleasingUnsafeMutablePointer<NSURLResponse?>=nil
            var error:AutoreleasingUnsafeMutablePointer<NSErrorPointer>=nil
        
            var responseData=NSURLConnection.sendSynchronousRequest(request, returningResponse: response, error: nil) as NSData!
        
            if error != nil{
                println(error)
            } else {
                let string:NSString=NSString(data:responseData!,encoding:NSISOLatin1StringEncoding)!
                let newdata=string.dataUsingEncoding(NSUTF8StringEncoding)
                let json = NSJSONSerialization.JSONObjectWithData(newdata!, options: NSJSONReadingOptions.MutableContainers,error: nil) as NSDictionary
                let imageSource = json["data"] as NSArray
                for i in imageSource{
                    if let imgURL=i["objURL"] as? NSString{
                        self.imageArray.append(imgURL)
                        //println(self.imageArray.count)
                        //println(imgURL)
                    }
                }
            }
        }
        
        /*
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler:{
            (response, data, error) -> Void in
            
            if (error != nil) {
                println(error)
            }else{
                
                let string=NSString(data:data!,encoding:NSISOLatin1StringEncoding)
                let newdata=string!.dataUsingEncoding(NSUTF8StringEncoding)
                let json = NSJSONSerialization.JSONObjectWithData(newdata!, options: NSJSONReadingOptions.MutableContainers,error: nil) as NSDictionary
                let imageSource = json["data"] as NSArray
                var count=0
                for i in imageSource{
                    if let imgURL=i["objURL"] as? NSString{
                        self.imageArray.append(imgURL)
                        println(self.imageArray.count)
                        println("\(count)=========================")
                        println(imgURL)
                        count++
                    }
                }
                            }
        })
        */
    }
    
    func getRandomImages() -> Array<Int>{
        var randomImageIndexArray=Array<Int>(count: 9, repeatedValue: 0)
        for i in 0..<9{
            randomImageIndexArray.append(Int(arc4random_uniform(UInt32(maxNumber+1))))
        }
        return randomImageIndexArray
        
    }
    
    
    

}