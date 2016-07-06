//
//  ViewController.m
//  DrawLine
//
//  Created by Howe on 16/7/6.
//  Copyright © 2016年 Howe. All rights reserved.
//

#import "ViewController.h"
#import "HWReadStatisticalView.h"
#import "Masonry.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    HWReadStatisticalView *readStatisticalView = HWReadStatisticalView.new;
    [self.view addSubview:readStatisticalView];
    __weak __typeof(self) weakSelf = self;
    [readStatisticalView mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.left.right.equalTo(weakSelf.view);
         make.top.mas_equalTo(100.0f);
         make.height.mas_equalTo(200.0f);
     }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
