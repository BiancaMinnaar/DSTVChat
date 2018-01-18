//
//  FriendsTableViewController.swift
//  DSTV Chat
//
//  Created by Bianca Minnaar on 2016/10/13.
//  Copyright © 2016 BonsaiSoft. All rights reserved.
//

import UIKit

class FriendsTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var friendTableView: UITableView!
    
    
    var logedInUser: UserLoginResult!
    var friendList: [FriendResult]!
    var listCount: Int!
    var selectedFriend: FriendResult!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        listCount = 0;
        Networking.GetFriendList(with: logedInUser.Guid, name: logedInUser.FirstName, completion: { (friends) in
            self.listCount = friends.count
            self.friendList = friends
            self.friendTableView.reloadData()
        })
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "FriendTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! FriendTableViewCell
        
        let friend = friendList[indexPath.row];
        
        cell.setImageURL(withURLString: friend.ImageURL)
        cell.cellAliasLabel.text = friend.Alias
        if (friend.Status != "Offline"){
            cell.cellLastSeenValueLabel.text = friend.LastSeen
        } else {
            cell.cellLastSeenLabel.text = friend.Status
            cell.cellLastSeenValueLabel.isHidden = true
        }
        cell.index = indexPath.row
        cell.myClosure = showDetail;
        
        return cell
    }
    
    func showDetail(with index:Int!) -> Void {
        self.selectedFriend = friendList[index]
        self.performSegue(withIdentifier: "idFriendDetialSegue", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "idFriendDetialSegue"){
            let vc = segue.destination as! FriendDetailViewController
            vc.selectedFriend = self.selectedFriend
        }
    }
    
    @IBAction func unwindToFriendList(segue: UIStoryboardSegue) {
    }

}
