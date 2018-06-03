//
//  ViewController.swift
//  05-TestTableView
//
//  Created by keep on 2018/6/3.
//  Copyright © 2018年 keep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       tableView.delegate = self
        tableView.dataSource = self 
        
        let cellIdentifier = "myCell"
        
        tableView!.register(UINib(nibName: "TestTableViewCell", bundle:nil), forCellReuseIdentifier: cellIdentifier)
        

    }
    
  
   
   

}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell: TestTableViewCell   = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! TestTableViewCell
        
        return cell
    }
    

    
}

