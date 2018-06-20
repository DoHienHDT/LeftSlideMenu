//
//  ContainerVC.swift
//  LeftSlideMenu
//
//  Created by dohien on 6/20/18.
//  Copyright © 2018 hiền hihi. All rights reserved.
//

import UIKit

class ContainerVC: UIViewController {

    @IBOutlet weak var mainViewContainer: UIView!
    @IBOutlet weak var sideMenuViewContainer: UIView!
    @IBOutlet weak var corverButton: UIButton!
    @IBOutlet weak var leftSideMenuContraints: NSLayoutConstraint!
    var isSideMenuOpen: Bool = true {
        didSet{
            if isSideMenuOpen {
                configForSideMenuOpeningState()
            } else {
                configForSideMenuClosingState()
            }
            UIView.animate(withDuration: 0.35, animations: {
                self.view.layoutIfNeeded()
            }) {
                (isSuccess) in
                if self.isSideMenuOpen {
                    
                }else {
                    self.sideMenuViewContainer.clipsToBounds = true
                }
            }
        }
    }
    func configForSideMenuOpeningState() {
        self.sideMenuViewContainer.clipsToBounds = false
        self.leftSideMenuContraints.constant = 0
        self.corverButton.alpha = 0.5
    }
    func configForSideMenuClosingState() {
        self.leftSideMenuContraints.constant = -self.sideMenuViewContainer.bounds.width
        self.corverButton.alpha = 0
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNotification()

        // Do any additional setup after loading the view.
    }
    func registerNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(onClickCorverButton), name: NotificationKey.menuClick, object: nil)
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
  
    @IBAction func onClickCorverButton(_ sender: UIButton) {
        isSideMenuOpen = !isSideMenuOpen
    }
    
}
