//
//  ViewController.swift
//  Todoes
//
//  Created by toumalmojumder on 8/2/19.
//  Copyright © 2019 toumalmojumder. All rights reserved.
//

import UIKit

class TodoesViewController: UITableViewController,UITextFieldDelegate {

    var itemArray = [Item]()
    let defaults = UserDefaults.standard
      let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        
        let newItem = Item()
        newItem.title = "see you"
       // newItem.done = true
        itemArray.append(newItem)
        
        if let items = defaults.array(forKey: "TodoListArray") as? [Item]{
            itemArray = items
        }
    }
    //table view showing array data
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
    }//
    
    // Table view delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
       
        let alertController = UIAlertController(title: "Add New Todo Item", message: "", preferredStyle: .alert)
        
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Create a new Item"
        }
        let saveAction = UIAlertAction(title: "Add Item", style: .default, handler: { alert -> Void in
            
            let firstTextField = alertController.textFields![0] as UITextField
            
            let newItem = Item()
            
            newItem.title = String(firstTextField.text ?? "new Item")
            
            self.itemArray.append(newItem)
            
            //self.defaults.set(self.itemArray, forKey: "TodoListArray")
            let encoder = PropertyListEncoder()
            
            do{
                    let data = try encoder.encode(self.itemArray)
                try data.write(to: self.dataFilePath!)
            }
            catch{
                print("Error encoding item array,\(error)")
            }
        
            
            //self.itemArray.append(firstTextField.text ?? "new Item")
            
            self.tableView.reloadData()
            print(firstTextField.text ?? 0)
           
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: {
            (action : UIAlertAction!) -> Void in })
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
}

