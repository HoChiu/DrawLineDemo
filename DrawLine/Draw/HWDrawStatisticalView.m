//
//  HWDrawStatisticalView.m
//  iMagReader
//
//  Created by Howe on 16/7/5.
//
//  画折线图背景

#import "HWDrawStatisticalView.h"
#import "UIColor+HexString.h"
@interface HWDrawStatisticalView()

@end

@implementation HWDrawStatisticalView
- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

-(void)drawRect:(CGRect)rect
{
    [[UIColor whiteColor]set];
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGFloat W = rect.size.width - rect.origin.x;
    CGFloat H = rect.size.height - rect.origin.y ;
    CGFloat itemW = W/8.0f;
    CGFloat itemH = H/5.0f;
    
    //画背景色块
    [[UIColor colorWithHexString:@"#F9FBFF"]set];
    for (int i = 0 ; i<7; i+=2)
    {
        CGContextFillRect(ctx, CGRectMake(i * itemW, 0.0f, itemW, H));
        CGContextFillPath(ctx);
    }
    
    //画横线
    
    [[UIColor colorWithHexString:@"#E4ECF8"]set];
    CGContextSetLineWidth(ctx, 1.0f);
    CGContextMoveToPoint(ctx, 0.0f, H-1);
    CGContextAddLineToPoint(ctx, W, H-1);
    CGContextStrokePath(ctx);
    
    for (int i = 1; i<5; i++)
    {
        CGContextSetLineWidth(ctx, 0.5f);
        [[UIColor colorWithHexString:@"#F0F6FF"]set];
        CGContextMoveToPoint(ctx, 0.0f, H-itemH*i);
        CGContextAddLineToPoint(ctx, W, H-itemH*i);
        CGContextStrokePath(ctx);
    }
    
    //画竖线
    CGContextSetLineWidth(ctx, 0.5f);
    [[UIColor colorWithHexString:@"#DAE6FC"]set];
    CGContextMoveToPoint(ctx, 0.0+0.5f, 0);
    CGContextAddLineToPoint(ctx,0.0+0.5f, H);
    CGContextStrokePath(ctx);
    
    for (int i = 1; i<10; i++)
    {
        CGContextSetLineWidth(ctx, 0.5f);
        [[UIColor colorWithHexString:@"#DAE6FC"]set];
        CGContextMoveToPoint(ctx, itemW *i, 0);
        CGContextAddLineToPoint(ctx,itemW *i, H);
        CGContextStrokePath(ctx);
    }

    
    
    
}

@end
