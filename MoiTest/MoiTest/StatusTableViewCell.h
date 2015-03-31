//
//  StatusTableViewCell.h
//  MoiTest
//
//  Created by Jaime Moises Gutierrez on 3/31/15.
//  Copyright (c) 2015 JMGL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StatusTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *profileImageView;
@property (strong, nonatomic) IBOutlet UILabel *fullNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *statusLabel;
@property (strong, nonatomic) IBOutlet UIImageView *avalabilityImageView;

@end
