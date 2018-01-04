//
//  ViewController.swift
//  ZJQuartzCoreDemo
//
//  Created by 张剑 on 16/6/2.
//  Copyright © 2016年 张剑. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        test03()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func test01(){
        UIGraphicsBeginImageContext(self.view.bounds.size);
        let gc = UIGraphicsGetCurrentContext();
        
        //参照点坐标
        var transform = CGAffineTransformMakeTranslation(0,0);
        
        let path = CGPathCreateMutable();
        
        //圆中心点为(100,100) 半径50  起始角度为0 旋转1.5PI 顺时针
        //这时候画笔的起始点为(150,100) 画完之后停留在(100,50)
        CGPathAddArc(path, &transform, 100, 100, 50, 0, 1.5*CGFloat(M_PI), false);
        
        //从当前点到(100,100)画线
        CGPathAddLineToPoint(path, &transform, 100, 100);
        
        //从当前点到(150，100)画线
        CGPathAddLineToPoint(path, &transform, 150, 100);
        
        //移动画笔位置
        CGPathMoveToPoint(path, &transform, 100, 50);
        
        CGContextAddPath(gc, path);
        UIColor.grayColor().setFill();
        UIColor.orangeColor().setStroke();
        
        CGContextSetLineWidth(gc, 1);
        CGContextDrawPath(gc, CGPathDrawingMode.FillStroke);
        
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        let imageView = UIImageView(image: image);
        self.view.addSubview(imageView);
    }
    

    
    func test02(){
        UIGraphicsBeginImageContext(self.view.bounds.size);
        let gc = UIGraphicsGetCurrentContext();
        
        //参照点坐标
        var transform = CGAffineTransformMakeTranslation(50,100);
        
        let path = CGPathCreateMutable();
        //初始点为(0, 0)
        CGPathMoveToPoint(path, &transform, 0, 0);
        
        //这样理解 起始点为(0,0) 终点为（100，0）交叉点为(50,200) 画一个半径为10的半圆
        CGPathAddArcToPoint(path, &transform, 50, 200, 100, 0, 10);
        
        
        //CGPathAddArcToPoint会在交点中停止，所以需要再次调用CGPathAddLineToPoint画出下面的线
        CGPathAddLineToPoint(path, &transform, 100, 0);
        
        CGContextAddPath(gc, path);
        UIColor.grayColor().setFill();
        UIColor.orangeColor().setStroke();
        
        CGContextSetLineWidth(gc, 1);
        CGContextDrawPath(gc, CGPathDrawingMode.FillStroke);
        
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        let imageView = UIImageView(image: image);
        self.view.addSubview(imageView);
    }
    
    func test03(){
        UIGraphicsBeginImageContext(self.view.bounds.size);
        let gc = UIGraphicsGetCurrentContext();
        
        //参照点坐标
        var transform = CGAffineTransformMakeTranslation(50,100);
        
        let path = CGPathCreateMutable();
        
        CGPathAddArc(path, &transform, 100, 100, 50, CGFloat(M_PI), 2*CGFloat(M_PI), false);
        //初始点为(50, 100)
        CGPathMoveToPoint(path, &transform, 50, 100);
        
        //这样理解 起始点为(50,100) 终点为（150,100）交叉点为(100,200) 画一个半径为10的半圆
        CGPathAddArcToPoint(path, &transform, 100, 200, 150, 100, 10);
        
        
        //CGPathAddArcToPoint会在交点中停止，所以需要再次调用CGPathAddLineToPoint画出下面的线
        CGPathAddLineToPoint(path, &transform, 150, 100);
        
        CGContextAddPath(gc, path);
        UIColor.grayColor().setFill();
        UIColor.orangeColor().setStroke();
        
        CGContextSetLineWidth(gc, 1);
        CGContextDrawPath(gc, CGPathDrawingMode.FillStroke);
        
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        let imageView = UIImageView(image: image);
        self.view.addSubview(imageView);
    }


}

