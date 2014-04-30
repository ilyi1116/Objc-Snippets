//
//  RLAppDelegate.m
//  UIViews
//
//  Created by RincLiu on 3/9/14.
//  Copyright (c) 2014 Rinc Liu. All rights reserved.
//

#import "RLAppDelegate.h"

@implementation RLAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self createCustomView];
    return YES;
}


// Create custom view with code:
- (void)createCustomView
{
    // Get screen frame:
    CGRect screenFrame = [[UIScreen mainScreen] bounds];
    
    // Init UIWindow:
    self.window = [[UIWindow alloc] initWithFrame:screenFrame];
    self.window.backgroundColor = [UIColor greenColor];
    
    // Init UIViewController and rootview:
    UIViewController *controller = [[UIViewController alloc] init];
    self.window.rootViewController = controller;
    UIView *rootView = [[UIView alloc]initWithFrame:screenFrame];
    controller.view = rootView;
    
    // Use UINavigationBar:
    UINavigationBar *navBar = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, 20, screenFrame.size.width, 45)];
    [navBar setBarStyle:UIBarStyleDefault];
    [navBar setBackgroundColor:[UIColor blueColor]];
    UINavigationItem *navItem = [[UINavigationItem alloc]initWithTitle:@"UIViews' Usage"];
    UIBarButtonItem *bbItemBack = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:self action:@selector(onClickBackNavButton:)];
    [navItem setLeftBarButtonItem:bbItemBack];
    UIBarButtonItem *bbItemSubmit = [[UIBarButtonItem alloc] initWithTitle:@"Submit" style:UIBarButtonItemStyleDone target:self action:@selector(onClickSubmitNavButton:)];
    [navItem setRightBarButtonItem:bbItemSubmit];
    [navBar pushNavigationItem:navItem animated:YES];
    [rootView addSubview:navBar];
    
    // Use UIButton:
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setFrame:CGRectMake(10, 70, 80, 20)];
    [btn setTitle:@"Click Me!" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor whiteColor]];
    [rootView addSubview:btn];
    
    // Bind Touch Events Handler Methods to UIButton:
    [btn addTarget:self action:@selector(onTouchDown:) forControlEvents:UIControlEventTouchDown];
    [btn addTarget:self action:@selector(onTouchUp:) forControlEvents:UIControlEventTouchUpInside];
    
    // Use UIImageView:
    UIImageView *iv=[[UIImageView alloc]initWithFrame:CGRectMake(100, 70, 30, 40)];
    [iv setImage:[UIImage imageNamed:@"avatar1.png"]];
    [rootView addSubview:iv];
    
    // Use UIProgressView:
    UIProgressView *pv = [[UIProgressView alloc] initWithFrame:CGRectMake(10, 100, 80, 20)];
    [pv setProgressViewStyle:UIProgressViewStyleDefault];
    [pv setProgress:0.123456789];
    [rootView addSubview:pv];
    
    // Use UIActivityIndicatorView:
    UIActivityIndicatorView *aiv = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(140, 70, 40, 40)];
    [aiv setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [aiv startAnimating];
    [rootView addSubview:aiv];
    
    // Use UIWebView:
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 120, screenFrame.size.width, 300)];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://RincLiu.com"]]];
    [rootView addSubview:webView];
    
    // Use UITabBar:
    UITabBar *tabBar = [[UITabBar alloc] initWithFrame:CGRectMake(0, screenFrame.size.height-48, screenFrame.size.width, 48)];
    [tabBar setBarStyle:UIBarStyleDefault];
    [tabBar setBackgroundColor:[UIColor blueColor]];
    [tabBar setDelegate:self];
    [tabBar setUserInteractionEnabled:YES];
    NSMutableArray *tabItemArray = [NSMutableArray array];
    [tabItemArray addObject:[[UITabBarItem alloc] initWithTitle:@"Tab0" image:nil tag:0]];
    [tabItemArray addObject:[[UITabBarItem alloc] initWithTitle:@"Tab1" image:nil tag:1]];
    [tabItemArray addObject:[[UITabBarItem alloc] initWithTitle:@"Tab2" image:nil tag:2]];
    [tabBar setItems:tabItemArray];
    [tabBar setSelectedItem:[tabItemArray objectAtIndex:0]];
    [rootView addSubview:tabBar];
    
    // Travel subViews:
    for(UIView *view in [rootView subviews]){
        NSLog(@"SubView: %@", view.description);
    }
    
    // Show UIVindow:
    [self.window makeKeyAndVisible];
}

// Methods in UIAlertViewDelegate Protocol:
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"clickedButtonAtIndex: %d", buttonIndex);
}

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
    NSLog(@"didDismissButtonAtIndex: %d", buttonIndex);
}

-(void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex{
    NSLog(@"willDissmissButtonAtIndex: %d", buttonIndex);
}

// Methods in UIActionSheetDelegate Protocol:
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"clickedButtonAtIndex: %d", buttonIndex);
}

-(void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex{
    NSLog(@"didDissmissButtonAtIndex: %d", buttonIndex);
}

-(void)actionSheet:(UIActionSheet *)actionSheet willDismissWithButtonIndex:(NSInteger)buttonIndex{
    NSLog(@"willDissmissButtonAtIndex: %d", buttonIndex);
}

// Touch Events Handler Methods:
- (IBAction)onTouchDown:(id)sender {
    // Use UIActionSheet:
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"You clicked!" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Yes, I'm sure." otherButtonTitles:@"AAAA",@"BBBB",@"CCCC", nil];
    [actionSheet showInView:_window];
}

- (IBAction)onTouchUp:(id)sender {
    [self showMessage:@"Touch up!"];
}

- (IBAction)onClickBackNavButton:(id)sender {
    [self showMessage:@"Back Navigation Button was clicked!"];
}

- (IBAction)onClickSubmitNavButton:(id)sender {
    [self showMessage:@"Submit Navigation Button was clicked!"];
}

// Use UIAlertView to show Message:
-(void)showMessage:(NSString *)msg{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Oh..." message:msg delegate:self cancelButtonTitle:@"Calcel" otherButtonTitles:@"AAAA",@"BBBB",@"CCCC", nil];
    [alertView show];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
