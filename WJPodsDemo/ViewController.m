//
//  ViewController.m
//  WJPodsDemo
//
//  Created by Jlenn on 2018/12/13.
//  Copyright © 2018年 Jlenn. All rights reserved.
//

#import "ViewController.h"
#import <MBProgressHUD.h>
#import <SVProgressHUD.h>
#import "SVProgressHUD.h"
#import <SDWebImage/UIImage+GIF.h>
#import <Masonry.h>
#define JWidth  [UIScreen mainScreen].bounds.size.width
#define JHeight [UIScreen mainScreen].bounds.size.height
@interface ViewController ()
@property(nonatomic,strong) UIView *demoView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //创建btn视图
//    [self creatBtuVeiws ];
    UIView *myView = [[UIView alloc] init];
    myView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:myView];
    //layout
    [myView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(300, 300));
    }];
    //橘色视图
    [self.view addSubview:self.demoView];
    [self layoutViewsWithMAS];
    
    UIView *myView1 = [[UIView alloc] init];
    myView1.backgroundColor = [UIColor redColor];
    [self.view addSubview:myView1];
    //layout
    [myView1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.mas_equalTo(self.view);
        make.top.left.mas_equalTo(myView);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [myView mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.centerX.equalTo(self.view).with.offset(100);
//        }];
//    });
    
}
    
- (void)layoutViewsWithMAS{
    
    [self.demoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(300, 300));
    }];
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.demoView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view).with.offset(100);
            make.size.mas_equalTo(CGSizeMake(100, 100));
        }];
    });
}
    //lazyloading
- (UIView *)demoView{
    if (_demoView == nil) {
        _demoView = [[UIView alloc]initWithFrame:CGRectZero];
        _demoView.backgroundColor = [UIColor orangeColor];
    }
    return _demoView;
}
  //创建btn视图
- (void)creatBtuVeiws{
    UIButton *wjBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    wjBtn.frame = CGRectMake(100, 200, 100, 40);
    [wjBtn setTitle:@"点击按钮" forState:UIControlStateNormal];
    [wjBtn setImage:[UIImage sd_animatedGIFNamed:@"git.gif"] forState:UIControlStateNormal];
    [wjBtn setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:wjBtn];
    [wjBtn addTarget:self action:@selector(WJBtnAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *wjBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    wjBtn2.frame = CGRectMake(100, 500, 100, 40);
    [wjBtn2 setTitle:@"点击按钮" forState:UIControlStateNormal];
    [wjBtn2 setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:wjBtn2];
    [wjBtn2 addTarget:self action:@selector(WJAgainBtnAction) forControlEvents:UIControlEventTouchUpInside];
}
// 点击事件
- (void)WJBtnAction{
    NSLog(@"wodianjile");
//    UIView *wjView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 50, 20)];
//    wjView.backgroundColor = [UIColor redColor];
//    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//    [MBProgressHUD showHUDAddedTo:self.view animated:YES];//加载loading
//    // 设置显示最小时间 以便观察效果
//    [SVProgressHUD setMinimumDismissTimeInterval:MAXFLOAT];
////    [SVProgressHUD showImage:[UIImage imageNamed:@"git.gif"] status:@"加载中"];
////    [SVProgressHUD setInfoImage:[UIImage imageNamed:@"git.gif"]];
//    [SVProgressHUD setInfoImage:[UIImage sd_animatedGIFNamed:@"git.gif"]];
//    [SVProgressHUD showInfoWithStatus:@"努力加载中"];
//    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 0.5 * NSEC_PER_SEC);
//    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
//        // Do something...
////        [MBProgressHUD hideHUDForView:self.view animated:YES];
//        //        [SVProgressHUD showWithStatus:@"加载完成"];
////        [SVProgressHUD dismiss];
//    });
}
- (void)WJAgainBtnAction{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
