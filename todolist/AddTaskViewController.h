//
//  AddTaskViewController.h
//  todolist
//
//  Created by Panasun on 6/9/2557 BE.
//  Copyright (c) 2557 Panasun Sunanta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDoItem.h"

@interface AddTaskViewController : UIViewController
{
    IBOutlet UITextField *taskName;
    IBOutlet UIButton *createTask;
    
}


- (IBAction) createTask:(id)sender;
- (IBAction) taskNameReturn:(id)sender;

@end
