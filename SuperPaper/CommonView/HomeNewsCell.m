//
//  HomeNewsCell.m
//  SuperPaper
//
//  Created by 瞿丹丹 on 16/1/16.
//  Copyright © 2016年 Share technology. All rights reserved.
//

#import "HomeNewsCell.h"
#import "UIImageView+WebCache.h"

#define LEFT_MARGIN (5.0)

@implementation HomeNewsCell
{
    UIImageView *_headImageView;
    UILabel* _titleLabel;
    UILabel *_timeLabel;//详情
}
- (void)awakeFromNib {
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self creatUI];

    }
    return self;
}


- (void)creatUI{
    
    _headImageView = [[UIImageView alloc]initWithFrame:CGRectMake(LEFT_MARGIN, LEFT_MARGIN, 60, 60)];
    _headImageView.layer.masksToBounds = YES;
    _headImageView.layer.cornerRadius  = 10;
    _headImageView.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:_headImageView];
    
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_headImageView.frame),LEFT_MARGIN, self.bounds.size.width - CGRectGetMaxX(_headImageView.frame) - LEFT_MARGIN , 40)];   _titleLabel.font = [UIFont systemFontOfSize:15.0];
    _titleLabel.backgroundColor = [UIColor clearColor];
    _titleLabel.numberOfLines = 2;
    [self.contentView addSubview:_titleLabel];
    
    _timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_headImageView.frame),70- LEFT_MARGIN-20, self.bounds.size.width - CGRectGetMaxX(_headImageView.frame) - LEFT_MARGIN , 20)];
    _timeLabel.font = [UIFont systemFontOfSize:14.0];
    _timeLabel.textColor = [UIColor grayColor];
    _timeLabel.backgroundColor = [UIColor clearColor];
    _timeLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:_timeLabel];
}

-(void)setInfoDict:(NSDictionary *)infoDict
{
    [_headImageView sd_setImageWithURL:infoDict[@"image"] placeholderImage:[UIImage imageNamed:@""]];
    _titleLabel.text = infoDict[@"title"];
    [_titleLabel sizeToFit];
    _timeLabel.text = infoDict[@"time"];
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
