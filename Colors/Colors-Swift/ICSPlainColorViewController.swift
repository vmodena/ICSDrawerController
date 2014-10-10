/******************************************************************************
 *
 * TODO: Copyright Template For Github
 *
 * Author: erlgo <erlgo@erlgo.com>
 *
 * The MIT License (MIT)
 *
 * Copyright (c) 2014 erlgo
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
******************************************************************************/

import UIKit

class ICSPlainColorViewController : UIViewController,ICSDrawerControllerChild, ICSDrawerControllerPresenting{
    var drawer : ICSDrawerController!
    var openDrawerButton : UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        var hamburger = UIImage(named: "hamburger")
        
        self.openDrawerButton = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
        self.openDrawerButton.frame = CGRectMake(10.0, 20.0, 44.0, 44.0)
        self.openDrawerButton.setImage(hamburger, forState: UIControlState.Normal)
        self.openDrawerButton.addTarget(self, action: "openDrawer:", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(self.openDrawerButton)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return false
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    func drawerControllerDidOpen(drawerController: ICSDrawerController!) {
        self.view.userInteractionEnabled = false
    }
    
    func drawerControllerDidClose(drawerController: ICSDrawerController!) {
        self.view.userInteractionEnabled = true
    }
    
    func openDrawer(sender:AnyObject?){
        self.drawer.open()
    }
}
