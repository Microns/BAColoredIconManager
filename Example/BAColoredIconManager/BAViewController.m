//
//  BAViewController.m
//  BAColoredIconManager
//
//  Created by Marcus Fleischmann on 03/05/2015.
//  Copyright (c) 2014 Marcus Fleischmann. All rights reserved.
//

#import "BAViewController.h"

#import <BAColoredIconManager/BAColoredIconManagerFactory.h>

@interface BAViewController ()

@property(weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation BAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    id<BAColoredIconManager> manager = [BAColoredIconManagerFactory manager];
    manager.color = [UIColor greenColor];
    UIImage *redIcon = [manager iconNamed:@"testicon"];
    self.imageView.image = redIcon;
}

@end
