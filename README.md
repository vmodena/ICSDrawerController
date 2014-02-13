# ICSDrawerController

ICSDrawerController is a left-side drawer controller for iPhone (iOS 7 or later). 

It has all the features you'd expect from a side drawer controller, plus it's small, easy to read and tailor to your needs.

![demo](http://icecreamstudios.com/opensource/colors-demo.gif)

The controller is designed as a container controller and accepts two child controllers: the left and the center view controllers. The left view controller is intended as a master view controller: it is visible only when the drawer is open and, typically, talks to the drawer in order to update/replace the center view controller. The center view controller is intended as a detail view controller: it is visible when the drawer is closed and typically sends the `open` message to the drawer to reveal the left side controller.
 
## Opening/closing the drawer
ICSDrawerController uses a UIPanGestureRecognizer to open/close the drawer and a UITapGestureRecognizer to close the drawer by tapping anywhere on the visible part of the center view controller.

It is left to your center view controller to provide a button and call `open` on the drawer controller. (From your child controllers you access the drawer controller by adopting the `ICSDrawerControllerChild` protocol and implementing the required `drawer` property.)

## Status bar
You can control the status bar's visibility and style by implementing, in each one of your child controllers, the `prefersStatusBarHidden`  and `preferredStatusBarStyle` methods made available by iOS 7.
 
## Getting notified when the drawer state changes
The drawer controller will notify its child controllers by sending:
 
- the message `drawerControllerWillOpen:` when the drawer is about to open
- the message `drawerControllerDidOpen:` when the drawer has completed the opening phase
- the message `drawerControllerWillClose:` when the drawer is about to close
- the message `drawerControllerDidClose:` when the drawer has completed the closing phase

## Installing
1. Drag the inner ICSDrawerController folder to your Xcode project
2. Adopt in your child controllers the `ICSDrawerControllerChild` protocol and implement its the required `drawer` property
3. Adopt in your child controllers the `ICSDrawerControllerPresenting` protocol
4. Initialize the drawer controller with your left view controller and your initial center view controller:

``` objc
YourLeftViewController *left = [[YourLeftViewController alloc] init];
YourCenterViewController *center = [[YourCenterViewController alloc] init];
ICSDrawerController *drawer = [[ICSDrawerController alloc] initWithLeftViewController:left
                                                                 centerViewController:center];
```

For a concrete example on how to use this controller, have a look at the provided *Colors* project.

## About
ICSDrawerController was built to be used in our app [Remember the Tripod](http://rememberthetripod.icecreamstudios.com), brought to you by Ludovico Rossi and Vito Modena at [ice cream studios](http://icecreamstudios.com) (also developers of [Writings for iPad](http://www.writingsapp.com) and [Stories for iPhone](http://stories.icecreamstudios.com)). You can drop us a line at [opensource@icecreamstudios.com](mailto:opensource@icecreamstudios.com).


## License
ICSDrawerController and the Colors example are made available under the [MIT License](LICENSE).
