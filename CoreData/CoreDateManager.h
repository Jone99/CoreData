//
//  CoreDateManager.h
//  CoreData
//
//  Created by 咪咕 on 16/5/24.
//  Copyright © 2016年 咪咕. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "News.h"
#import <CoreData/CoreData.h>
#define TableName @"News"

@interface CoreDateManager : NSObject

@property (readonly, strong, nonatomic)NSManagedObjectContext *managedObjectContext;//管理对象 创建的上下文
@property (readonly, strong, nonatomic)NSManagedObjectModel *managedObjectModel;//被管理的数据模型
@property (readonly, strong, nonatomic)NSPersistentStoreCoordinator *persistentStoreCoordinator;
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

//插入数据
- (void)insertCoreData:(NSMutableArray *)dataArray;
//查询
- (NSMutableArray *)selectData:(int)pageSize andOffset:(int)currentPage;
//删除
- (void)deleteData;
//更新
- (void)updateData:(NSString *)newsId withIsLook:(NSString *)islook;

@end



















