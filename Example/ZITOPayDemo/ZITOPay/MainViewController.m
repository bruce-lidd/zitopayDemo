//
//  MainViewController.m
//  ZITOPay
//
//  Created by 李冬冬 on 16/10/28.
//  Copyright © 2016年 ldd. All rights reserved.
//

#import "MainViewController.h"
#import "ViewController.h"
#define paddingLeft 15.0
@interface MainViewController ()
@property (nonatomic,retain)UILabel *productNameLbl;
@property (nonatomic,retain)UITextField *productNameText;
@property (nonatomic,retain)UILabel *productDetailLbl;
@property (nonatomic,retain)UITextField *productDetailText;
@property (nonatomic,retain)UILabel *productPriceLbl;
@property (nonatomic,retain)UITextField *productPriceText;
@property (nonatomic,retain)UILabel *orderTitleLbl;
@property (nonatomic,retain)UITextField *orderTitleText;
@property (nonatomic,retain)UIButton *btn;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if( ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0)) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.modalPresentationCapturesStatusBarAppearance = NO;
    }
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self addView];
    [self setTitle:@"请输入商品信息"];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide:)];
    //设置成NO表示当前控件响应后会传播到其他控件上，默认为YES。
    tapGestureRecognizer.cancelsTouchesInView = NO;
    //将触摸事件添加到当前view
    [self.view addGestureRecognizer:tapGestureRecognizer];
    
}
- (void)addView{
    [self.view addSubview:self.productNameLbl];
    [self.view addSubview:self.productNameText];
    [self.view addSubview:self.productDetailLbl];
    [self.view addSubview:self.productDetailText];
    [self.view addSubview:self.productPriceLbl];
    [self.view addSubview:self.productPriceText];
    [self.view addSubview:self.orderTitleLbl];
    [self.view addSubview:self.orderTitleText];
    [self.view addSubview:self.btn];
}
- (UILabel *)productNameLbl
{
    if (!_productNameLbl) {
        _productNameLbl = [[UILabel alloc]initWithFrame:CGRectMake(paddingLeft, 50, 100, 30)];
        [_productNameLbl setTextColor:[UIColor blackColor]];
        [_productNameLbl setFont:[UIFont systemFontOfSize:15]];
        [_productNameLbl setText:@"商品名称"];
        [_productNameLbl setTextAlignment:NSTextAlignmentRight];
        [_productNameLbl setBackgroundColor:[UIColor clearColor]];
    }
    return _productNameLbl;
}
- (UITextField *)productNameText
{
    if (!_productNameText) {
        _productNameText = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.productNameLbl.frame), 50, 200, 30)];
        [_productNameText setPlaceholder:@"请输入商品名称"];
        [_productNameText setText:@"西装套装"];
        [_productNameText setBorderStyle:UITextBorderStyleRoundedRect];
        [_productNameText.layer setBorderColor:[UIColor grayColor].CGColor];
        [_productNameText setTextAlignment:NSTextAlignmentCenter];
        [_productNameText setTextColor:[UIColor redColor]];
    }
    return _productNameText;
}
- (UILabel *)productDetailLbl
{
    if (!_productDetailLbl) {
        _productDetailLbl = [[UILabel alloc]initWithFrame:CGRectMake(paddingLeft, CGRectGetMaxY(self.productNameLbl.frame)+20, 100, 30)];
        [_productDetailLbl setTextColor:[UIColor blackColor]];
        [_productDetailLbl setFont:[UIFont systemFontOfSize:15]];
        [_productDetailLbl setText:@"商品描述"];
        [_productDetailLbl setTextAlignment:NSTextAlignmentRight];
        [_productDetailLbl setBackgroundColor:[UIColor clearColor]];
    }
    return _productDetailLbl;
}
- (UITextField *)productDetailText
{
    if (!_productDetailText) {
        _productDetailText = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.productDetailLbl.frame),CGRectGetMaxY(self.productNameLbl.frame)+20, 200, 30)];
        [_productDetailText setPlaceholder:@"请输入商品描述"];
        [_productDetailText setText:@"高端大气上档次"];
        [_productDetailText setBorderStyle:UITextBorderStyleRoundedRect];
        [_productDetailText.layer setBorderColor:[UIColor grayColor].CGColor];
        [_productDetailText setTextAlignment:NSTextAlignmentCenter];
        [_productDetailText setTextColor:[UIColor redColor]];
    }
    return _productDetailText;
}
- (UILabel *)productPriceLbl
{
    if (!_productPriceLbl) {
        _productPriceLbl = [[UILabel alloc]initWithFrame:CGRectMake(paddingLeft, CGRectGetMaxY(self.productDetailLbl.frame)+20, 100, 30)];
        [_productPriceLbl setTextColor:[UIColor blackColor]];
        [_productPriceLbl setFont:[UIFont systemFontOfSize:15]];
        [_productPriceLbl setText:@"商品价格"];
        [_productPriceLbl setTextAlignment:NSTextAlignmentRight];
        [_productPriceLbl setBackgroundColor:[UIColor clearColor]];
    }
    return _productPriceLbl;
}
- (UITextField *)productPriceText
{
    if (!_productPriceText) {
        _productPriceText = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.productPriceLbl.frame),CGRectGetMaxY(self.productDetailLbl.frame)+20, 200, 30)];
        [_productPriceText setPlaceholder:@"必须为0.00格式浮点数"];
        [_productPriceText setText:@"0.01"];
        [_productPriceText setBorderStyle:UITextBorderStyleRoundedRect];
        [_productPriceText.layer setBorderColor:[UIColor grayColor].CGColor];
        [_productPriceText setTextAlignment:NSTextAlignmentCenter];
        [_productPriceText setTextColor:[UIColor redColor]];
    }
    return _productPriceText;
}
- (UILabel *)orderTitleLbl
{
    if (!_orderTitleLbl) {
        _orderTitleLbl = [[UILabel alloc]initWithFrame:CGRectMake(paddingLeft, CGRectGetMaxY(self.productPriceLbl.frame)+20, 100, 30)];
        [_orderTitleLbl setTextColor:[UIColor blackColor]];
        [_orderTitleLbl setFont:[UIFont systemFontOfSize:15]];
        [_orderTitleLbl setText:@"订单标题"];
        [_orderTitleLbl setTextAlignment:NSTextAlignmentRight];
        [_orderTitleLbl setBackgroundColor:[UIColor clearColor]];
    }
    return _orderTitleLbl;
}
- (UITextField *)orderTitleText
{
    if (!_orderTitleText) {
        _orderTitleText = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.orderTitleLbl.frame),CGRectGetMaxY(self.productPriceLbl.frame)+20, 200, 30)];
        [_orderTitleText setPlaceholder:@"请输入订单标题"];
        [_orderTitleText setText:@"订单您好"];
        [_orderTitleText setBorderStyle:UITextBorderStyleRoundedRect];
        [_orderTitleText.layer setBorderColor:[UIColor grayColor].CGColor];
        [_orderTitleText setTextAlignment:NSTextAlignmentCenter];
        [_orderTitleText setTextColor:[UIColor redColor]];
    }
    return _orderTitleText;
}
- (UIButton *)btn
{
    if (!_btn) {
        _btn = [[UIButton alloc]initWithFrame:CGRectMake((SCREENSIZE.width-200)/2.0, CGRectGetMaxY(self.orderTitleLbl.frame)+20, 200, 40)];
        [_btn addTarget:self action:@selector(goPay:) forControlEvents:UIControlEventTouchUpInside];
        [_btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_btn.titleLabel setFont:[UIFont systemFontOfSize:30]];
        [_btn setTitle:@"go pay" forState:UIControlStateNormal];
        [_btn setBackgroundColor:[UIColor grayColor]];
    }
    return _btn;
}

#pragma mark++++++++++++go pay+++++++++++++++++
- (void)goPay:(UIButton *)btn
{
    [self.view endEditing:YES];
    
    NSString * proName = self.productNameText.text;
    NSString * proDetail = self.productDetailText.text;
    NSString * proPrice = self.productPriceText.text;
    NSString * orderTitle = self.orderTitleText.text;
    
    NSDictionary * dic = [NSDictionary dictionaryWithObjectsAndKeys:proName,@"proName",proDetail,@"proDetail",proPrice,@"proPrice",orderTitle,@"orderTitle", nil];
    
    ViewController * vc = [[ViewController alloc]init];
    [vc setDicData:dic];
    [self.navigationController pushViewController:vc animated:YES];
    
    
}
-(void)keyboardHide:(UITapGestureRecognizer*)tap{
    [self.view endEditing:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
