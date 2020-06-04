//
//  TodayViewController.m
//  TodayExtension
//
//  Created by Shane on 2020/6/4.
//  Copyright © 2020 Shane. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController () <NCWidgetProviding>

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    // 能否展开，Compact不可展，Expanded可展
    self.extensionContext.widgetLargestAvailableDisplayMode = NCWidgetDisplayModeExpanded;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (IBAction)clickSkipButton:(UIButton *)sender {
    NSURL *url = [NSURL URLWithString:@"MainApp://appid=123"];
    [self.extensionContext openURL:url completionHandler:nil];
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

- (void)widgetActiveDisplayModeDidChange:(NCWidgetDisplayMode)activeDisplayMode withMaximumSize:(CGSize)maxSize __API_AVAILABLE(ios(10.0)) {
    // 更新frame
    self.preferredContentSize = maxSize;
    
    [self getDataByUserDefault];
    [self getDataByFileManager];
}

#pragma mark - Get data
- (void)getDataByUserDefault {
    NSUserDefaults *userDefault = [[NSUserDefaults alloc] initWithSuiteName:@"group.screenshotTest"];
    NSArray *arrData = [userDefault objectForKey:@"data"];
    NSLog(@"--------------- %@", arrData);
}

- (void)getDataByFileManager {
    NSURL *groupURL = [[NSFileManager defaultManager] containerURLForSecurityApplicationGroupIdentifier:@"group.screenshotTest"];
    NSURL *fileURL = [groupURL URLByAppendingPathComponent:@"test.txt"];
    [@"abc" writeToURL:fileURL atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
    NSString *str = [NSString stringWithContentsOfURL:fileURL encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"-------- %@", str);
}

@end
