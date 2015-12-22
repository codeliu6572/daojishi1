//
//  ViewController.m
//  倒计时
//
//  Created by yons on 15/4/16.
//  Copyright (c) 2015年 yons. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    int _count;
    UILabel *_label;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //多线程读秒操作(可以加在button里控制)
    [self performSelectorInBackground:@selector(thread) withObject:nil];
    _label=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 568)];
    _label.backgroundColor=[UIColor orangeColor];
    _label.textAlignment=NSTextAlignmentCenter;
    _label.font=[UIFont systemFontOfSize:30];
    _label.text=@"60";
    [self.view addSubview:_label];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
// 在异步线程中无法操作UI，如果想要操作UI必须回调主线程
- (void)thread
{
    for(int i=59;i>=0;i--)
    {
        _count = i;
        // 回调主线程
        [self performSelectorOnMainThread:@selector(mainThread) withObject:nil waitUntilDone:YES];
        sleep(1);
    }
}

// 此函数主线程执行
- (void)mainThread
{
    _label.text=[NSString stringWithFormat:@"%d",_count];
    if (_count==0) {
        
    }
}
@end
