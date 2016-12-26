//
//  ChannelTableViewCell.m
//  ZITOPay
//
//  Created by 李冬冬 on 16/9/29.
//  Copyright © 2016年 ldd. All rights reserved.
//

#import "ChannelTableViewCell.h"
@implementation ChannelTableViewCell
{
    UIImageView * _iconView;
    UILabel * _lbl;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView setBackgroundColor:[UIColor clearColor]];
        UIImageView *iconView = [[UIImageView alloc]initWithFrame:CGRectMake(20, (120-100)/2.0, 100, 100)];
        [self.contentView addSubview:iconView];
        _iconView = iconView;
        
        UILabel * lbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(iconView.frame)+10, 0, 200, 120)];
        [lbl setTextAlignment:NSTextAlignmentCenter];
        [lbl setFont:[UIFont boldSystemFontOfSize:18]];
        [lbl setTextColor:[UIColor redColor]];
        [lbl setBackgroundColor:[UIColor clearColor]];
        [self.contentView addSubview:lbl];
        _lbl = lbl;
    }
    return self;
}
- (void)setCellData:(NSDictionary *)dic
{
    NSString * imgName = [dic objectForKey:@"img"];
    UIImage *img = [self parseChannel:imgName];
    [_iconView setImage:img];
    [_lbl setText:[dic objectForKey:@"title"]];
}
#pragma mark - 读取图片
- (UIImage *)parseChannel:(NSString *)imgName {
    
    return [self imagesNamedFromCustomBundle:imgName];
}

- (UIImage *)imagesNamedFromCustomBundle:(NSString *)imgName {
    NSString *bundlePath = [[NSBundle mainBundle].resourcePath stringByAppendingPathComponent:@"ZITOPay.bundle"];
    NSBundle *bundle = [NSBundle bundleWithPath:bundlePath];
    NSString *img_path = [bundle pathForResource:imgName ofType:@"png"];
    return [UIImage imageWithContentsOfFile:img_path];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
