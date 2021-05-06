//
//  ViewController.swift
//  lunchRoulette
//
//  Created by 최혜린 on 2021/04/11.
//

import UIKit

class firstViewController: UIViewController {

    @IBOutlet weak var bestMenuTableView: UITableView!
    @IBOutlet weak var randomButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        bestMenuTableView.layer.masksToBounds = true
        bestMenuTableView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        bestMenuTableView.layer.borderWidth = 4.0
        createHeader()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let randomFood = menus.randomElement()
        self.sendFood = randomFood!
    }
    
    func createHeader(){
        let header = UIView(frame: CGRect(x: 0, y: 0, width: bestMenuTableView.frame.width, height: 80))
        header.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        let headerLabel = UILabel(frame: header.frame)
        headerLabel.text = "Menu"
        headerLabel.textAlignment = .center
        headerLabel.font = UIFont(name: "UhBee Se_hyun", size: 28)
        header.addSubview(headerLabel)
        bestMenuTableView.tableHeaderView = header

        let sepFrame = CGRect(x: (header.frame.width)/8 , y: header.frame.height - 10, width: (header.frame.width)/4 * 3, height: 4)
        let separaotrView = UIView(frame: sepFrame)
        separaotrView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        header.addSubview(separaotrView)
    }
    
    var sendFood: String = ""
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let secondViewController = segue.destination as? resultViewController else {return}
        secondViewController.randomFood = self.sendFood
    }

    @IBAction func randomButtonTapped(_ sender: Any) {
//        UIView.animate(withDuration: 2.0, delay: 0, options: .curveEaseOut, animations: {
//            self.randomButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
//        }, completion: {finished in
//            UIView.animate(withDuration: 2.0) {
//                self.randomButton.transform = CGAffineTransform.identity
//            }
//            self.performSegue(withIdentifier: "resultSegue", sender: nil)
//        })
        self.performSegue(withIdentifier: "resultSegue", sender: nil)
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension firstViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "bestmenucell", for: indexPath) as? bestMenuCell {
            cell.bestMenu.text = menus[indexPath.row]
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    
}

class bestMenuCell: UITableViewCell {
    @IBOutlet weak var bestMenu: UILabel!
    
}

