import UIKit
import Foundation
import iOSDropDown

class CarListingViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var dropDown: DropDown!
    
    var refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNeedsStatusBarAppearanceUpdate()
        setupTableView()
        setupRefreshControl()
        setupDropdown()
        ListingAppManager.shared.getData { success, error in
            if success {
                
            } else {
                
            }
        }
    }
    
    func setupDropdown() {
        dropDown.optionArray = ["Sort by Name", "Sort By Availability"]
        dropDown.rowHeight = 40
        dropDown.selectedRowColor = UIColor.init(red: 243.0/255.0, green: 243.0/255.0, blue: 243.0/255.0, alpha: 1.0)
        dropDown.didSelect{(selectedText , index ,id) in
            print("Selected String: \(selectedText) \n index: \(index)")
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}

extension CarListingViewController: UITableViewDataSource, UITableViewDelegate {
    
    func setupRefreshControl() {
        refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: UIControl.Event.valueChanged)
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.addSubview(refreshControl)
        tableView.register(UINib(nibName: "ListingTableViewCell", bundle: nil), forCellReuseIdentifier: "ListingCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListingCell", for: indexPath) as? ListingTableViewCell else { return UITableViewCell() }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 240.0
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if (tableView.responds(to: #selector(setter: UITableViewCell.separatorInset))) {
            tableView.separatorInset = .zero
        }
        if (tableView.responds(to: #selector(setter: UIView.layoutMargins))) {
            cell.layoutMargins = .zero
        }
    }
    
    @objc func refresh(sender:AnyObject) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
            self.refreshControl.endRefreshing()
        })
    }
    
}
