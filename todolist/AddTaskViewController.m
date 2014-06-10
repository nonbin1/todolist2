//
//  AddTaskViewController.m
//  todolist
//
//  Created by Panasun on 6/9/2557 BE.
//  Copyright (c) 2557 Panasun Sunanta. All rights reserved.
//

#import "AddTaskViewController.h"

@interface AddTaskViewController ()

@end

@implementation AddTaskViewController

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



@end
