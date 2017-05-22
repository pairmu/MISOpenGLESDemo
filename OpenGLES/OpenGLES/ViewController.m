//
//  ViewController.m
//  OpenGLES
//
//  Created by Mistletoe on 2017/5/22.
//  Copyright © 2017年 Mistletoe. All rights reserved.
//

#import "ViewController.h"
#import "DemoView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)loadView {
    self.view = [[DemoView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.view.backgroundColor = [UIColor redColor];
}
@end
