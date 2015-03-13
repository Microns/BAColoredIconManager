//
//  BAViewController.m
//  BAColoredIconManager
//
//  Created by Marcus Fleischmann on 03/05/2015.
//  Copyright (c) 2014 Marcus Fleischmann. All rights reserved.
//

#import "BAViewController.h"

#import <BAColoredIconManager/BAColoredIconManagerFactory.h>

typedef NS_ENUM(NSUInteger, SectionType) { SectionTypeRandom, SectionTypeRed, SectionTypeGreen, SectionTypeBlue };

@interface BAViewController () <UITableViewDataSource>

@property(weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic) id<BAColoredIconManager> randomManager;
@property(nonatomic) id<BAColoredIconManager> redManager;
@property(nonatomic) id<BAColoredIconManager> greenManager;
@property(nonatomic) id<BAColoredIconManager> blueManager;

@end

@implementation BAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.randomManager = [BAColoredIconManagerFactory createManager];

    self.redManager = [BAColoredIconManagerFactory createManager];
    self.redManager.color = [UIColor redColor];

    self.greenManager = [BAColoredIconManagerFactory createManager];
    self.greenManager.color = [UIColor greenColor];

    self.blueManager = [BAColoredIconManagerFactory createManager];
    self.blueManager.color = [UIColor blueColor];

    self.tableView.scrollsToTop = YES;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    if (indexPath.section == SectionTypeRandom) {
        UIColor *randomColor = [self randomColor];
        self.randomManager.color = randomColor;
        cell.imageView.image = [self.randomManager iconNamed:@"testicon"];
    } else if (indexPath.section == SectionTypeRed) {
        cell.imageView.image = [self.redManager iconNamed:@"testicon"];
    } else if (indexPath.section == SectionTypeGreen) {
        cell.imageView.image = [self.greenManager iconNamed:@"testicon"];
    } else if (indexPath.section == SectionTypeBlue) {
        cell.imageView.image = [self.blueManager iconNamed:@"testicon"];
    }

    cell.textLabel.text = [NSString stringWithFormat:@"%@ %li - %li", @"Cell", (long)indexPath.section, (long)indexPath.row];

    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *title = @"";

    if (section == SectionTypeRandom) {
        title = @"Random";
    } else if (section == SectionTypeRed) {
        title = @"Red";
    } else if (section == SectionTypeGreen) {
        title = @"Green";
    } else if (section == SectionTypeBlue) {
        title = @"Blue";
    }

    return title;
}

#pragma mark - Minions

- (UIColor *)randomColor {
    CGFloat hue = (arc4random() % 256 / 256.0);              //  0.0 to 1.0
    CGFloat saturation = (arc4random() % 128 / 256.0) + 0.5; //  0.5 to 1.0, away from white
    CGFloat brightness = (arc4random() % 128 / 256.0) + 0.5; //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}
@end
