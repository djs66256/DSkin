//
//  DMainViewController.m
//  DSkinDemo
//
//  Created by daniel on 14-3-13.
//  Copyright (c) 2014年 daniel. All rights reserved.
//

#import "DMainViewController.h"
#import "DSystemViewController.h"
#import "DSkin.h"
#import "DBaseSkin.h"

@interface DMainViewController ()

@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation DMainViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.navigationItem.title = @"Skin";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemOrganize target:self action:@selector(setting)];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    self.dataSource = @[@{@"text": @"first",
                          @"class": [DSystemViewController class]},
                        ];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)setting
{
    static BOOL b=NO;
    b=!b;
    [[DSkin defaultSkin] setSkin:[[DBaseSkin alloc] initWithFileName:b?@"night":@"daytime"]];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = self.dataSource[indexPath.row][@"text"];
    UIImageView *bg = [[UIImageView alloc] initWithImage:[[DImage imageForKey:@"qq"] stretchableImageWithLeftCapWidth:50 topCapHeight:50]];
    bg.frame = CGRectMake(0, 0, 320, 44);
    cell.textLabel.backgroundColor = [UIColor clearColor];
    cell.backgroundView = bg;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    Class controllerClass = self.dataSource[indexPath.row][@"class"];
    UIViewController *viewController = [[controllerClass alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}


@end
