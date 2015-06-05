//
//  BAColoredIconSubject.m
//  Pods
//
//  Created by Marcus Fleischmann on 05.03.15.
//
//

#import "BAColoredIconManagerSubject.h"

@implementation BAColoredIconManagerSubject
@synthesize color = _color;

- (instancetype)init {
    self = [super init];

    if (self) {
        self.color = [UIColor blackColor];
    }

    return self;
}

// @override
- (UIImage *)iconNamed:(NSString *)name {
    UIImage *icon = [UIImage imageNamed:name];
    return [self applyColorToIcon:icon];
}

- (UIImage *)applyColorToIcon:(UIImage *)icon {
    UIImage *iconWithBackground = [self addWhiteBackgroundToIcon:icon];

    CGRect rect = {0, 0, iconWithBackground.size.width, iconWithBackground.size.height};

    UIGraphicsBeginImageContextWithOptions(rect.size, NO, icon.scale);
    [self.color setFill];
    UIRectFill(rect);
    UIImage *tempColorImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    CGImageRef iconRef = [iconWithBackground CGImage];
    CGImageRef maskRef = CGImageMaskCreate(CGImageGetWidth(iconRef), CGImageGetHeight(iconRef),
                                           CGImageGetBitsPerComponent(iconRef), CGImageGetBitsPerPixel(iconRef),
                                           CGImageGetBytesPerRow(iconRef), CGImageGetDataProvider(iconRef), NULL, false);

    CGImageRef maskedIconRef = CGImageCreateWithMask([tempColorImage CGImage], maskRef);
    CGImageRelease(maskRef);
    UIImage *coloredIcon = [UIImage imageWithCGImage:maskedIconRef scale:icon.scale orientation:UIImageOrientationUp];
    CGImageRelease(maskedIconRef);

    return coloredIcon;
}

- (UIImage *)addWhiteBackgroundToIcon:(UIImage *)icon {
    UIGraphicsBeginImageContextWithOptions(icon.size, NO, icon.scale);
    CGContextSetRGBFillColor(UIGraphicsGetCurrentContext(), 1, 1, 1, 1);

    CGRect iconRect = CGRectZero;
    iconRect.origin = CGPointZero;
    iconRect.size.width = icon.size.width;
    iconRect.size.height = icon.size.height;

    CGContextTranslateCTM(UIGraphicsGetCurrentContext(), 0.0, icon.size.height);
    CGContextScaleCTM(UIGraphicsGetCurrentContext(), 1.0, -1.0);
    CGContextFillRect(UIGraphicsGetCurrentContext(), iconRect);
    CGContextDrawImage(UIGraphicsGetCurrentContext(), iconRect, icon.CGImage);
    UIImage *iconWithBackground = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return iconWithBackground;
}

@end
