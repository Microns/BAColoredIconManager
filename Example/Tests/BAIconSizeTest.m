//
//  BAIconSizeTest.m
//  BAColoredIconManager
//
//  Created by Tobias Konsek on 07.05.15.
//  Copyright (c) 2015 Marcus Fleischmann. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import <BAColoredIconManager/BAColoredIconManagerFactory.h>

@interface BAIconSizeTest : XCTestCase

@property(nonatomic, strong) id<BAColoredIconManager> coloredIconManager;

@end

@implementation BAIconSizeTest

- (void)setUp {
    [super setUp];
    self.coloredIconManager = [BAColoredIconManagerFactory createManager];
}

- (void)tearDown {
    self.coloredIconManager = nil;
}

- (void)testSizeNotChanged {

    UIImage *image1 = [self.coloredIconManager iconNamed:@"spinner1"];
    UIImage *originalImage1 = [UIImage imageNamed:@"spinner1"];
    XCTAssert(image1.size.width == originalImage1.size.width, "Width changed for spinner1.png");
    XCTAssert(image1.size.height == originalImage1.size.height, "Height changed for spinner1.png");

    UIImage *image2 = [self.coloredIconManager iconNamed:@"spinner2"];
    UIImage *originalImage2 = [UIImage imageNamed:@"spinner2"];
    XCTAssert(image2.size.width == originalImage2.size.width, "Width changed for spinner2@2x.png");
    XCTAssert(image2.size.height == originalImage2.size.height, "Height changed for spinner2@2x.png");

    UIImage *image3 = [self.coloredIconManager iconNamed:@"spinner3"];
    UIImage *originalImage3 = [UIImage imageNamed:@"spinner3"];
    XCTAssert(image3.size.width == originalImage3.size.width, "Width changed for spinner3@3x.png");
    XCTAssert(image3.size.height == originalImage3.size.height, "Height changed for spinner3@3x.png");
}

- (void)testIconByReference {

    UIImage *originalImage1 = [UIImage imageNamed:@"spinner1"];
    UIImage *image1 = [self.coloredIconManager applyColorToIcon:originalImage1];
    XCTAssert(image1.size.width == originalImage1.size.width, "Width changed for spinner1.png");
    XCTAssert(image1.size.height == originalImage1.size.height, "Height changed for spinner1.png");

    UIImage *originalImage2 = [UIImage imageNamed:@"spinner2"];
    UIImage *image2 = [self.coloredIconManager applyColorToIcon:originalImage2];
    XCTAssert(image2.size.width == originalImage2.size.width, "Width changed for spinner2@2x.png");
    XCTAssert(image2.size.height == originalImage2.size.height, "Height changed for spinner2@2x.png");

    UIImage *originalImage3 = [UIImage imageNamed:@"spinner3"];
    UIImage *image3 = [self.coloredIconManager applyColorToIcon:originalImage3];
    XCTAssert(image3.size.width == originalImage3.size.width, "Width changed for spinner3@3x.png");
    XCTAssert(image3.size.height == originalImage3.size.height, "Height changed for spinner3@3x.png");
}

- (void)testNilIcon {

    UIImage *image1 = [self.coloredIconManager applyColorToIcon:nil];
    XCTAssert(image1 == nil, "method failed to return nil");
}

@end
