//
//  Friend.h
//  MoiTest
//
//  Created by Jaime Moises Gutierrez on 3/31/15.
//  Copyright (c) 2015 JMGL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Friend : NSObject

@property (strong, nonatomic) NSNumber *friendId;
@property (strong, nonatomic) NSString *imageURL;
@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;
@property (strong, nonatomic) NSString *status;
@property (nonatomic) BOOL isAvailable;

- (id) initFriendWithData: (NSDictionary *) data;

@end
