//
//  ViewController.swift
//  LeftSlideMenu
//
//  Created by dohien on 6/20/18.
//  Copyright © 2018 hiền hihi. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func onClickMenu() {
        NotificationCenter.default.post(name: NotificationKey.menuClick, object: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

struct NotificationKey {
    static let menuClick = NSNotification.Name.init("menuClick")
}
