//
//  ToDoItem.m
//  todolist
//
//  Created by Panasun on 6/10/2557 BE.
//  Copyright (c) 2557 Panasun Sunanta. All rights reserved.
//

#import "ToDoItem.h"

@implementation ToDoItem

- (void)loadDatabase
{
    NSMutableArray *todoItems = [[[NSUserDefaults standardUserDefaults] arrayForKey:@"todoItems"] mutableCopy];
    NSLog(@"Database: %@", todoItems);
}

- (void)saveItem: (NSMutableDictionary*)item
{
    NSMutableArray *todoItems = [[NSMutableArray alloc] init];
    
    [todoItems addObject:item];
    
    if([[NSUserDefaults standardUserDefaults] arrayForKey:@"todoItems"]  != nil) {
        
        NSMutableArray *tmpDB = [[[NSUserDefaults standardUserDefaults] arrayForKey:@"todoItems"] mutableCopy];
        [todoItems addObjectsFromArray:tmpDB];
        
    }
    
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:todoItems forKey:@"todoItems"];
    [userDefaults synchronize];
    
    
}

- (void)saveDB: (NSMutableArray*) db
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:db forKey:@"todoItems"];
    [userDefaults synchronize];
    
    NSLog(@"Save DB");
}

@end
