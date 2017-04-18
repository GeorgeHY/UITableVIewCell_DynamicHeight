//
//  ViewController.m
//  CellDynamicAltitule
//
//  Created by 韩扬 on 2017/4/17.
//  Copyright © 2017年 HanYang. All rights reserved.
//

#import "ViewController.h"
#import "HYMacro.h"
#import "Type1ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView * tableView;

@property (nonatomic, strong) NSArray * typeArr;


@end

static NSString * cellIdentifier = @"cell";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initArr];
    [self createUI];
}

- (void) initArr
{
    self.typeArr = @[@"方式1",@"方式2"];
}

- (void) createUI
{
    self.tableView = [UITableView new];
    _tableView.frame = CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64);
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.typeArr.count && self.typeArr.count > 0) {
        return self.typeArr.count;
    }else{
        return 0;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = self.typeArr[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
        {
            Type1ViewController * type1VC =[[Type1ViewController alloc]init];
            [self.navigationController pushViewController:type1VC animated:YES];
            break;
        }
            
            
        default:
            break;
    }
}

@end
