//
//  ViewController.m
//  MantleDemo
//
//  Created by 王展 on 15/10/24.
//  Copyright © 2015年 王展. All rights reserved.
//

#import "ViewController.h"
#import "MantleHandler.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [MantleHandler handleTestCases];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
