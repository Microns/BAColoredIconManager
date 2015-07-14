//
//  BAColoredIconManager.h
//  Pods
//
//  Created by Marcus Fleischmann on 05.03.15.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol BAColoredIconManager <NSObject>

@property(nonatomic, strong) UIColor *color;

- (UIImage *)iconNamed:(NSString *)name;
- (UIImage *)applyColorToIcon:(UIImage *)icon;

@end
