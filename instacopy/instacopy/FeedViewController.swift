//
//  FeedViewController.swift
//  instacopy
//
//  Created by Garrett Richards on 10/21/15.
//  Copyright © 2015 Acme. All rights reserved.
//

import UIKit
import SDWebImage

class FeedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, FeedViewInterface {

    var eventHandler: FeedModule?
    var posts = [FeedPostModel]()
    var refreshControl: UIRefreshControl?

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureRefreshControl()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if let eventHandler = eventHandler {
            eventHandler.viewWillAppear()
        }
    }

    //  MARK: - Configuration

    func configureRefreshControl() {
        let refreshControl = UIRefreshControl()
        refreshControl.backgroundColor = UIColor(white: 0.9, alpha: 0.9)
        refreshControl.tintColor = UIColor.black
        refreshControl.addTarget(self, action: #selector(FeedViewController.actionRefresh(_:)), for: UIControlEvents.valueChanged)
        self.tableView.addSubview(refreshControl)
        self.refreshControl = refreshControl
    }

    //  MARK: - Actions
    func actionRefresh(_ sender: AnyObject?) {
        if let eventHandler = self.eventHandler {
            eventHandler.refresh()
        }
    }

    func configureTableView() {
        tableView.register(UINib(nibName: "FeedTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }

    //  MARK: - View Interface

    func showPosts(_ posts: [FeedPostModel]) {
        self.posts = posts
        tableView.reloadData()
        if let refreshControl = self.refreshControl {
            refreshControl.endRefreshing()
        }
    }

    //  MARK: - tableview

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return FeedTableViewCell.measuredHeightOfCell(posts[(indexPath as NSIndexPath).row], imageHeight: self.view.bounds.size.width, maxWidth: maxCellWidth())
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FeedTableViewCell

        let model = posts[(indexPath as NSIndexPath).row]
        cell.update(model, maxWidth: maxCellWidth())

        return cell
    }
    
    //  MARK: - Helpers
    func maxCellWidth() -> CGFloat {
        let margin = FeedTableViewCell.marginSize() * 2
        return self.view.bounds.width - margin
    }
}
