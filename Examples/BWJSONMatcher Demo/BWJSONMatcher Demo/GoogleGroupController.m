//
//  GoogleGroupController.m
//  BWJSONMatcher Demo
//
//  Created by wangruicheng on 11/18/15.
//  Copyright © 2015 Burrows.Wang. All rights reserved.
//

#import "GoogleGroupController.h"
#import "GoogleGroupInfo.h"

#import "BWJSONMatcher.h"

@interface GoogleGroupController ()

@property (nonatomic, copy) NSArray             *dataSource;

@end

@implementation GoogleGroupController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataSource = [self loadGoogleGroupsFromNetwork];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"GoogleGroupItemCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        cell.textLabel.font = [UIFont systemFontOfSize:17.0f];
        cell.detailTextLabel.font = [UIFont systemFontOfSize:14.0f];
    }
    
    GoogleGroupInfo *groupInfo = self.dataSource[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", groupInfo.firstname, groupInfo.lastname];
    cell.detailTextLabel.text = groupInfo.email;
    
    return cell;
}

#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50.0f;
}

- (NSArray *)loadGoogleGroupsFromNetwork {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"GoogleGroups" ofType:@"json"];
    NSString *jsonString = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    
    NSArray *jsonArray = [BWJSONMatcher matchJSONString:jsonString withClass:[GoogleGroupInfo class]];
    return jsonArray;
}

@end
