//
//  NewsCell.m
//  CoreData
//
//  Created by 咪咕 on 16/5/24.
//  Copyright © 2016年 咪咕. All rights reserved.
//

#import "NewsCell.h"

@implementation NewsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    if (selected) {
        _newsTitle.textColor = [UIColor darkGrayColor];
    }
}

- (void)setContent:(News *)info
{
    NSLog(@"1234567%@ %@ %@",info.title,info.descr,info.imgurl);
    [_newsImageView sd_setImageWithURL:[NSURL URLWithString:info.imgurl]];
    _newsTitle.text = info.title;
    _newsDescr.text = info.descr;
    if ([info.islook isEqualToString:@"1"]) {
        _newsTitle.textColor = [UIColor darkGrayColor];
    }
}


@end
