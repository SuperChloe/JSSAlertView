//
//  DetailViewController.swift
//  JSSAlertViewMasterDetail
//
//  Created by Jay Stakelon on 7/31/15.
//  Copyright (c) 2015 Jay Stakelon. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!


    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail: AnyObject = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.description
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func basicAlertButtonPress() {
        JSSAlertView().show(self, title: "Boring and basic, but with a multi-line title")
    }
    
    @IBAction func standardAlertButtonPress() {
        JSSAlertView().show(self, title: "Standard alert", text: "A standard alert with some text looks like this", buttonText: "Yay")
    }
    
    @IBAction func customColorAlertButtonPress() {
        var alertview = JSSAlertView().show(self, title: "Custom color", text: "All of the cool kids have purple alerts these days", buttonText: "Whoa", color: UIColorFromHex(0x9b59b6, alpha: 1))
        alertview.setTextTheme(.Light)
    }
    
    @IBAction func customIconAlertButtonPress() {
        var customIcon = UIImage(named: "lightbulb")
        var alertview = JSSAlertView().show(self, title: "Custom icon", text: "Supply a UIImage as the iconImage for sexy results", buttonText: "Yes", color: UIColorFromHex(0x9b59b6, alpha: 1), iconImage: customIcon)
        alertview.setTextTheme(.Light)
    }
    
    @IBAction func customFontsAlertButtonPress() {
        var alertview = JSSAlertView().show(self, title: "Check it out", text: "This alert is using a custom font: Clear Sans to be specific")
        alertview.setTitleFont("ClearSans-Light")
        alertview.setTextFont("ClearSans")
        alertview.setButtonFont("ClearSans-Bold")
    }
    
    @IBAction func infoAlertButtonPress() {
        JSSAlertView().info(self, title: "Heads up!", text: "This is the built-in .info style", buttonText: "Aight then")
    }
    
    @IBAction func successAlertButtonPress() {
        JSSAlertView().success(self, title: "Great success", text: "This is the built-in .success style")
    }
    
    @IBAction func warningAlertButtonPress() {
        JSSAlertView().warning(self, title: "Take warning", text: "This is the built-in .warning style")
    }
    
    @IBAction func dangerAlertButtonPress() {
        JSSAlertView().danger(self, title: "Oh, shit.", text: "This is the built-in .danger style")
    }
    
    
    @IBAction func twoButtonAlertPress() {
        var alertview = JSSAlertView().show(self, title: "Standard alert", text: "A standard alert with some text looks like this", buttonText: "Yep", cancelButtonText: "Nope")
        alertview.addAction(closeCallback)
        alertview.addCancelAction(cancelCallback)
    }
    
    @IBAction func kitchenSinkAlertViewButtonPress() {
        var customIcon = UIImage(named: "lightbulb")
        var alertview = JSSAlertView().show(self, title: "Kitchen sink", text: "Here's a modal alert with descriptive text, an icon, custom fonts and a custom color", buttonText: "Sweet", color: UIColorFromHex(0xE0107A, alpha: 1), iconImage: customIcon)
        alertview.addAction(closeCallback)
        alertview.setTitleFont("ClearSans-Bold")
        alertview.setTextFont("ClearSans")
        alertview.setButtonFont("ClearSans-Light")
        alertview.setTextTheme(.Light)
    }
    
    func closeCallback() {
        println("Close callback called")
    }
    
    func cancelCallback() {
        println("Cancel callback called")
    }


}

