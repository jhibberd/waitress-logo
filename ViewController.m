//
//  ViewController.m
//  waitress-logo
//
//  Created by James Hibberd on 09/06/2013.
//  Copyright (c) 2013 James Hibberd. All rights reserved.
//

#import "Logo.h"
#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    CGRect rect = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    Logo *logo = [[Logo alloc] initWithFrame:rect];
    [self.view addSubview:logo];
}

@end
