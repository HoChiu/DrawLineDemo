//
//  HWReadStatisticalView.m
//  iMagReader
//
//  Created by Howe on 16/7/5.
//
// 我的阅历 折线图

#import "HWReadStatisticalView.h"
#import "HWDrawStatisticalView.h"
#import "UIColor+HexString.h"
#import "Masonry.h"

@interface HWReadStatisticalView()

@property (nonatomic, weak) UILabel *readTimeLabel;

@property (nonatomic, weak) HWDrawStatisticalView *drawView ;

@end


@implementation HWReadStatisticalView
- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self setupView];
    }
    return self;
}

- (void)setupView;
{
    self.backgroundColor = [UIColor whiteColor];
    HWDrawStatisticalView *drawView = HWDrawStatisticalView.new;
    [self addSubview:drawView];
    self.drawView = drawView;
    [drawView mas_makeConstraints:^(MASConstraintMaker *make)
    {
        make.top.mas_equalTo(52.0f);
        make.left.mas_equalTo(14.0f);
        make.right.mas_equalTo(-14.0f);
        make.height.mas_equalTo(131);
    }];
    [self setupDrawText];
    [self setupDrawLine];
}

- (void)setupDrawLine
{
    
    CAShapeLayer *lineChart = [CAShapeLayer layer];
    lineChart.fillColor = [UIColor clearColor].CGColor;
    lineChart.lineCap = kCALineCapRound;
    lineChart.lineJoin = kCALineJoinRound;
    lineChart.strokeColor= [UIColor colorWithHexString:@"#6F9BDE"].CGColor;
    lineChart.lineWidth = 3.0f;
    
    [self.layer addSublayer:lineChart];
    
    NSArray *pointArray = @[@(0.1),@(0.7),@(1.1),@(2.1),@(1.5),@(0.0),@(3.0),@(1.1)];
    
    CGFloat W = [UIScreen mainScreen].bounds.size.width -28;
    CGFloat itemW = W/8.0f;
    CGFloat itemH = 131.0f/5.0f;
    CGFloat xMargin = 14.0f;
    CGFloat yMargin = 52.0f;
    CGFloat startX = xMargin;
    CGFloat startY = yMargin + itemH * 5.0f;
    
    UIBezierPath *progressline=[UIBezierPath bezierPath];
    
    NSNumber *startValue = [pointArray objectAtIndex:pointArray.count -1];
    CGFloat startPointValue = [startValue floatValue];
    
    CGFloat startPointX = startX;
    CGFloat startPointY = 0.0f;
    if (startPointValue < 0.5f)
    {
        startPointValue = 0.5f;
    }
    //画第一个点  Y值为最后一点
    startPointY = startY - itemH * startPointValue;
    [progressline moveToPoint:CGPointMake(startPointX, startPointY)];
    
    for (int i = 0; i< pointArray.count -1; i++)
    {
        NSNumber *value = [pointArray objectAtIndex:i];
        CGFloat pointValue = [value floatValue];
        if (pointValue < 0.5f)
        {
            pointValue = 0.5f;
        }
        CGFloat x = startX + itemW + itemW * i;
        CGFloat y = startY - itemH * pointValue;
        [progressline addLineToPoint:CGPointMake(x,y)];
        
    }
    //画最后一个点
    CGFloat endPointX = startX + itemW + itemW * (pointArray.count -1);
    CGFloat endPointY = startPointY;
    [progressline addLineToPoint:CGPointMake(endPointX,endPointY)];
    [progressline stroke];
//    [progressline moveToPoint:CGPointMake(endPointX + 6+3, endPointY)];
//    [progressline setLineWidth:2.0f];
//    //画结束点的圆圈
//    [progressline addArcWithCenter:CGPointMake(endPointX + 6, endPointY) radius:4 startAngle:0.0f endAngle:M_PI * 2 clockwise:YES];

    lineChart.path = progressline.CGPath;
    
    //动画
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = @(0.0);
    animation.toValue = @(1.0);
    lineChart.autoreverses = NO;
    animation.duration = 1.5;
    [lineChart addAnimation:animation forKey:nil];
    lineChart.strokeEnd = 1;

}

/**
 *  画折线图底部 值 文字信息
 */
- (void)setupDrawText
{
    CGFloat W = [UIScreen mainScreen].bounds.size.width;
    __block CGFloat itemW = W/8.0f;
    NSArray *timeArray = @[@"00:00",@"06:00",@"12:00",@"18:00",@"24:00"];
    __block NSInteger count = timeArray.count;
    __weak __typeof(self) weakSelf = self;
    for (int i = 0; i<count; i++)
    {
        
        __strong UILabel *label = UILabel.new;
        label.text = timeArray[i];
        label.textColor = [UIColor colorWithHexString:@"#949494"];
        label.font = [UIFont systemFontOfSize:9.0f];
        [self addSubview:label];
        __block NSInteger index = i;
        
        [label mas_makeConstraints:^(MASConstraintMaker *make)
         {
             if (index == 0)
             {
                 label.textAlignment = NSTextAlignmentLeft;
                 make.bottom.equalTo(weakSelf);
                 make.left.equalTo(weakSelf).offset(14.0f);
                 make.height.mas_equalTo(11.0f);
                 make.width.mas_equalTo(itemW);
             }else if(index == count-1)
             {
                 label.textAlignment = NSTextAlignmentRight;
                 make.bottom.equalTo(weakSelf);
                 make.right.equalTo(weakSelf).offset(-14.0f);
                 make.height.mas_equalTo(11.0f);
                 make.width.mas_equalTo(itemW);
             }else
             {
                 label.textAlignment = NSTextAlignmentCenter;
                 make.bottom.equalTo(weakSelf);
                 make.width.mas_equalTo(itemW*2);
                 make.height.mas_equalTo(11.0f);
                 make.left.mas_equalTo(itemW + (i-1) *(itemW *2) + 14.0f);
             }
         }];
    }
}

//- (void)drawRect:(CGRect)rect
//{
//
//}


@end
