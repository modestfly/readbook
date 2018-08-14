//
//  ViewController.m
//  ReadBook
//
//  Created by test on 2018/8/8.
//  Copyright © 2018年 Freedom. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    [self creatSubViews];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)creatSubViews{
    
    UIButton *scanButton = [UIButton buttonWithType:UIButtonTypeCustom];
    scanButton.frame = CGRectMake(50, 100, 200, 50);
    [scanButton setTitle:@"文字识别按钮" forState:UIControlStateNormal];
    [scanButton setBackgroundColor:[UIColor greenColor]];
    [scanButton addTarget:self action:@selector(scanButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:scanButton];
    
    UIButton *faceButton = [UIButton buttonWithType:UIButtonTypeCustom];
    faceButton.frame = CGRectMake(50, 180, 200, 50);
    [faceButton setTitle:@"人脸识别按钮" forState:UIControlStateNormal];
    [faceButton setBackgroundColor:[UIColor greenColor]];
    [faceButton addTarget:self action:@selector(faceButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:faceButton];
    
}
//文字识别方法
-(void)scanButtonClick:(UIButton *)sender{
    //异步开启多线程，不能阻塞主线程的使用
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        //初始化G8Tesseract类，为文字识别做准备
        G8Tesseract *CardTesseract = [[G8Tesseract alloc] initWithLanguage:@"eng+chi_sim"];
        
        
        
    });
    
}
//人脸识别方法
-(void)faceButtonAction:(UIButton *)sender{
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
