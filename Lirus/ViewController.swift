//
//  ViewController.swift
//  Lirus
//
//  Created by Айдар Чакиев on 22/1/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ServiceView {
    
    
    func showLoading() {
        
    }
    
    func hideLoading() {
        
    }
    
    func error(error: String) {
        
    }
    var service : NotificationService!
    
    struct cellData{
        var name = String()
        var text = String()
        var created_date = String()
        
    }
    
    var data: Array<cellData> = []
    var listData: [NotificationData] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        service = NotificationService(delegate: self)

        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.separatorStyle = .none
        self.registerTableCell()
        getNotification()
        
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationCell") as? NotificationCell{
            
            cell.titleLb.text = listData[indexPath.row].name
            cell.textLb.text = listData[indexPath.row].text
            cell.createdDate.text =  listData[indexPath.row].created_date
            
            switch listData[indexPath.row].not_type {
            case "NEWS":
                cell.typeLb.textColor = #colorLiteral(red: 0.5714067817, green: 0.5040003657, blue: 0.4786334038, alpha: 1)
                cell.typeLb.text = "Новости"
                cell.iconType.image = #imageLiteral(resourceName: "news")
                

            case "PROMO":
                cell.iconType.image = #imageLiteral(resourceName: "gift")
            
                
            default:
                cell.iconType.image = #imageLiteral(resourceName: "gift")

            }
            cell.backgroundView?.layer.cornerRadius = 10
            cell.backgroundView?.clipsToBounds = true
            return cell
        
        }
        
        return UITableViewCell()
        
    }
    
    func registerTableCell(){
        let rowCell = UINib(nibName: "NotificationCell", bundle: nil)
        self.tableView.register(rowCell, forCellReuseIdentifier: "NotificationCell")
    }
    
    func getNotification(){
        service.getNotification{
            [self]
            (response) in
            listData.removeAll()
            listData.append(contentsOf: response)
            tableView.reloadData()
            
        }
        
        
    }

}

