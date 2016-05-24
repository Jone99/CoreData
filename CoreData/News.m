//
//  News.m
//  CoreData
//
//  Created by 咪咕 on 16/5/24.
//  Copyright © 2016年 咪咕. All rights reserved.
//

#import "News.h"

@implementation News

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        self.newsid = [dictionary objectForKey:@"id"];
        self.title = [dictionary objectForKey:@"title"];
        self.descr = [dictionary objectForKey:@"descr"];
        self.imgurl = [dictionary objectForKey:@"imgurl"];
        self.islook = @"0";
    }
    return self;
}

@end
