//
//  BAColoredIconManager.h
//  Pods
//
//  Created by Marcus Fleischmann on 05.03.15.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BAColoredIconManager : NSObject

@property(nonatomic, strong) UIColor *color;

- (UIImage *)iconNamed:(NSString *)name;

@end