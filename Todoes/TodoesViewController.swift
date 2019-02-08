//
//  ViewController.swift
//  Todoes
//
//  Created by toumalmojumder on 8/2/19.
//  Copyright © 2019 toumalmojumder. All rights reserved.
//

import UIKit

class TodoesViewController: UITableViewController {

    let itemArray = ["find me","buy me","destroy Demon"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    //table view showing array data
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }//
    
    // Table view delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add New Todo Item", message: " ", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default){(action) in
           
        }
        alert.addTextField(configurationHandler: { (textField) in
            textField.placeholder = "Create new Item"
        })
         alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

