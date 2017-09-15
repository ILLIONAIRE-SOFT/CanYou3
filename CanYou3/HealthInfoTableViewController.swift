//
//  HealthInfoTableViewController.swift
//  CanYou3
//
//  Created by Mac Pro on 2017. 9. 16..
//  Copyright © 2017년 Eric.Park. All rights reserved.
//

import UIKit

class HealthInfoTableViewController: BaseTableViewController {
    // MARK : - Properties
    var items: [HealthInfo] {
        guard let fetch = self.dc.fetchHealthInfos() else {
            return [HealthInfo]()
        }
        return fetch
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HealthInfoTableViewCell", for: indexPath) as! HealthInfoTableViewCell
        
        let item = items[indexPath.row]
        
        var percent: Float = Float(dc.currentUser.timeInterval / item.time)
        
        if percent > 1.0 {
            percent = 1.0
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        cell.titleLabel.text = item.name
        cell.progressView.progress = percent
        print(percent)
        
        return cell
    }
    
    
}
