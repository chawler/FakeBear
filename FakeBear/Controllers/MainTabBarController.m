//
//  MainTabBarController.m
//  FakeBear
//
//  Created by 郑先生 on 16/1/7.
//  Copyright © 2016年 郑先生. All rights reserved.
//

#import "MainTabBarController.h"
#import "MyBooksController.h"
#import "FitnessController.h"
#import "FriendshipController.h"
#import "ProfileController.h"

#define NavCtrl(vCtrl) [[UINavigationController alloc] initWithRootViewController:vCtrl]

@interface MainTabBarController ()

@end

@implementation MainTabBarController
{
    NSArray *titles;
    NSArray *icons;
    NSArray *actionIcons;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    titles = @[@"我的预约", @"开始健身", @"小熊圈", @"个人中心"];
    icons = @[@"mybooks_icon", @"fitness_icon", @"friendship_icon", @"profile_icon"];
    actionIcons = @[@"mybooks_action_icon", @"fitness_action_icon", @"friendship_action_icon", @"profile_action_icon"];
    
    MyBooksController *myBooksController = [[MyBooksController alloc] init];
    FitnessController *fitnessController = [[FitnessController alloc] init];
    FriendshipController *friendshipController = [[FriendshipController alloc] init];
    ProfileController *profileController = [[ProfileController alloc] init];
    self.viewControllers = @[NavCtrl(myBooksController), NavCtrl(fitnessController), NavCtrl(friendshipController), NavCtrl(profileController)];
    
    for (int i=0; i<titles.count; i++) {
        UITabBarItem *tabBarItem1 = [self.tabBar.items objectAtIndex:i];
        tabBarItem1.image = [[UIImage imageNamed:icons[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        tabBarItem1.selectedImage = [[UIImage imageNamed:actionIcons[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        tabBarItem1.title = titles[i];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
