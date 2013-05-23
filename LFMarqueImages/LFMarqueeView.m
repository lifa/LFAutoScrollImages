//
//  LFMarqueeView.m
//  LFMarqueImages
//
//  Created by lifa on 5/22/13.
//
//

#import "LFMarqueeView.h"
#import <QuartzCore/QuartzCore.h>
#import "LFImageModel.h"


@implementation LFMarqueeView

- (id)initWithFrame:(CGRect)frame list:(NSArray*)list;
{
    self = [super initWithFrame:frame];
    if (self) {
        timerInterval = 4;
        
        int playerInfoHeight = 44;
        CGRect containerFrame = CGRectMake(0, 0, frame.size.width, CGRectGetHeight(frame) - playerInfoHeight);
        pcRect = CGRectMake(0, CGRectGetMaxY(containerFrame) - 30, frame.size.width,10);
        
        // Initialization code
        containerView_ = [[UIScrollView alloc] initWithFrame:containerFrame];
        containerView_.userInteractionEnabled = YES;
        containerView_.pagingEnabled = YES;
        containerView_.delegate = self;
        containerView_.showsHorizontalScrollIndicator = NO;
        [self addSubview:containerView_];
        
        if ([list count] > 0)
        {
            self.datas = list;
        }

        
    }
    return self;
}

- (void)setDatas:(NSArray *)list
{
    if (list == nil)
        return;
    
    [datas_ release];
    datas_ = [list retain];
    
    CGRect bounds = containerView_.bounds;
    containerView_.contentSize = CGSizeMake([list count] * bounds.size.width, bounds.size.height);
    
    CGFloat x = 0;
    int i = 1;
    for (LFImageModel *it in list) {
        LFTapableImageView *img = [[LFTapableImageView alloc] initWithFrame:bounds taget:self info:it];
        UIImage *im = [UIImage imageNamed:[NSString stringWithFormat:@"%d.png",i]];
        i++;
        [img setImage:im];
        [containerView_ addSubview:img];
        img.frame = CGRectOffset(img.frame, x, img.frame.origin.y);
        [img release];
        x += bounds.size.width;
    }
    
    if (pc_ == nil)
    {
        pc_ = [[UIPageControl alloc] initWithFrame:pcRect];
        [self addSubview:pc_];
        pc_.hidesForSinglePage = YES;
    }
    pc_.numberOfPages = list.count;
    
    if (timerOwner)
    {
        [timerOwner release];
    }
    timerOwner = [[LFSelfReplacer alloc] initWithObject:self selector:NSStringFromSelector(@selector(marquee))];
    if (repeatTimer)
    {
        [repeatTimer invalidate];
        [repeatTimer release];
    }
    repeatTimer = [[NSTimer alloc] initWithFireDate:[NSDate dateWithTimeIntervalSinceNow:timerInterval + 1] interval:timerInterval target:timerOwner selector:@selector(fireTimer) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:repeatTimer forMode:NSRunLoopCommonModes];
}

-(void)tappedImage:(UIImageView *)image info:(id)userinfo
{
    // do action
    NSLog(@"image %@ tapped",userinfo);
}

- (void)marquee
{
    if (containerView_.isDragging)
        return;
    
    int max = [datas_ count];
    int cur = pc_.currentPage;
    cur ++;
    
    CGRect rect;
    if (cur == max)
    {
        cur = 0;
        rect = CGRectMake(containerView_.bounds.size.width * cur, containerView_.contentOffset.y, containerView_.bounds.size.width, containerView_.bounds.size.height);
        [self pushAnimation: rect];
    }
    else
    {
        rect = CGRectMake(containerView_.bounds.size.width * cur, containerView_.contentOffset.y, containerView_.bounds.size.width, containerView_.bounds.size.height);
        [containerView_ scrollRectToVisible:rect animated:YES];
    }
    pc_.currentPage = cur;
}

- (void)dealloc
{
    [containerView_ release];
    [pc_ release];
    [timerOwner release];
    [repeatTimer invalidate];    [repeatTimer release];
    [datas_ release];
    [super dealloc];
}


- (void)pushAnimation:(CGRect)rect
{
    CATransition *ani = [CATransition animation];
    ani.type = kCATransitionPush;
    ani.subtype = kCATransitionFromRight;
    ani.duration = 0.35;
    ani.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    ani.delegate = self;
    [containerView_.layer addAnimation:ani forKey:nil];
    [containerView_ scrollRectToVisible:rect animated:NO];
}

-(void)animationDidStart:(CAAnimation *)anim
{
    self.userInteractionEnabled = NO;
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    self.userInteractionEnabled = YES;
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (repeatTimer)
    {
        [repeatTimer setFireDate:[NSDate distantFuture]];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int idx = (containerView_.contentOffset.x )/ containerView_.bounds.size.width;
    pc_.currentPage = idx;
    
    if (repeatTimer)
    {
        [repeatTimer setFireDate:[NSDate dateWithTimeIntervalSinceNow:timerInterval]];
    }
}


@end



