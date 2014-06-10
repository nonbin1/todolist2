//
//  TodoItemCellTableViewCell.m
//  todolist
//
//  Created by Panasun on 6/10/2557 BE.
//  Copyright (c) 2557 Panasun Sunanta. All rights reserved.
//

#import "TodoItemCellTableViewCell.h"

@implementation TodoItemCellTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.name.lineBreakMode = NSLineBreakByWordWrapping;
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
