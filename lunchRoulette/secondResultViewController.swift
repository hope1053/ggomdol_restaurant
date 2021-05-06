//
//  secondResultViewController.swift
//  lunchRoulette
//
//  Created by 최혜린 on 2021/04/12.
//

import UIKit

class secondResultViewController: UIViewController {

    @IBOutlet var resultView: UIView!
    @IBOutlet weak var foodResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.foodResult.text = custom_menus.randomElement()
        prepareAnimation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        resultAnimation()
    }
    
    @IBAction func shareButtonTapped(_ sender: Any) {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: resultView.bounds.width, height: resultView.bounds.height))
        let renderImage = renderer.image {_ in
            resultView.drawHierarchy(in: resultView.bounds, afterScreenUpdates: true)
        }
        guard let imageData = renderImage.pngData() else {return}

        let activityVC = UIActivityViewController(activityItems: [imageData], applicationActivities: nil)
        activityVC.excludedActivityTypes = [.saveToCameraRoll]
        activityVC.popoverPresentationController?.sourceView = self.view
        
        self.present(activityVC, animated: true, completion: nil)
    }
    
    @IBAction func dismissButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    private func prepareAnimation() {
        foodResult.transform = CGAffineTransform(translationX: 0, y: -resultView.bounds.height)
        foodResult.alpha = 0
    }
    
    private func resultAnimation() {
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 2, options: .allowUserInteraction, animations: {
            self.foodResult.transform = CGAffineTransform.identity
            self.foodResult.alpha = 1
        }, completion: nil)
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
