//
//  Type1ViewController.m
//  CellDynamicAltitule
//
//  Created by 韩扬 on 2017/4/18.
//  Copyright © 2017年 HanYang. All rights reserved.
//

#import "Type1ViewController.h"
#import "HYMacro.h"
#import "Cell_Test.h"

@interface Type1ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) Cell_Test * cell;
@property (nonatomic, strong) NSArray * dataArr;
@end

static NSString * cellIdentifier = @"Cell_Test";
@implementation Type1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTableView];
    _dataArr = @[@"我的境况放假", @"jkdjfkadjfdjafj的积分卡积分卡大家反馈到敬爱放大家分开阿娇快放假啊积分卡积分积分开始就发的是减肥打手机发电视剧发的是开放的是的空间按附件的垃圾费看得见啊",@"jkdjfka的境况放假大放假打卡机飞就看得见反馈的减肥", @"jkdjajfldajklf 贷记卡家乐福大家快乐防静电阿里的积分大姐夫", @"放假啊考虑放假了案件反馈的安家费看大家分开打反馈到敬爱放的骄傲看反馈卡就飞快的放假", @"jkdja将开发大姐夫就打开附件安定放假开打放假的卡风较大飞交罚款的姐夫"];
}

- (void)createTableView
{
    _tableView = [UITableView new];
    _tableView.frame = CGRectMake(0, 64,SCREEN_WIDTH, SCREEN_HEIGHT - 64);
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _cell = [[[NSBundle mainBundle] loadNibNamed:@"Cell_Test" owner:self options:nil] lastObject];
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Cell_Test *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == Nil){
        cell = [[[NSBundle mainBundle] loadNibNamed:@"Cell_Test" owner:self options:nil] lastObject];
    }
    cell.contentLbl.text = _dataArr[indexPath.row];
    return cell;
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    _cell.contentLbl.text = _dataArr[indexPath.row];
    CGSize size = [_cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    return size.height+1.0f;
}


@end
