//
//  StatusTableViewCell.m
//  MoiTest
//
//  Created by Jaime Moises Gutierrez on 3/31/15.
//  Copyright (c) 2015 JMGL. All rights reserved.
//

#import "StatusTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation StatusTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) setupCell:(Friend *) friend
{
    self.fullNameLabel = [NSString stringWithFormat:@"%@ %@", friend.firstName, friend.lastName];
    self.statusLabel = friend.status;
//    self.avalabilityImageView = SDWebImage 
}


@end
