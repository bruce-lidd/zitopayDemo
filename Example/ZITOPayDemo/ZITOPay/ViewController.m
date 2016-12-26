//
//  ViewController.m
//  ZITOPay
//
//  Created by 李冬冬 on 16/9/21.
//  Copyright © 2016年 ldd. All rights reserved.
//

#import "ViewController.h"
#import "ChannelTableViewCell.h"
#import "ZITOLoadingView.h"
@interface ViewController ()<ZITOPayDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,retain) NSMutableArray * channelDataArr;
@end

@implementation ViewController
{
    UIAlertView* _alertView;
}
- (void)viewWillAppear:(BOOL)animated
{
    #pragma mark - 设置delegate
    [ZITOPay setZITOPayDelegate:self];
}
- (NSMutableArray *)channelDataArr
{
    if (!_channelDataArr) {
        _channelDataArr = [[NSMutableArray alloc] init];
    }
    return _channelDataArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    [self setTitle:@"支付列表"];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view setBackgroundColor:[UIColor clearColor]];
    
    NSArray * channelArr = @[@{@"sub":@(PayChannelWxApp), @"img":@"wx", @"title":@"微信支付"},
                             @{@"sub":@(PayChannelAliApp), @"img":@"ali", @"title":@"支付宝支付"},
                             @{@"sub":@(PayChannelSumaQuick), @"img":@"sumaQuick", @"title":@"丰付快捷M+支付"},
                             @{@"sub":@(PayChannelChangQuick), @"img":@"chan", @"title":@"畅捷通快捷支付"},
                             @{@"sub":@(PayChannelYongYiUnion), @"img":@"yongyi", @"title":@"甬易银联快捷支付"},
                                               ];
    [self.channelDataArr addObjectsFromArray:channelArr];
    
//    billTitle = [ZITOPay getCurrentMode] ? @"测试" : @"正式";
    
    UITableView * tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    [tableView setBackgroundColor:[UIColor whiteColor]];
    [tableView setDelegate:self];
    [tableView setDataSource:self];
    [self.view addSubview:tableView];
    [tableView reloadData];
}
#pragma mark - 微信、支付宝、丰付快捷、丰付银联、畅捷通

- (void)doPay:(PayChannel)channel {
    NSString *billno = [self genBillNo];
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"value",@"key", nil];
    ZITOPayReq *payReq = [[ZITOPayReq alloc] init];
    payReq.channel = channel; //支付渠道
    payReq.title = [self.dicData objectForKey:@"orderTitle"];//订单标题
    payReq.currency = @"cny";//币种必填
//    payReq.totalFee = @"0.01";//订单价格;以元为单位的整数
    payReq.totalFee = [self.dicData objectForKey:@"proPrice"];
    payReq.billNo = billno;//商户自定义订单号
    payReq.scheme = @"paySchemes";//URL Scheme,在Info.plist中配置; 支付宝必填参数
    payReq.billTimeOut = 300;//订单超时时间
    payReq.idCard = @"370802199503215121";//丰付快捷M＋必填,身份证号
    payReq.viewController = self; //丰付快捷M＋、畅捷通快捷、甬易银联支付必填
//    payReq.goodsname = @"西装";//商品名称，选填
//    payReq.goodsdetail = @"套装";//商品描述，选填
    payReq.goodsname = [self.dicData objectForKey:@"proName"];;//商品名称，选填
    payReq.goodsdetail = [self.dicData objectForKey:@"proDetail"];;//商品描述，选
    payReq.cardType = 0; //0 表示不区分卡类型；1 表示只支持借记卡；2 表示支持信用卡；默认为0
    payReq.bgRetUrl = @"http://www.baidu.com";//丰付快捷M＋、甬易银联快捷、畅捷通快捷必填,支付结果会同步返回给用户
    payReq.optional = dict;//商户业务扩展参数，会在webhook回调时返回
   
   
    if (channel == PayChannelWxApp || channel == PayChannelAliApp) {
         [self showAlertWait];
    }
    [ZITOPay sendZITOReq:payReq];
    
}
#pragma mark - ZITOPayDelegate
- (void)onZITOPayResp:(ZITOBaseResp *)resp{
    [self hideAlert];
     [self showAlertView:resp.resultMsg];
}
- (void)showAlertView:(NSString *)msg {
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"提示" message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}

- (void)showAlertWait
{
    _alertView = [[UIAlertView alloc] initWithTitle:@"正在获取支付凭据,请稍后..." message:nil delegate:self cancelButtonTitle:nil otherButtonTitles: nil];
    [_alertView show];
    
}
- (void)hideAlert
{
    if (_alertView != nil)
    {
        [_alertView dismissWithClickedButtonIndex:0 animated:YES];
        _alertView = nil;
    }
}

#pragma mark - 生成订单号
- (NSString *)genBillNo {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyyMMddHHmmssSSS"];
    return [formatter stringFromDate:[NSDate date]];
}

#pragma mark+++++++++++UITableViewDelegate+++++++++++++
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}
#pragma mark+++++++++++UITableViewDataSource+++++++++++++
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.channelDataArr count];
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifier = @"cellIdentifier";
    ChannelTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[ChannelTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    NSDictionary * dic = [self.channelDataArr objectAtIndex:indexPath.row];
    [cell setCellData:dic];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary * dic = [self.channelDataArr objectAtIndex:indexPath.row];
    NSInteger channel = [[dic objectForKey:@"sub"] integerValue];
    switch (channel) {
        case PayChannelWxApp:
        case PayChannelAliApp:
        case PayChannelSumaQuick:
        case PayChannelSumaUnion:
        case PayChannelChangQuick:
        case PayChannelYongYiUnion:
        {
            [self doPay:channel];
        }
            break;
       
        default:
            break;
    }
}
@end
