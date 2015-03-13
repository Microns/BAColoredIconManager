//
//  BAColoredIconManagerFactory.h
//  Pods
//
//  Created by Marcus Fleischmann on 06.03.15.
//
//

#import <Foundation/Foundation.h>

#import "BAColoredIconManager.h"

@interface BAColoredIconManagerFactory : NSObject

+ (id<BAColoredIconManager>)createManager;

@end
