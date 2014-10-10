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
let kICSColorsViewControllerCellReuseId = "kICSColorsViewControllerCellReuseId"

class ICSColorViewController : UITableViewController, ICSDrawerControllerChild, ICSDrawerControllerPresenting{
    var drawer : ICSDrawerController!
    var colors : [UIColor]!
    var previousRow : NSInteger = -1
    init(colors:[UIColor]!){
        super.init(style: UITableViewStyle.Grouped)
        self.colors = colors
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: kICSColorsViewControllerCellReuseId)
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.colors.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell! = tableView.dequeueReusableCellWithIdentifier(kICSColorsViewControllerCellReuseId) as UITableViewCell
        cell.textLabel?.text = NSString(format: "Color %ld", indexPath.row)
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.backgroundColor = self.colors[indexPath.row]
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if(indexPath.row == self.previousRow){
            self.drawer.close()
        }else{
             var someClosure: () -> Void = {
                [unowned self] in
                // closure body goes here
                self.drawer.centerViewController.view.backgroundColor = self.colors[indexPath.row] as UIColor
            }

            self.drawer.reloadCenterViewControllerUsingBlock(someClosure)
        }
        self.previousRow = indexPath.row
    }
    
    func drawerControllerWillOpen(drawerController: ICSDrawerController!) {
        self.view.userInteractionEnabled = false
    }
    func drawerControllerDidOpen(drawerController: ICSDrawerController!) {
        self.view.userInteractionEnabled = true
    }
    func drawerControllerWillClose(drawerController: ICSDrawerController!) {
        self.view.userInteractionEnabled = false
    }
    func drawerControllerDidClose(drawerController: ICSDrawerController!) {
        self.view.userInteractionEnabled = true
    }
    
}
