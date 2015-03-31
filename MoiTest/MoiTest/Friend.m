//
//  Friend.m
//  MoiTest
//
//  Created by Jaime Moises Gutierrez on 3/31/15.
//  Copyright (c) 2015 JMGL. All rights reserved.
//

#import "Friend.h"

@implementation Friend


- (id) initFriendWithData: (NSDictionary *) data
{
    if (self = [super init])
    {
        self.friendId = [NSNumber numberWithInt:[[data objectForKey:@"id"] intValue]];
        self.imageURL = [data objectForKey:@"img"];
        self.firstName = [data objectForKey:@"first_name"];
        self.lastName = [data objectForKey:@"last_name"];
        self.status = [data objectForKey:@"status"];
        self.isAvailable = [[data objectForKey:@"available"] boolValue];
    }
    NSLog(@"%@", [self description]);
    return self;
}

@end
