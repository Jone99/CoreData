//
//  ViewController.m
//  CoreData
//
//  Created by 咪咕 on 16/5/24.
//  Copyright © 2016年 咪咕. All rights reserved.
//

#import "ViewController.h"
#import "JSONKit.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"%@",NSHomeDirectory());
    coreManager = [[CoreDateManager alloc]init];
    //更新时间
    NSString *updateDate = [[NSUserDefaults standardUserDefaults]objectForKey:@"updateDate"];
    
    NSLog(@"%@",updateDate);
    if (!updateDate) {
        //如果没有对象,表示第一次,就读取数据写到的数据库中
        [self writeDate];
    }else{
        //有次对象说明只要从数据库中读取数据
        NSTimeInterval update = updateDate.doubleValue;
        NSTimeInterval now = [NSDate timeIntervalSinceReferenceDate];
        NSLog(@"%@ %f",updateDate,now);
        
        
        //每8小时更新
        if ((now - update)>8*60*60) {
            //如果超过8小时就把数据库清空重写
            [coreManager deleteData];
            [self writeDate];
        }else{
            //如果没有超过8小时,就从数据库中读取
            NSMutableArray *array = [coreManager selectData:10 andOffset:0];
            _resultArray = [NSMutableArray arrayWithArray:array];
            [newsTableView reloadData];
            
        }
    }
}

- (void)writeDate
{
    [[NSUserDefaults standardUserDefaults]setObject:[NSString stringWithFormat:@"%f",[NSDate timeIntervalSinceReferenceDate]] forKey:@"updateDate"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    //读取信息,这里是本地的  一般都是从网络获取的
    NSString *path = [[NSBundle mainBundle]pathForResource:@"News" ofType:@"txt"];
    NSString *data = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSArray *array = [data objectFromJSONString];
    _resultArray = [NSMutableArray arrayWithCapacity:array.count];
    for (NSDictionary *dict in array) {
        News *info = [[News alloc]initWithDictionary:dict];
        [_resultArray addObject:info];
        NSLog(@"%@",_resultArray);
    }
    //把数据写到数据库里
    [coreManager insertCoreData:_resultArray];
    [newsTableView reloadData];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _resultArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    return 90;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"NewsCell";
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        NSArray *cells = [[NSBundle mainBundle]loadNibNamed:@"NewsCell" owner:self options:nil];
        cell = [cells lastObject];
    }
    News *info = [_resultArray objectAtIndex:indexPath.row];
    [cell setContent:info];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    //当你点击时说明这条新闻一查看,那么久标注新闻已经被查看
    News *info = [_resultArray objectAtIndex:indexPath.row];
    info.islook = @"1";
    //改变数据库查看状态
    [coreManager updateData:info.newsid withIsLook:@"1"];
    //改变resultarray数据
    [_resultArray setObject:info atIndexedSubscript:indexPath.row];
}


































- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
