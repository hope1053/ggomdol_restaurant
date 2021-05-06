//
//  resultViewController.swift
//  lunchRoulette
//
//  Created by 최혜린 on 2021/04/11.
//

import UIKit

class resultViewController: UIViewController {

    @IBOutlet weak var tryAgainButton: UIRoundButton!
    @IBOutlet weak var eatTogetherLabel: UILabel!
    @IBOutlet weak var foodBear: UIImageView!
    @IBOutlet var resultView: UIView!
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var foodName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        foodName.text = randomFood
        let image : UIImage = UIImage(named:"\(randomFood)")!
        foodImage.image = makeRoundImg(img: UIImageView(image: image))
        prepareAnimation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        firstAnimation()
        secondAnimation()
    }
    
    var randomFood: String = ""
    
    @IBAction func againButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
    
    func makeRoundImg(img: UIImageView) -> UIImage {
        let imgLayer = CALayer()
        imgLayer.frame = img.bounds
        imgLayer.contents = img.image?.cgImage;
        imgLayer.masksToBounds = true;

        imgLayer.cornerRadius = img.frame.size.width/2

        UIGraphicsBeginImageContext(img.bounds.size)
        imgLayer.render(in: UIGraphicsGetCurrentContext()!)
        let roundedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return roundedImage!;
    }
    
    private func prepareAnimation() {
        foodName.alpha = 0
        foodImage.alpha = 0
        tryAgainButton.alpha = 0
        foodBear.alpha = 0
        eatTogetherLabel.alpha = 0
        
        foodImage.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
        foodBear.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)

        foodName.transform = CGAffineTransform(translationX: resultView.bounds.width, y: 0)
        tryAgainButton.transform = CGAffineTransform(translationX: resultView.bounds.width, y: 0)
        eatTogetherLabel.transform = CGAffineTransform(translationX: resultView.bounds.width, y: 0)
        
//
//        nameLabel.transform = CGAffineTransform(translationX: view.bounds.width, y: 0).scaledBy(x: 3, y: 3).rotated(by: 180)
//        bountyLabel.transform = CGAffineTransform(translationX: view.bounds.width, y: 0).scaledBy(x: 3, y: 3).rotated(by: 180)
        
    }
    
    private func firstAnimation() {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: {
            self.foodImage.transform = CGAffineTransform.identity
            self.foodBear.transform = CGAffineTransform.identity
            
            self.foodImage.alpha = 1
            self.foodBear.alpha = 1
        }, completion: nil)
    }
    
    private func secondAnimation() {
        UIView.animate(withDuration: 0.5, delay: 0.2, usingSpringWithDamping: 0.6, initialSpringVelocity: 2, options: .allowUserInteraction, animations: {
            self.foodName.alpha = 1
            self.tryAgainButton.alpha = 1
            self.eatTogetherLabel.alpha = 1
            
            self.foodName.transform = CGAffineTransform.identity
            self.tryAgainButton.transform = CGAffineTransform.identity
            self.eatTogetherLabel.transform = CGAffineTransform.identity
        }, completion: nil)
    }
}
