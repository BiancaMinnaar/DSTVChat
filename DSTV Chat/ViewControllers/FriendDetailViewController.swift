//
//  FriendDetailViewController.swift
//  DSTV Chat
//
//  Created by Bianca Minnaar on 2016/10/13.
//  Copyright © 2016 BonsaiSoft. All rights reserved.
//

import UIKit

class FriendDetailViewController: UIViewController {

    @IBOutlet weak var firstNameValueLabel: UILabel!
    @IBOutlet weak var lastNameValueLabel: UILabel!
    @IBOutlet weak var aliasValueLabel: UILabel!
    @IBOutlet weak var dateOfBirthValueLabel: UILabel!
    @IBOutlet weak var statusValueLabel: UILabel!
    @IBOutlet weak var lastSeenLabel: UILabel!
    @IBOutlet weak var lastSeenValueLabel: UILabel!
    @IBOutlet weak var pictureImageView: UIImageView!
    
    
    var selectedFriend: FriendResult!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setImageURL(withURLString: selectedFriend.ImageURL)
        firstNameValueLabel.text = selectedFriend.FirstName!
        lastNameValueLabel.text = selectedFriend.LastName!
        aliasValueLabel.text = selectedFriend.Alias!
        dateOfBirthValueLabel.text = selectedFriend.DateOfBirth!
        statusValueLabel.text = selectedFriend.Status
        if (selectedFriend.Status! == "Offline") {
            lastNameValueLabel.text = selectedFriend.LastSeen
        } else {
            lastSeenLabel.isHidden = true
            lastSeenValueLabel.isHidden = true
        }
    }

    func setImageURL(withURLString: String?) {
        
        if let checkedUrl = URL(string: withURLString!) {
            pictureImageView.contentMode = .scaleAspectFit
            downloadImage(url: checkedUrl)
        }
    }
    
    
    func getDataFromUrl(url: URL, completion: @escaping (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> Void) {
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            completion(data, response, error)
            }.resume()
    }
    
    func downloadImage(url: URL) {
        print("Download Started")
        getDataFromUrl(url: url) { (data, response, error)  in
            DispatchQueue.main.sync() { () -> Void in
                guard let data = data, error == nil else { return }
                print(response?.suggestedFilename ?? url.lastPathComponent)
                print("Download Finished")
                self.pictureImageView.image = UIImage(data: data)
            }
        }
    }
    @IBAction func closeDetailAction(_ sender: AnyObject) {
        self.performSegue(withIdentifier: "idUnwhideToFriendList", sender: nil)
    }
}
