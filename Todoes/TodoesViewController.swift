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
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }

}

