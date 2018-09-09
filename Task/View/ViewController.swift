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
    var feededData: NewsFeed?
    let tableVIew: UITableView = {
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
        tableVIew.addSubview(refreshControl)
        refreshData()
    }
    
    func showError(error: String) {
        
    }
    
    func updateView(updatedData: NewsFeed) {
        DispatchQueue.main.async { [weak self] in
            self?.feededData = updatedData
            self?.title = updatedData.title
            self?.tableVIew.reloadData()
            SVProgressHUD.dismiss()
            self?.refreshControl.endRefreshing()
        }
    }
    
    @objc func refreshData() {
        SVProgressHUD.show()
        presenter?.fetchDetailsAboutCanada()
    }

    func setupTableView() {
        tableVIew.delegate = self
        tableVIew.dataSource = self
        tableVIew.register(customTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        
        view.addSubview(tableVIew)
        tableVIew.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let listOfItems = feededData?.rows?.count else {
            return 0
        }
        return listOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! customTableViewCell
        guard let data = feededData?.rows else {
            return cell
        }
        //        cell.titleLabel.text = data[indexPath.row].title
        cell.subTitleLabel.text = data[indexPath.row].deatilDescription
        if let imageUrl = data[indexPath.row].url {
            cell.pictureImageView.sd_setImage(with: URL(string: imageUrl),
                                              completed: nil)
            cell.pictureImageView.layer.cornerRadius = 30.0
            cell.pictureImageView.clipsToBounds = true
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
