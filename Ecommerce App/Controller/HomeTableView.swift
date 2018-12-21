//
//  HomeTableView.swift
//  Ecommerce App
//
//  Created by Mustafa on 21/12/2018.
//  Copyright © 2018 Mustafa. All rights reserved.
//

import UIKit

class HomeTableView: UITableView, UITableViewDelegate, UITableViewDataSource {

    override func awakeFromNib() {
        self.delegate = self
        self.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        
        if row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FeatureCell", for: indexPath) as! FeatureTableViewCell
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoryTableViewCell
            
            return cell
        }
    }

}
