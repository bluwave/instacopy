//
//  FeedViewController.swift
//  instacopy
//
//  Created by Garrett Richards on 10/21/15.
//  Copyright © 2015 Acme. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

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
        tableView.registerClass(FeedTableViewCell.classForCoder, "cell")
    }

    //  MARK: - View Interface

    func showPosts(posts: [FeedPostModel]) {
        self.posts = posts
        tableView.reloadData()
    }

    //  MARK: - tableview

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.posts.count
    }


    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell",indexpath) as FeedTableViewCell
//        cell.imageView = posts[indexPath.row].standardResolutionImageURL
    }
}
