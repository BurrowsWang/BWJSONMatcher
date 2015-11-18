//
//  MainViewController.m
//  BWJSONMatcher Demo
//
//  Created by wangruicheng on 11/17/15.
//  Copyright © 2015 Burrows.Wang. All rights reserved.
//

#import "MainViewController.h"
#import "FacebookPageInfo.h"

#import "NSObject+BWJSONMatcher.h"

@interface MainViewController ()

@property (nonatomic, weak) IBOutlet UILabel            *aboutLabel;
@property (nonatomic, weak) IBOutlet UILabel            *locationLabel;
@property (nonatomic, weak) IBOutlet UISwitch           *parkingLotSwitch;
@property (nonatomic, weak) IBOutlet UILabel            *emailsLabel;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    FacebookPageInfo *pageInfo = [self loadFacebookPageFromNetwork];
    
    self.aboutLabel.text = pageInfo.about;
    self.locationLabel.text = [NSString stringWithFormat:@"%@\n%@\n%@",
                               pageInfo.location.street,
                               pageInfo.location.city,
                               pageInfo.location.zip];
    self.parkingLotSwitch.on = pageInfo.parking.lot;
    
    NSMutableString *emails  = [[NSMutableString alloc] init];
    for (NSString *emailAddress in pageInfo.emails) {
        [emails appendFormat:@"%@\n", emailAddress];
    }
    self.emailsLabel.text = emails;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (FacebookPageInfo *)loadFacebookPageFromNetwork {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"FacebookPage" ofType:@"json"];
    NSString *jsonString = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    
    return [FacebookPageInfo fromJSONString:jsonString];
}

@end
