//
//  FriendTableViewCell.swift
//  DSTV Chat
//
//  Created by Bianca Minnaar on 2016/10/14.
//  Copyright © 2016 BonsaiSoft. All rights reserved.
//

import UIKit

class FriendTableViewCell: UITableViewCell {
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var cellLastSeenLabel: UILabel!
    @IBOutlet weak var cellAliasLabel: UILabel!
    @IBOutlet weak var cellLastSeenValueLabel: UILabel!
    @IBOutlet weak var showDetailButton: UIButton!
    var index:Int!
    var myClosure: ((Int) -> Void)!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setImageURL(withURLString: String?) {
        
        if let checkedUrl = URL(string: withURLString!) {
            cellImageView.contentMode = .scaleAspectFit
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
                self.cellImageView.image = UIImage(data: data)
            }
        }
    }
    
    @IBAction func showDetailsAction(_ sender: AnyObject) {
         self.myClosure(index)
    }
}
