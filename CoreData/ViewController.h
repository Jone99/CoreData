//
//  ViewController.h
//  CoreData
//
//  Created by 咪咕 on 16/5/24.
//  Copyright © 2016年 咪咕. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsCell.h"
#import "CoreDateManager.h"

@interface ViewController : UIViewController
{
    __weak IBOutlet UITableView *newsTableView;
    CoreDateManager *coreManager;
}
@property (nonatomic, strong)NSMutableArray *resultArray;


@end

