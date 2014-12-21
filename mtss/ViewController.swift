//
//  ViewController.swift
//  mtss
//
//  Created by Bo Hu on 14/12/17.
//  Copyright (c) 2014年 H.Fox. All rights reserved.
//

import UIKit

class ViewController: UIViewController,HttpProtocol {

    //var imageHttp:HttpController=HttpController()
    //var URLArray=[String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //getCurrentFrameSize()
        
       //// var URLArray=[String]()
        //createURLArray()
        //println(URLArray.count)
        setImageView()
        //println (request.allHTTPHeaderFields)

        //imageHttp.delegate=self
        //imageHttp.onSearch("http://image.baidu.com/i?tn=baiduimagejson&width=&height=&word=girl&rn=10&pn=2")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didRecieveResults(results:NSDictionary){
        println("=================================")
        println(results)
    }
    
/*    func createURLArray(){
        var URLArray=[String]()
        
        let urlSearch = NSURL(string:"http://image.baidu.com/i?tn=baiduimagejson&width=&height=&word=girl&rn=10&pn=2")
        let request=NSURLRequest(URL:urlSearch!)
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
                    //if i["objURL"] != nil{
                    //println(i["objURL"])
                    //var imgURL=""
                    if let imgURL=i["objURL"] as? NSString{
                        self.URLArray.append(imgURL)
                        println(self.URLArray.count)
                        println("\(count)=========================")
                        println(imgURL)
                        count++
                    }
                    //}
                }
                
                
                //let string1 = NSString(data: data, encoding: NSISOLatin1StringEncoding)
                //println(string1)
            }
            
        })
    }
*/
    func setImageView(){
        //println(self.view.frame.width-4/3)
        var URLArray=[String]()
        
        let urlSearch = NSURL(string:"http://image.baidu.com/i?tn=baiduimagejson&width=&height=&word=girl&rn=10&pn=2")
        let request=NSURLRequest(URL:urlSearch!)
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
                    //if i["objURL"] != nil{
                    //println(i["objURL"])
                    //var imgURL=""
                    if let imgURL=i["objURL"] as? NSString{
                        URLArray.append(imgURL)
                        println(URLArray.count)
                        println("\(count)=========================")
                        println(imgURL)
                        count++
                    }
                    //}
                }
                
                
                //let string1 = NSString(data: data, encoding: NSISOLatin1StringEncoding)
                //println(string1)
            }
            
        

        var width:CGFloat=(self.view.frame.width-4)/3
        var height:CGFloat=(self.view.frame.width-60)/3
        var padding:CGFloat=1
        var x:CGFloat=1
        var y:CGFloat=100
        for i in 0..<3{
            for j in 0..<3{
                var imageView=UIImageView(image: UIImage(data:NSData(contentsOfURL:NSURL(string: URLArray[3*i+j])!)!))
                imageView.frame=CGRectMake(x, y, width, height)
                imageView.backgroundColor=UIColor.darkGrayColor()
                imageView.contentMode=UIViewContentMode.ScaleAspectFit
                self.view.addSubview(imageView)
                //imageView.frame.get
                x+=width+padding
            }
            x=1
            y+=height+padding
        }
        })
    }
}