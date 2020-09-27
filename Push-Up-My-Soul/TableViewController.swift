//
//  TableViewController.swift
//  Push-Up-My-Soul
//
//  Created by 加藤太一 on 2020/09/25.
//  Copyright © 2020 taichi. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var arrayBox:[String] = []
    var appendDate:[String] = []
    
    
    //    両方入る配列がわからん↑
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if UserDefaults.standard.object(forKey: "array")  != nil{
            arrayBox = UserDefaults.standard.object(forKey: "array") as! [String]
            
        }
        
        
        return arrayBox.count
        
        
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if UserDefaults.standard.object(forKey: "array")  != nil{
            arrayBox = UserDefaults.standard.object(forKey: "array") as! [String]
            
        }
        
        if UserDefaults.standard.object(forKey: "date") != nil {
            appendDate = UserDefaults.standard.object(forKey: "date") as! [String]
            
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for:indexPath)
        
        let appendDateLabel = cell.viewWithTag(1) as! UILabel
        appendDateLabel.text = appendDate[indexPath.row]
        
        //        print(appendDate2)
        let arrayBoxLabel = cell.viewWithTag(2) as! UILabel
        arrayBoxLabel.text = arrayBox[indexPath.row]
        //        print(arrayBox)
        
        
        return cell
    }
    
    //    削除機能
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if UserDefaults.standard.object(forKey: "array")  != nil{
            arrayBox = UserDefaults.standard.object(forKey: "array") as! [String]
            
        }
        
        if UserDefaults.standard.object(forKey: "date") != nil {
            appendDate = UserDefaults.standard.object(forKey: "date") as! [String]
            
        }
        
        if editingStyle == .delete{
            
            arrayBox.remove(at: indexPath.row)
            appendDate.remove(at: indexPath.row)
            
            
            UserDefaults.standard.set(arrayBox, forKey: "array")
            UserDefaults.standard.set(appendDate, forKey: "date")
            
            
            tableView.reloadData()
            
        }

        
        
        
    }

    @IBAction func backButton(_ sender: UIBarButtonItem) {
        
        dismiss(animated: true, completion: nil)
        
    }
    




}
