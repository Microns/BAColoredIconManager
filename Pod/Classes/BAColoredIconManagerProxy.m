//
//  BAColoredIconProxy.m
//  Pods
//
//  Created by Marcus Fleischmann on 05.03.15.
//
//

#import "BAColoredIconManagerProxy.h"

#import "BAColoredIconManagerSubject.h"

@interface BAColoredIconManagerProxy ()

@property(nonatomic) NSDictionary *cache;
@property(nonatomic) BAColoredIconManagerSubject *iconManagerSubject;

@end

@implementation BAColoredIconManagerProxy

@synthesize color = _color;

- (instancetype)init {
    self = [super init];

    if (self) {
        [self initCache];
        [self listenToMemoryWarnings];

        self.iconManagerSubject = [[BAColoredIconManagerSubject alloc] init];
    }

    return self;
}

// @override
- (void)setColor:(UIColor *)color {
    [self.iconManagerSubject setColor:color];
}

// @override
- (UIImage *)iconNamed:(NSString *)name {
    UIImage *cachedIcon = [self.cache objectForKey:name];

    if (cachedIcon) {
        return cachedIcon;
    } else {
        return [self.iconManagerSubject iconNamed:name];
    }

    return nil;
}

- (void)initCache {
    self.cache = [[NSDictionary alloc] init];
}

- (void)clearCache {
    self.cache = nil;
    [self initCache];
}

- (void)listenToMemoryWarnings {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(clearCache)
                                                 name:@"UIApplicationDidReceiveMemoryWarningNotification"
                                               object:nil];
}
@end
