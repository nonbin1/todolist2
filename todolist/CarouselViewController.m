//
//  CarouselViewController.m
//  todolist
//
//  Created by Panasun on 6/11/2557 BE.
//  Copyright (c) 2557 Panasun Sunanta. All rights reserved.
//

#import "CarouselViewController.h"

@interface CarouselViewController ()

@property (nonatomic, strong) NSMutableArray *items;

@end

@implementation CarouselViewController

@synthesize carousel;
@synthesize items;

- (void)awakeFromNib
{
    //set up data
    //your carousel should always be driven by an array of
    //data of some kind - don't store data in your item views
    //or the recycling mechanism will destroy your data once
    //your item views move off-screen
    self.items = [NSMutableArray array];
    for (int i = 10; i < 30; i++)
    {
        NSString *imageName = [NSString stringWithFormat:@"Roundicons-%d.png",i];
        [items addObject:@(i)];
    }
    
}

- (void)dealloc
{
    //it's a good idea to set these to nil here to avoid
    //sending messages to a deallocated viewcontroller
    carousel.delegate = nil;
    carousel.dataSource = nil;
}

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //configure carousel
    //carousel.type = iCarouselTypeCylinder;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    //free up memory by releasing subviews
    self.carousel = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

#pragma mark -
#pragma mark iCarousel methods

- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    //return the total number of items in the carousel
    return [items count];
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view
{
    UILabel *label = nil;
    
    //create new view if no view is available for recycling
    if (view == nil)
    {
        view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100.0f, 100.0f)];
        view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleHeight;
        view.contentMode = UIViewContentModeCenter;
        
       /* label = [[UILabel alloc] initWithFrame:view.bounds];
        label.backgroundColor = [UIColor clearColor];
        label.textAlignment = UITextAlignmentCenter;
        label.font = [label.font fontWithSize:20];
        label.tag = 1;
        [view addSubview:label];
        */
    }
    else
    {
        //get a reference to the label in the recycled view
        
        label = (UILabel *)[view viewWithTag:1];
    }
    NSString *imageName = [NSString stringWithFormat:@"Roundicons-%@.png",[items[index] stringValue]];
    
    //NSLog(@"%@", imageName);
    
    ((UIImageView *)view).image = [UIImage imageNamed:imageName];
    //set item label
    //remember to always set any properties of your carousel item
    //views outside of the `if (view == nil) {...}` check otherwise
    //you'll get weird issues with carousel item content appearing
    //in the wrong place in the carousel
    //label.text = [items[index] stringValue];
    
    return view;
}

@end

