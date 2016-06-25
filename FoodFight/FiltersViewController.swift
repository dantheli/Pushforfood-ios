//
//  FiltersViewController.swift
//  FoodFight
//
//  Created by Daniel Li on 6/25/16.
//  Copyright © 2016 MEDJI. All rights reserved.
//

import UIKit
import TextFieldEffects

class FiltersViewController: UIViewController {

    @IBOutlet weak var firstField: HoshiTextField!
    @IBAction func firstFieldChanged(sender: HoshiTextField) {
        tableView.frame = CGRect(x: sender.frame.origin.x, y: sender.frame.maxY, width: sender.frame.width, height: sender.frame.height)
        currentResponder = .First
    }
    @IBOutlet weak var secondField: HoshiTextField!
    @IBAction func secondFieldChanged(sender: HoshiTextField) {
        tableView.frame = CGRect(x: sender.frame.origin.x, y: sender.frame.maxY, width: sender.frame.width, height: sender.frame.height)
        currentResponder = .Second
    }
    
    
    
    var tableView: UITableView!
    var results: [String] = ["Food", "Japanese"]
    
    enum Responder {
        case None
        case First
        case Second
    }
    
    var currentResponder: Responder = .None
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstField.delegate = self
        secondField.delegate = self
        
        setupTableView()
    }
    
    func setupTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "ResultCell")
        
        tableView.alpha = 0.0
        
        tableView.backgroundColor = UIColor(white: 1.0, alpha: 0.7)
        
        view.addSubview(tableView)
    }
    
}

extension FiltersViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ResultCell", forIndexPath: indexPath)
        cell.textLabel?.text = results[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let filter = results[indexPath.row]
        switch currentResponder {
        case .First:
            firstField.text = filter
            break
        case .Second:
            secondField.text = filter
            break
        case .None:
            break
        }
        tableView.fadeHide()
        currentResponder = .None
    }
}

extension FiltersViewController: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        tableView.fadeHide()
        currentResponder = .None
        view.endEditing(true)
        return true
    }
}
