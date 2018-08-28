//
//  MainVC.swift
//  WhatIf
//
//  Created by Yaroslaw Bagriy on 1/13/16.
//

import UIKit

class MainVC: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    var model = WhatIfModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = "Press the What If button or shake your phone!"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func whatIfTapped(sender: AnyObject) {
        
        let random = Int(arc4random_uniform(UInt32(model.whatIfArray.count)))
        
        label.text = model.whatIfArray[random]
        
        // play sound here
        model.playSound(beep)
        
    }
    
    override func motionBegan(motion: UIEventSubtype, withEvent event: UIEvent?) {
        
        whatIfTapped(UIEvent)
        
    }

}
