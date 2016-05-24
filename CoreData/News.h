//
//  News.h
//  CoreData
//
//  Created by 咪咕 on 16/5/24.
//  Copyright © 2016年 咪咕. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface News : NSObject

@property (nonatomic, strong)NSString *newsid;
@property (nonatomic, strong)NSString *title;
@property (nonatomic, strong)NSString *descr;
@property (nonatomic, strong)NSString *imgurl;
@property (nonatomic, strong)NSString *islook;

- (id)initWithDictionary:(NSDictionary *)dictionary;

@end
