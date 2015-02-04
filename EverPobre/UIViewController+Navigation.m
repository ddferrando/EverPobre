//
//  UIViewController+Navigation.m
//  EverPobre
//
//  Created by david martínez ferrando on 4/2/15.
//  Copyright (c) 2015 david martínez ferrando. All rights reserved.
//

#import "UIViewController+Navigation.h"

@implementation UIViewController (Navigation)

-(UINavigationController *) dvdWrappedNavigation{
    
    UINavigationController *nav = [UINavigationController new];
    [nav pushViewController:self
                   animated:NO];
    
    return nav;
    
}

@end
