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

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        if let eventHandler = eventHandler {
            eventHandler.viewWillAppear()
        }

    }

    //  MARK: - Configuration

    func configureTableView() {
        tableView.registerNib(UINib(nibName: "FeedTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }

    //  MARK: - View Interface

    func showPosts(posts: [FeedPostModel]) {
        self.posts = posts
        tableView.reloadData()
    }

    //  MARK: - tableview
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return self.view.bounds.size.width + 60
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.posts.count
    }


    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! FeedTableViewCell

        cell.update(posts[indexPath.row])

        return cell
    }
}
