//
//  ViewController.m
//  TestForTodayExtension
//
//  Created by Shane on 2020/6/4.
//  Copyright © 2020 Shane. All rights reserved.
//

#import "ViewController.h"

static NSString *groupID = @"group.screenshotTest";

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self saveDataByUserDefaults];
}

- (void)saveDataByUserDefaults {
    NSUserDefaults* userDefault = [[NSUserDefaults alloc] initWithSuiteName:groupID];
    [userDefault setObject:@[@"1", @"2", @"3"] forKey:@"data"];
}

- (void)saveDataByFileManager {
    NSURL *groupURL = [[NSFileManager defaultManager] containerURLForSecurityApplicationGroupIdentifier:groupID];
    NSURL *fileURL = [groupURL URLByAppendingPathComponent:@"test.txt"];
    [@"abc" writeToURL:fileURL atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
//    NSString *str = [NSString stringWithContentsOfURL:fileURL encoding:NSUTF8StringEncoding error:nil];
//    NSLog(@"str = %@", str);
}

@end
