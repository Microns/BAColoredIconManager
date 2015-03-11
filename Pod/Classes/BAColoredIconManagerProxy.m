//
//  BAColoredIconProxy.m
//  Pods
//
//  Created by Marcus Fleischmann on 05.03.15.
//
//

#import "BAColoredIconManagerProxy.h"

#import "BAColoredIconManagerSubject.h"

static NSInteger MAX_CACHE_ENTRIES = 100;

@interface BAColoredIconManagerProxy ()

@property(nonatomic) NSMutableDictionary *cache;
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
    [self clearCache];
    [self.iconManagerSubject setColor:color];
}

// @override
- (UIImage *)iconNamed:(NSString *)name {
    UIImage *cachedIcon = [self.cache objectForKey:name];

    if (cachedIcon) {
        return cachedIcon;
    } else {
        UIImage *icon = [self.iconManagerSubject iconNamed:name];
        [self cacheIcon:icon named:name];
        return icon;
    }

    return nil;
}

- (void)initCache {
    self.cache = [[NSMutableDictionary alloc] init];
}

- (void)clearCache {
    self.cache = nil;
    [self initCache];
}

- (void)cacheIcon:(UIImage *)icon named:(NSString *)name {
    if (self.cache.count > MAX_CACHE_ENTRIES) {
        [self clearCache];
    }
    [self.cache setObject:icon forKey:name];
}

- (void)listenToMemoryWarnings {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(clearCache)
                                                 name:@"UIApplicationDidReceiveMemoryWarningNotification"
                                               object:nil];
}
@end
