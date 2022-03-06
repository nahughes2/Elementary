//
//  ViewController.swift
//  Elementary!
//
//  Created by Nathan Hughes on 3/5/22.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Outlets
    @IBOutlet weak var periodicTable: UITableView!
    @IBOutlet weak var cellButton: UIButton!
    
    var elementList: [Element]?
    var currentDate = Date()
    var loadingView = UIView()
    
    // MARK: - Life Cycle Methods
    override func viewWillAppear(_ animated: Bool) {
        addLoadingView()
        periodicTable.delegate = self
        periodicTable.dataSource = self
        
        self.loadingView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        self.loadingView.backgroundColor = .white
        
        async {
            try elementList = await NetworkManager().fetchData()
            self.periodicTable.reloadData()
            removeLoadingView()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        periodicTable.reloadData()
    }
    
    // MARK: - View Management
    func addLoadingView() {
        self.view.addSubview(self.loadingView)
    }
    
    func removeLoadingView() {
        self.loadingView.removeFromSuperview()
    }
    
    // MARK: - Table View Functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let elementList = self.elementList {
            return elementList.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "elementCellType", for: indexPath) as? ElementCell
        if let elementList = self.elementList {
            cell?.elementNameLabel.text = elementList[indexPath.row].name
            cell?.atomicNumberLabel.text = elementList[indexPath.row].atomicNumber
        }
        
        if let elementCell = cell {
            return elementCell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var newViewController: SecondaryViewController
        newViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondaryViewController
        if let elements = self.elementList {
            newViewController.element = elements[indexPath.row]
        }
        self.present(newViewController, animated: true)
        }
}


