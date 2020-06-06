//
//  ChildViewController.swift
//  ChildViewInScrollView
//
//  Created by Ali Tosuner on 6.06.2020.
//  Copyright © 2020 Ali Tosuner. All rights reserved.
//

import UIKit

final class ChildViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var numbers = Array(0...20).map(String.init)
        
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.isScrollEnabled = false
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        preferredContentSize = tableView.contentSize
    }
}

extension ChildViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        numbers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.textLabel?.text = numbers[indexPath.row]
        return cell
    }
}

extension ChildViewController: UITableViewDelegate  {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            numbers.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            preferredContentSize = tableView.contentSize
        }
    }
}
