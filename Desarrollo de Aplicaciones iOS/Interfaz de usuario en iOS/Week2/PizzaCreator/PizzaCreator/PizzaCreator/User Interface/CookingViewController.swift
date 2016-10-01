//
// Created by Carlos Manzanas on 18/09/16.
// Copyright (c) 2016 Carlos Manzanas. All rights reserved.
//

import UIKit

class CookingViewController: UIViewController {

    @IBAction func onRestartTouch(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}