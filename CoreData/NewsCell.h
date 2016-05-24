//
//  NewsCell.h
//  CoreData
//
//  Created by 咪咕 on 16/5/24.
//  Copyright © 2016年 咪咕. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "News.h"
#import "UIImageView+WebCache.h"

@interface NewsCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *newsImageView;

@property (weak, nonatomic) IBOutlet UILabel *newsTitle;
@property (weak, nonatomic) IBOutlet UILabel *newsDescr;

- (void)setContent:(News *)info;

@end
