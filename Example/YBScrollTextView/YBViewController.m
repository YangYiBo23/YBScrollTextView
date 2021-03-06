//
//  YBViewController.m
//  YBScrollTextView
//
//  Created by yangyibo93@gmail.com on 04/16/2020.
//  Copyright (c) 2020 yangyibo93@gmail.com. All rights reserved.
//

#import "YBViewController.h"
#import <YBScrollTextView.h>

@interface YBViewController ()<YBScrollTextViewDelegate>

@end

@implementation YBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.view.backgroundColor = UIColor.whiteColor;
    
    NSMutableArray *dataSource = [NSMutableArray array];
    
    YBScrollTextModel *model1 = [YBScrollTextModel new];
    model1.text = @"滚动文字滚动文字滚动文字滚动文字1";
    [dataSource addObject:model1];
    
    YBScrollTextModel *model2 = [YBScrollTextModel new];
    model2.text = @"滚动文字2";
    [dataSource addObject:model2];
    
    YBScrollTextModel *model3 = [YBScrollTextModel new];
    model3.text = @"滚动文字滚动文字3";
    [dataSource addObject:model3];

    YBScrollTextModel *model4 = [YBScrollTextModel new];
    model4.text = @"滚动文字滚动文字滚动文字滚动文字滚动文字滚动文字滚动文字4";
    [dataSource addObject:model4];
    
    YBScrollTextView *aView1 = [YBScrollTextView new];
    aView1.frame = CGRectMake(15, 120, self.view.frame.size.width - 30, 30);
    aView1.backgroundColor = UIColor.redColor;
    aView1.dataSource = dataSource;
    aView1.scrollDirection = YBScrollDirectionTop;
    aView1.edgeInsets = UIEdgeInsetsMake(0, 15, 0, 15);
    aView1.layer.cornerRadius = 5;
    aView1.tag = 10001;
    [aView1 setClickedItemCallBack:^(YBScrollTextView * _Nonnull scrollTextView, __kindof YBScrollTextModel * _Nonnull model) {
        NSLog(@"%@", model.text);
    }];
    [aView1 starScrollText];
    [self.view addSubview:aView1];
    
    YBScrollTextView *aView2 = [YBScrollTextView new];
    aView2.frame = CGRectMake(15, CGRectGetMaxY(aView1.frame) + 40, self.view.frame.size.width - 30, 30);
    aView2.backgroundColor = UIColor.redColor;
    aView2.dataSource = dataSource;
    aView2.scrollDirection = YBScrollDirectionBottom;
    aView2.edgeInsets = UIEdgeInsetsMake(0, 15, 0, 15);
    aView2.layer.cornerRadius = 5;
    aView2.tag = 10002;
    [aView2 setClickedItemCallBack:^(YBScrollTextView * _Nonnull scrollTextView, __kindof YBScrollTextModel * _Nonnull model) {
        NSLog(@"%@", model.text);
    }];
    [aView2 starScrollText];
    [self.view addSubview:aView2];
    
    YBScrollTextView *aView3 = [YBScrollTextView new];
    aView3.frame = CGRectMake(15, CGRectGetMaxY(aView2.frame) + 40, self.view.frame.size.width - 30, 30);
    aView3.backgroundColor = UIColor.redColor;
    aView3.dataSource = dataSource;
    aView3.scrollDirection = YBScrollDirectionLeft;
    aView3.edgeInsets = UIEdgeInsetsMake(0, 15, 0, 15);
    aView3.layer.cornerRadius = 5;
    aView3.tag = 10003;
    [aView3 setClickedItemCallBack:^(YBScrollTextView * _Nonnull scrollTextView, __kindof YBScrollTextModel * _Nonnull model) {
        NSLog(@"%@", model.text);
    }];
    [aView3 starScrollText];
    aView3.margin = 20;
    [self.view addSubview:aView3];
    
    YBScrollTextView *aView4 = [YBScrollTextView new];
    aView4.frame = CGRectMake(15, CGRectGetMaxY(aView3.frame) + 40, self.view.frame.size.width - 30, 30);
    aView4.backgroundColor = UIColor.redColor;
    aView4.dataSource = dataSource;
    aView4.scrollDirection = YBScrollDirectionRight;
    aView4.edgeInsets = UIEdgeInsetsMake(0, 15, 0, 15);
    aView4.layer.cornerRadius = 5;
    aView4.tag = 10004;
    [aView4 setClickedItemCallBack:^(YBScrollTextView * _Nonnull scrollTextView, __kindof YBScrollTextModel * _Nonnull model) {
        NSLog(@"%@", model.text);
    }];
    aView4.margin = 20;
    [aView4 starScrollText];
    [self.view addSubview:aView4];
    
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(aView4.frame) + 50, self.view.bounds.size.width - 30, 20)];
    [slider addTarget:self action:@selector(onSlider:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
}

- (void)onSlider:(UISlider *)slider {
    CGFloat speed = slider.value / 100.0;
    YBScrollTextView *aView1 = [self.view viewWithTag:10001];
    YBScrollTextView *aView2 = [self.view viewWithTag:10002];
    YBScrollTextView *aView3 = [self.view viewWithTag:10003];
    YBScrollTextView *aView4 = [self.view viewWithTag:10004];
    YBScrollTextView *aView5 = [self.view viewWithTag:10005];
    aView1.speed_v = aView2.speed_v = slider.value * 3.0;
    aView3.speed_h = aView4.speed_h = aView5.speed_h = speed;
}







- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
