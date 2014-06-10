//
//  ToDoItem.h
//  todolist
//
//  Created by Panasun on 6/10/2557 BE.
//  Copyright (c) 2557 Panasun Sunanta. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoItem : NSObject
{
    
}

- (void)loadDatabase;
- (void)saveItem: (NSMutableDictionary*)item;
- (void)saveDB: (NSMutableArray*) db;

@end
