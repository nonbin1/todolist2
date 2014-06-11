//
//  ViewController.m
//  todolist
//
//  Created by Panasun on 6/9/2557 BE.
//  Copyright (c) 2557 Panasun Sunanta. All rights reserved.
//

#import "ViewController.h"
#import "ToDoItem.h"
#import "ToDoItemCellTableViewCell.h"
#import "BVReorderTableView.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    todoItems = [[[NSUserDefaults standardUserDefaults] arrayForKey:@"todoItems"] mutableCopy];
    
    //Initialize Table View
    todoListsTable.dataSource = self;
    todoListsTable.delegate = self;
    todoListsTable.backgroundColor = [UIColor clearColor];
    todoListsTable.opaque = NO;
    todoListsTable.backgroundView = nil;
    todoListsTable.separatorColor = [UIColor clearColor];
    
    
    //NSLog(@"todoItems : %@", [todoItems[1] valueForKeyPath:@"name"]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [todoItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TodoItemCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TodoCell"];
    
    //When drag
    if ([[todoItems objectAtIndex:indexPath.row] isKindOfClass:[NSString class]] &&
        [[todoItems objectAtIndex:indexPath.row] isEqualToString:@"DUMMY"]) {
        cell.hidden = YES;
    }
    else {
        cell.name.text = [todoItems[indexPath.row] valueForKeyPath:@"name"];
    }
    
    
    return cell;
}

/** Select Cell **/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    NSLog(@"Select : %i", indexPath.row);
}


/** Delete Cell **/
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return YES if you want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [todoItems removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        //Save after deleting
        ToDoItem *t = [[ToDoItem alloc] init];
        [t saveDB:todoItems];
        
    }
}

/** Move Cell **/
- (id)saveObjectAndInsertBlankRowAtIndexPath:(NSIndexPath *)indexPath {
    id object = [todoItems objectAtIndex:indexPath.row];
    // Your dummy object can be something entirely different. It doesn't
    // have to be a string.
    [todoItems replaceObjectAtIndex:indexPath.row withObject:@"DUMMY"];
    return object;
}
- (void)moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    id object = [todoItems objectAtIndex:fromIndexPath.row];
    [todoItems removeObjectAtIndex:fromIndexPath.row];
    [todoItems insertObject:object atIndex:toIndexPath.row];
}
- (void)finishReorderingWithObject:(id)object atIndexPath:(NSIndexPath *)indexPath; {
    [todoItems replaceObjectAtIndex:indexPath.row withObject:object];
    
    NSLog(@"Reorder: %@", todoItems);
    //Save after deleting
    ToDoItem *t = [[ToDoItem alloc] init];
    [t saveDB:todoItems];
}

@end
