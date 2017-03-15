//
//  TableViewController.swift
//  Example
//
//  Created by Juan Alberto Uribe on 6/16/16.
//  Copyright © 2016 Kogi Mobile. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTable()
        kr_resizeViewWhenKeyboardAppears = true
    }
    
    fileprivate func configureTable() {
        tableView.dataSource = self
        
        let footerFrame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 50)
        let footerLabel = UILabel(frame: footerFrame)
        footerLabel.text = "FOOTER"
        tableView.tableFooterView = footerLabel
    }
}

extension TableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                               for: indexPath)
        
        return cell
    }
}
