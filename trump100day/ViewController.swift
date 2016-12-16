//
//  ViewController.swift
//  trump100day
//
//  Created by yizhan wang on 28/11/16.
//  Copyright © 2016 lambda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var daysTimer: UITextField!
    let clock = Clock()
    
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimeLabel), userInfo: nil, repeats: true)
//        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(updateTimeLabel), name: UIApplicationWillEnterForegroundNotification, object: nil)
    }
    
    override func supportedInterfaceOrientation() -> Int {
        UIInterfaceOrientationMask.All
    }
    
    func updateTimeLabel() {
        let formatter = DateFormatter()
        formatter.timeStyle = .long
        daysTimer.text = formatter.string(from: clock.currentTime as Date)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("vill will appear")
        updateTimeLabel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    deinit {
        timer?.invalidate()
    }
    

}

