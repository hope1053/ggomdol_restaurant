//
//  mainPageViewController.swift
//  lunchRoulette
//
//  Created by 최혜린 on 2021/04/12.
//

import UIKit

class mainPageViewController: UIViewController {
    
    @IBOutlet weak var mainBearImage: UIImageView!
    @IBOutlet weak var customMenuButton: UIRoundButton!
    @IBOutlet weak var bestMenuButton: UIRoundButton!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareAnimation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewBearImage()
        viewButton()
    }
    
    private func prepareAnimation() {
        mainBearImage.alpha = 0
        customMenuButton.alpha = 0
        bestMenuButton.alpha = 0
    }
    
    private func viewBearImage(){
        UIView.animate(withDuration: 0.5,delay: 0, animations: {
            self.mainBearImage.alpha = 1
        })
    }
    
    private func viewButton(){
        UIView.animate(withDuration: 0.3, delay: 0.5, animations: {
            self.customMenuButton.alpha = 1
            self.bestMenuButton.alpha = 1
        }, completion: nil)
    }
    
    
    @IBAction func firstButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "firstButtonTapped", sender: nil)
    }
    
    @IBAction func secondButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "secondButtonTapped", sender: nil)
    }
    
    @IBAction func settingButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "settingSegue", sender: nil)
    }
}
