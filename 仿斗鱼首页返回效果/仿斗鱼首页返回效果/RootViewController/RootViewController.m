//
//  RootViewController.m
//  仿斗鱼首页返回效果
//
//  Created by admin on 16/12/21.
//  Copyright © 2016年 李广政. All rights reserved.
//

#import "RootViewController.h"
#import "SecondViewController.h"
#define HEIGHT [UIScreen mainScreen].bounds.size.height
#define WIDTH [UIScreen mainScreen].bounds.size.width

typedef void(^showHeaderRemindBlock)(NSString *remindString);

@interface RootViewController ()
 
    @property (nonatomic, strong) UIView                *headRemindView;   //顶部提醒视图
    @property (nonatomic, strong) UILabel               *remindLabel;      //顶部提示文字视图
    @property (nonatomic, strong) UIButton              *pushButton;       //跳转按钮
    @property (nonatomic, copy)   showHeaderRemindBlock showRemindBlock;   //展示头部提示视图Block
 
    

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    [self.view addSubview:self.headRemindView];
    [self.view addSubview:self.pushButton];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
    
-(void)viewWillAppear:(BOOL)animated{

    
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}
    
#pragma mark -- Personal Methods

-(void)pushAction{
    SecondViewController *secondViewCtrl = [[SecondViewController alloc]init];
    [self.navigationController pushViewController:secondViewCtrl animated:YES];
}
    
-(void)showRemindViewAnimation{
    
    
}
#pragma mark -- Lazy Load
    
-(UIView *)headRemindView{
    
    if (!_headRemindView){
        
        _headRemindView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 50)];
        _headRemindView.backgroundColor = [UIColor whiteColor];
        [_headRemindView addSubview:self.remindLabel];
    
    }
    
    return _headRemindView;
}
    
-(UILabel *)remindLabel{
    
    if (!_remindLabel){
        
        _remindLabel = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH * 0.5 - 40, 15, 80, 35)];
        _remindLabel.textAlignment = NSTextAlignmentCenter;
        _remindLabel.textColor = [UIColor colorWithRed:0.30 green:0.41 blue:0.49 alpha:1.00];
        _remindLabel.text = @"切换成功";
    }
    return _remindLabel;
}
    
-(UIButton *)pushButton{
    
    if (!_pushButton){
        
        _pushButton = [[UIButton alloc]initWithFrame:CGRectMake(100, 300, 150, 40)];
        _pushButton.backgroundColor = [UIColor whiteColor];
        [_pushButton setTitle:@"跳转" forState:UIControlStateNormal];
        [_pushButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_pushButton addTarget:self action:@selector(pushAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _pushButton;
}

-(showHeaderRemindBlock)showRemindBlock{
    
    if (!_showRemindBlock){
        
        
        __weak typeof(self) weakSelf = self;
        _showRemindBlock = ^(NSString *remindString){
            
            __strong typeof(weakSelf) strongSelf = weakSelf;
            strongSelf.remindLabel.text = remindString;
        
        };
    }
    
    return _showRemindBlock;
}
@end
