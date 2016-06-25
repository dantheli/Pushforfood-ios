//
//  FiltersViewController.swift
//  FoodFight
//
//  Created by Daniel Li on 6/25/16.
//  Copyright © 2016 MEDJI. All rights reserved.
//

import UIKit
import TextFieldEffects
import SocketIOClientSwift

class FiltersViewController: UIViewController {

    @IBOutlet weak var firstField: HoshiTextField!
    @IBAction func firstFieldChanged(sender: HoshiTextField) {
        view.bringSubviewToFront(tableView)
        view.bringSubviewToFront(firstField)
        if sender.text?.isEmpty ?? true {
            tableView.fadeHide()
            currentResponder = .None
        } else {
            query(sender.text!)
            tableView.fadeShow()
            tableView.frame = CGRect(x: sender.frame.origin.x, y: sender.frame.maxY - 4.0, width: sender.frame.width, height: 220.0)
            currentResponder = .First
        }
    }
    @IBOutlet weak var secondField: HoshiTextField!
    @IBAction func secondFieldChanged(sender: HoshiTextField) {
//        results = ["Hawaiian", "Handicap Parking", "Halal"]
        tableView.reloadData()
        view.bringSubviewToFront(tableView)
        view.bringSubviewToFront(secondField)
        if sender.text?.isEmpty ?? true {
            tableView.fadeHide()
            currentResponder = .None
        } else {
            query(sender.text!)
            tableView.fadeShow()
            tableView.frame = CGRect(x: sender.frame.origin.x, y: sender.frame.maxY - 4.0, width: sender.frame.width, height: 220.0)
            currentResponder = .Second
        }
    }
    
    @IBOutlet weak var goButton: UIButton!
    @IBAction func goButtonPressed(sender: UIButton) {
        navigationController?.pushViewController(storyboard!.instantiateViewControllerWithIdentifier("PrepareGameViewController"), animated: true)
    }
    
    var socket: SocketIOClient!
    
    var tableView: UITableView!
    var results: [String] = []
    
    enum Responder {
        case None
        case First
        case Second
    }
    
    var currentResponder: Responder = .None
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setTheme()
        
        firstField.delegate = self
        secondField.delegate = self
        
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
        socket = SocketIOClient(socketURL: NSURL(string: URL)!, options: [.Nsp("/main")])
        socket.on("query-results") { event in
            if let array = event.0.first as? [String] {
                dispatch_async(dispatch_get_main_queue()) {
                    self.results = array
                    self.tableView.reloadData()
                }
            }
        }
        socket.connect()
        
        setupTableView()
    }
    
    func query(query: String) {
        socket.emit("query", query)
    }
    
    func setupTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "ResultCell")
        
        tableView.alpha = 0.0
        
        tableView.backgroundColor = UIColor(white: 1.0, alpha: 0.7)
        
        tableView.contentInset = UIEdgeInsets(top: 8.0, left: 0.0, bottom: 0.0, right: 0.0)
        tableView.tableFooterView = UIView()
        tableView.layer.borderColor = UIColor.lightGrayColor().CGColor
        tableView.layer.cornerRadius = 4.0
        tableView.layer.borderWidth = 0.5
        
        tableView.separatorInset = UIEdgeInsetsZero
        
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
        cell.textLabel?.textColor = UIColor.foodOrange()
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
