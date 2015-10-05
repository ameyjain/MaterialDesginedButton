//
//  ViewController.swift
//  MaterialDesginedButton
//
//  Created by Amey Jain on 10/4/15.
//  Copyright © 2015 Amey Jain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let launchimage = UIImage(named: "button.png")
    let uploadimage = UIImage(named: "Camera.png")
    let likedimage = UIImage(named: "Star.png")
    let backimage = UIImage(named: "Home.png")
    let popularimage = UIImage(named: "Trend.png")
    let twoCellViewImage = UIImage(named: "Menu.png")
    let videoImage = UIImage(named: "Clock.png")
    let downloadImage = UIImage(named: "play.png")
    let labelupload = UILabel()
    let labelhome = UILabel()
    let labelliked = UILabel()
    let labelTrending = UILabel()
    let downloadButton   = UIButton(type: UIButtonType.System)
    let twoCellViewButton   = UIButton(type: UIButtonType.System)
    let popularbutton   = UIButton(type: UIButtonType.System)
    let button   = UIButton(type: UIButtonType.System)
    let backbutton   = UIButton(type: UIButtonType.System)
    let buttonupload   = UIButton(type: UIButtonType.System)
    let buttonliked   = UIButton(type: UIButtonType.System)
    var flag = 0
    var i = 0
    let overlayView = UIView(frame: CGRect())
    var shouldrotate = true
    let background = UIImage(named: "background")


    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageView = UIImageView.init(frame: CGRectMake(0, 0, self.view.frame.width, self.view.frame.height))
        imageView.image = UIImage(named: "background")
        self.view.addSubview(imageView)
        
        button.frame = CGRectMake(self.view.frame.width - 90, self.view.frame.height / 1.30 + 40 , 60, 60)
        button.setBackgroundImage(launchimage, forState: UIControlState.Normal)
        button.addTarget(self, action: "launcherbuttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        button.layer.shadowColor = UIColor.blackColor().CGColor
        button.layer.shadowOffset = CGSizeMake(1, 1)
        button.layer.shadowRadius = 5
        self.view.addSubview(button)
        i = 0
        flag = 0
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func launcherbuttonAction(sender:UIButton!){
        
        self.button.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_2))
        overlayView.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
        if(i == 0){
            i = 1
            overlayView.alpha = 0.6
            overlayView.backgroundColor = UIColor.blackColor()
        }
        
        buttonupload.frame = CGRectMake(self.view.frame.width - 85, self.view.frame.height / 1.30 - 20, 50, 50)
        buttonupload.setBackgroundImage(uploadimage, forState: UIControlState.Normal)
        
        popularbutton
        popularbutton.frame = CGRectMake(self.view.frame.width - 85, self.view.frame.height / 1.30 - 200, 50, 50)
        popularbutton.setBackgroundImage(popularimage, forState: UIControlState.Normal)
        
        
        backbutton.frame = CGRectMake(self.view.frame.width - 85, self.view.frame.height / 1.30 - 140, 50, 50)
        backbutton.setBackgroundImage(backimage, forState: UIControlState.Normal)
        backbutton.addTarget(self, action: "backbuttonpressed:", forControlEvents: UIControlEvents.TouchUpInside)
        
        buttonliked.frame = CGRectMake(self.view.frame.width - 85, self.view.frame.height / 1.30 - 80, 50, 50)
        buttonliked.setBackgroundImage(likedimage, forState: UIControlState.Normal)
        buttonliked.addTarget(self, action: "buttonliked:", forControlEvents: UIControlEvents.TouchUpInside)
        
        
        twoCellViewButton.frame = CGRectMake(self.view.frame.width - 150, self.view.frame.height / 1.30 + 45 , 50, 50)
        twoCellViewButton.setBackgroundImage(twoCellViewImage, forState: UIControlState.Normal)
        twoCellViewButton.addTarget(self, action: "cellsplitcall:", forControlEvents: UIControlEvents.TouchUpInside)
        
        
        if (shouldrotate){
            UIView.animateWithDuration(0.4,
                animations:
                { () -> Void in
                    self.buttonupload.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
                    self.backbutton.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
                    self.popularbutton.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
                    self.twoCellViewButton.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
                    self.buttonliked.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
                    
                },
                completion: nil)
            shouldrotate = false
        }else{
            UIView.animateWithDuration(0.4,
                animations:
                { () -> Void in
                    self.buttonupload.transform = CGAffineTransformMakeRotation(CGFloat(0))
                    self.backbutton.transform = CGAffineTransformMakeRotation(CGFloat(0))
                    self.popularbutton.transform = CGAffineTransformMakeRotation(CGFloat(0))
                    self.twoCellViewButton.transform = CGAffineTransformMakeRotation(CGFloat(0))
                    self.buttonliked.transform = CGAffineTransformMakeRotation(CGFloat(0))
                    
                },
                completion: nil)
            shouldrotate = true
        }
        
        
        if(flag == 0){
            UIView.animateWithDuration(0.4,
                animations:
                { () -> Void in
                    self.button.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_4) + CGFloat(M_PI))
                },
                completion: nil)
            self.addSubviews()
            flag = 1
        }
        else{
            UIView.animateWithDuration(0.3,
                animations:
                { () -> Void in
                    self.button.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_2) + CGFloat(M_PI))
                },
                completion: nil)
            self.hideSubviews()
            flag = 0
        }
    }
    

    
    
    func hideSubviews(){
        self.view.sendSubviewToBack(buttonliked)
        self.view.sendSubviewToBack(buttonupload)
        self.view.sendSubviewToBack(backbutton)
        self.view.sendSubviewToBack(labelhome)
        self.view.sendSubviewToBack(labelTrending)
        self.view.sendSubviewToBack(labelliked)
        self.view.sendSubviewToBack(labelupload)
        self.view.sendSubviewToBack(popularbutton)
        self.view.sendSubviewToBack(twoCellViewButton)
        self.view.sendSubviewToBack(labelupload)
        self.view.sendSubviewToBack(overlayView)
        
    }
    
    
    func addSubviews(){
        self.view.addSubview(overlayView)
        self.view.addSubview(button)
        self.view.addSubview(buttonupload)
        self.view.addSubview(backbutton)
        self.view.addSubview(popularbutton)
        self.view.addSubview(buttonliked)
        self.view.addSubview(twoCellViewButton)
        labelupload.text = "Label 1"
        labelupload.frame = CGRectMake(self.view.frame.width - 185, self.view.frame.height / 1.30 - 5, 80, 20)
        labelupload.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.1)
        labelupload.textColor = UIColor.whiteColor()
        labelupload.textAlignment = .Center
        labelupload.layer.cornerRadius = 5
        labelupload.clipsToBounds = true
        
        labelliked.text = "Label 2"
        labelliked.frame = CGRectMake(self.view.frame.width - 185, self.view.frame.height / 1.30 - 65, 80, 20)
        labelliked.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.1)
        labelliked.textColor = UIColor.whiteColor()
        labelliked.textAlignment = .Center
        labelliked.layer.cornerRadius = 5
        labelliked.clipsToBounds = true
        
        labelTrending.text = "Label 3"
        labelTrending.frame = CGRectMake(self.view.frame.width - 185, self.view.frame.height / 1.30 - 185, 80, 20)
        labelTrending.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.1)
        labelTrending.textColor = UIColor.whiteColor()
        labelTrending.textAlignment = .Center
        labelTrending.layer.cornerRadius = 5
        labelTrending.clipsToBounds = true
        
        labelhome.text = "Label 4"
        labelhome.frame = CGRectMake(self.view.frame.width - 185, self.view.frame.height / 1.30 - 125, 80, 20)
        labelhome.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.1)
        labelhome.textColor = UIColor.whiteColor()
        labelhome.textAlignment = .Center
        labelhome.layer.cornerRadius = 5
        labelhome.clipsToBounds = true
        
        self.view.addSubview(labelhome)
        self.view.addSubview(labelTrending)
        self.view.addSubview(labelliked)
        self.view.addSubview(labelupload)
        
        
    }



}

