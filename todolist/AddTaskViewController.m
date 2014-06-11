//
//  AddTaskViewController.m
//  todolist
//
//  Created by Panasun on 6/9/2557 BE.
//  Copyright (c) 2557 Panasun Sunanta. All rights reserved.
//

#import "AddTaskViewController.h"

@interface AddTaskViewController ()


@property (nonatomic, strong) NSMutableArray *iconsList;

@end

@implementation AddTaskViewController

@synthesize carousel;
@synthesize iconsList;



- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //TaskName Customize
    [taskName setFont:[UIFont systemFontOfSize:24]];
   
}

- (IBAction)createTask:(id)sender {
    
    if([[taskName text] length] > 0) {
        
        //Pack Item
        NSMutableDictionary *item = [[NSMutableDictionary alloc] init];
        [item setObject:[taskName text] forKeyedSubscript:@"name"];
        [item setObject:[NSDate date] forKeyedSubscript:@"createdDate"];
        [item setObject:[NSNumber numberWithBool:NO] forKeyedSubscript:@"completed"];
        
        ToDoItem *t = [[ToDoItem alloc] init];
        [t saveItem:item];
        
        
        //Go to Main View
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        AddTaskViewController *viewController = (AddTaskViewController *)[storyboard instantiateViewControllerWithIdentifier:@"MainView"];
        viewController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        [self presentViewController:viewController animated:YES completion:nil];
        
        
    }
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [[event allTouches] anyObject];
    if ([taskName isFirstResponder] && [touch view] != taskName) {
        [taskName resignFirstResponder];
    }
    [super touchesBegan:touches withEvent:event];
}

- (IBAction)taskNameReturn:(id)sender
{
    [sender resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/** Icons Carousel **/

- (void)awakeFromNib
{
    //set up data
    //your carousel should always be driven by an array of
    //data of some kind - don't store data in your item views
    //or the recycling mechanism will destroy your data once
    //your item views move off-screen
    self.iconsList = [NSMutableArray array];
    for (int i = 10; i < 30; i++)
    {
        //NSString *imageName = [NSString stringWithFormat:@"Roundicons-%d.png",i];
        [iconsList addObject:@(i)];
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


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

#pragma mark -
#pragma mark iCarousel methods

- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    //return the total number of items in the carousel
    return [iconsList count];
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view
{
    UILabel *label = nil;
    
    //create new view if no view is available for recycling
    if (view == nil)
    {
        view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100.0f, 100.0f)];
        //view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleHeight;
        view.contentMode = UIViewContentModeCenter;
        view.contentMode = UIViewContentModeScaleAspectFit;
    
        
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
        
        //label = (UILabel *)[view viewWithTag:1];
    }
    NSString *imageName = [NSString stringWithFormat:@"Roundicons-%@.png",[iconsList[index] stringValue]];
    
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

