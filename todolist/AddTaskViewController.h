//
//  AddTaskViewController.h
//  todolist
//
//  Created by Panasun on 6/9/2557 BE.
//  Copyright (c) 2557 Panasun Sunanta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDoItem.h"
#import "iCarousel.h"

@interface AddTaskViewController : UIViewController <iCarouselDataSource, iCarouselDelegate>
{
    IBOutlet UITextField *taskName;
    IBOutlet UIButton *createTask;
    
}

@property (nonatomic, strong) IBOutlet iCarousel *carousel;

- (IBAction) createTask:(id)sender;
- (IBAction) taskNameReturn:(id)sender;

@end
