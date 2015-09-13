//
//  PsychologistViewController.swift
//  Psychologist
//
//  Created by Louis Tur on 9/11/15.
//  Copyright (c) 2015 Louis Tur. All rights reserved.
//

import UIKit

class PsychologistViewController: UIViewController {

    @IBAction func nothing(sender: UIButton) {
        performSegueWithIdentifier("nothing", sender: nil)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        // this checks to see if view controller is wrapped in a nav controller
        var destination = segue.destinationViewController as? UIViewController
        if let navCon = destination as? UINavigationController {
            destination = navCon.visibleViewController
        }
        
        if let hvc = destination as? HappinessViewController {
            // note: this will crash since FaceView! is currently nil
            // In preparing for a segue, outlets have not yet been initialized on storyboard
            if let identifier = segue.identifier {
                switch identifier {
                case "sad": hvc.happiness = 0
                case "happy": hvc.happiness = 100
                case "nothing": hvc.happiness = 25
                default: hvc.happiness = 50
                }
            }
        }
    }

}

