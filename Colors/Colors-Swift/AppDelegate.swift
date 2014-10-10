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

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.backgroundColor = UIColor.blackColor()
        
        var colors :[UIColor] = [
            UIColor(red: 237.0/255.0, green: 237.0/255.0, blue: 137.0/255.0, alpha: 237.0/255.0),
            UIColor(red: 137.0/255.0, green: 237.0/255.0, blue: 237.0/255.0, alpha: 237.0/255.0),
            UIColor(red: 237.0/255.0, green: 137.0/255.0, blue: 237.0/255.0, alpha: 237.0/255.0)
        ]
        
        var colorCV : ICSColorViewController = ICSColorViewController(colors: colors)
        var plainColorCV = ICSPlainColorViewController()
        plainColorCV.view.backgroundColor = colors[0]
        
        var mainDrawer = ICSDrawerController(leftViewController: colorCV, centerViewController: plainColorCV)
        

        window?.rootViewController = mainDrawer
        window?.makeKeyAndVisible()
        return true
    }
}

