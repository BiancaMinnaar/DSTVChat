//
//  FriendDetailSeque.swift
//  DSTV Chat
//
//  Created by Bianca Minnaar on 2016/10/13.
//  Copyright © 2016 BonsaiSoft. All rights reserved.
//

import UIKit

class FriendDetailSeque: UIStoryboardSegue {
    override func perform() {
        let firstVCView = self.source.view as UIView!
        let secondVCView = self.destination.view as UIView!
        
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        
        secondVCView?.frame = CGRect(x: 0.0, y: screenHeight, width: screenWidth, height: screenHeight)
        
        let window = UIApplication.shared.keyWindow
        window?.insertSubview(secondVCView!, aboveSubview: firstVCView!)
        
        UIView.animate(withDuration: 0.4, animations: {
            firstVCView?.frame = firstVCView!.frame.offsetBy(dx: 0.0, dy: -screenHeight)
            secondVCView?.frame = secondVCView!.frame.offsetBy(dx: 0.0, dy: -screenHeight)
        }) { (Bool) in
            self.source.navigationController?.pushViewController(self.destination, animated: false)
//            [[self.sourceViewController navigationController] pushViewController:[self destinationViewController] animated:NO];
        }    }

}
