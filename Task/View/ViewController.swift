//
//  ViewController.swift
//  Task
//
//  Created by Harshavardhana Reddy on 08/09/18.
//  Copyright © 2018 Sandeep. All rights reserved.
//

import UIKit
import SVProgressHUD
import SDWebImage

class ViewController: UIViewController {
    var presenter: AboutCanadaPresenter?

    let cellIdentifier = "cellIdentifier"
    var refreshControl = UIRefreshControl()
    var feededData: [News]?
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .singleLine
        tableView.allowsSelection = true
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self,
                                 action: #selector(refreshData),
                                 for: .valueChanged)
        tableView.addSubview(refreshControl)
        refreshData()
    }
    
    func showError(error: String) {
        let alert = UIAlertController(title: "Warring",
                                      message: error,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok",
                                      style: .default,
                                      handler: nil))
        self.present(alert, animated: true)
    }
    
    func updateView(updatedData: NewsFeed) {
        DispatchQueue.main.async {
            self.feededData = updatedData.rows?.filter{$0.deatilDescription != nil || $0.url != nil || $0.title != nil}
            self.title = updatedData.title
            self.tableView.reloadData()
            SVProgressHUD.dismiss()
            self.refreshControl.endRefreshing()
        }
    }
    
    @objc func refreshData() {
        SVProgressHUD.show()
        presenter?.fetchDetailsAboutCanada()
    }

    private func setupTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(customTableViewCell.self,
                           forCellReuseIdentifier: cellIdentifier)
        tableView.estimatedRowHeight = 85
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let numberOfRows = feededData?.count else {
            return 0
        }
        return numberOfRows
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! customTableViewCell
        guard let data = feededData?[indexPath.row] else {
            return cell
        }

        if let title = data.title {
             cell.titleLabel.text = title
        }
        
        if let subTitle = data.deatilDescription {
            cell.subTitleLabel.text = subTitle
        }

        if let imageUrl = data.url {
            cell.pictureImageView.sd_setImage(with: URL(string: imageUrl),
                                              placeholderImage: UIImage(named: "Thumbnail"),
                                              options: .retryFailed,
                                              completed: nil)
        }
        return cell
    }
}
