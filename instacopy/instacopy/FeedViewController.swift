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

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        if let eventHandler = eventHandler {
            eventHandler.viewWillAppear()
        }
    }

    //  MARK: - Configuration

    func configureRefreshControl() {
        let refreshControl = UIRefreshControl()
        refreshControl.backgroundColor = UIColor(white: 0.9, alpha: 0.9)
        refreshControl.tintColor = UIColor.blackColor()
        refreshControl.addTarget(self, action: Selector("actionRefresh:"), forControlEvents: UIControlEvents.ValueChanged)
        self.tableView.addSubview(refreshControl)
        self.refreshControl = refreshControl
    }

    //  MARK: - Actions
    func actionRefresh(sender: AnyObject?) {
        if let eventHandler = self.eventHandler {
            eventHandler.refresh()
        }
    }

    func configureTableView() {
        tableView.registerNib(UINib(nibName: "FeedTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }

    //  MARK: - View Interface

    func showPosts(posts: [FeedPostModel]) {
        self.posts = posts
        tableView.reloadData()
        if let refreshControl = self.refreshControl {
            refreshControl.endRefreshing()
        }
    }

    //  MARK: - tableview

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return FeedTableViewCell.measuredHeightOfCell(posts[indexPath.row], imageHeight: self.view.bounds.size.width, maxWidth: maxCellWidth())
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.posts.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! FeedTableViewCell

        let model = posts[indexPath.row]
        cell.update(model, maxWidth: maxCellWidth())

        return cell
    }
    
    //  MARK: - Helpers
    func maxCellWidth() -> CGFloat {
        let margin = FeedTableViewCell.marginSize() * 2
        return self.view.bounds.width - margin
    }
}
