//
//  addViewController.swift
//  lunchRoulette
//
//  Created by 최혜린 on 2021/04/12.
//

import UIKit

class addViewController: UIViewController {

    let DidDismissaddViewController: Notification.Name = Notification.Name("DidDismissaddViewController")
    
    @IBOutlet weak var addedMenu: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addMenu(_ sender: Any) {
        if let want_menu = addedMenu.text {
            custom_menus.append(want_menu)
        } else {return}
        NotificationCenter.default.post(name: DidDismissaddViewController, object: nil, userInfo: nil)
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
