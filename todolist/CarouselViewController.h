//
//  CarouselViewController.h
//  todolist
//
//  Created by Panasun on 6/11/2557 BE.
//  Copyright (c) 2557 Panasun Sunanta. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "iCarousel.h"

@interface CarouselViewController : UIViewController <iCarouselDataSource, iCarouselDelegate>

@property (nonatomic, strong) IBOutlet iCarousel *carousel;

@end
