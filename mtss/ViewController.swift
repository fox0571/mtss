//
//  ViewController.swift
//  mtss
//
//  Created by Bo Hu on 14/12/17.
//  Copyright (c) 2014年 H.Fox. All rights reserved.
//

import UIKit

class ViewController: UIViewController,HttpProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.backgroundColor=UIColor.darkGrayColor()
        setImageView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didRecieveResults(results:NSDictionary){
        println("=================================")
        println(results)
    }

    func setImageView(){
        var width:CGFloat=(self.view.frame.width-4)/3
        var height:CGFloat=(self.view.frame.width-60)/3
        var padding:CGFloat=1
        var x:CGFloat=1
        var y:CGFloat=100
        
        var img=ImageModel()
        img.getImageArray()
       // var imgRandomArray=img.getRandomImage()
        for i in 0..<3{
            for j in 0..<3{
                var index=Int(arc4random_uniform(1000))
                println(index)
                var imageView=UIImageView(image: UIImage(data:NSData(contentsOfURL:NSURL(string: img.imageArray[index])!)!))
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
    }
}