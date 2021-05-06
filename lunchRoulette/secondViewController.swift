//
//  secondViewController.swift
//  lunchRoulette
//
//  Created by 최혜린 on 2021/04/12.
//

import UIKit

class secondViewController: UIViewController {

    @IBOutlet weak var menuTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(self.didDismissaddNotification(_:)), name: NSNotification.Name(rawValue: "DidDismissaddViewController"), object: nil)
        menuTableView.layer.masksToBounds = true
        menuTableView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        menuTableView.layer.borderWidth = 4.0
        
        createHeader()
    }
    
    func createHeader(){
        let header = UIView(frame: CGRect(x: 0, y: 0, width: menuTableView.frame.width, height: 80))
        header.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        let headerLabel = UILabel(frame: header.frame)
        headerLabel.text = "Menu"
        headerLabel.textAlignment = .center
        headerLabel.font = UIFont(name: "UhBee Se_hyun", size: 28)
        header.addSubview(headerLabel)
        menuTableView.tableHeaderView = header

        let sepFrame = CGRect(x: (header.frame.width)/8 , y: header.frame.height - 10, width: (header.frame.width)/4 * 3, height: 4)
        let separaotrView = UIView(frame: sepFrame)
        separaotrView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        header.addSubview(separaotrView)
    }
    
    @IBAction func addMenu(_ sender: Any) {
        self.performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    @IBAction func randomButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "secondResultSegue", sender: nil)
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func didDismissaddNotification(_ noti: Notification) {
            OperationQueue.main.addOperation { // DispatchQueue도 가능.
                self.menuTableView.reloadData()
            }
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

extension secondViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return custom_menus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as? MenuCell {
            cell.wantMenu.text = custom_menus[indexPath.row]
            return cell
        } else {
            return UITableViewCell()
        }
    }
}

class MenuCell: UITableViewCell {
    @IBOutlet weak var wantMenu: UILabel!
}
