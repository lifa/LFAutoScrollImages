//
//  LFMarqueeView.h
//  LFMarqueImages
//
//  Created by lifa on 5/22/13.
//
//

#import <UIKit/UIKit.h>
#import "LFSelfReplacer.h"
#import "LFTapableImageView.h"

@class  SelfReplacer;

@interface LFMarqueeView : UIView <LFTapImageDelegate, UIScrollViewDelegate>
{
    UIScrollView *containerView_;
    UIPageControl  *pc_;
    CGRect pcRect;

    NSTimer         *repeatTimer;
    SelfReplacer    *timerOwner;

    NSTimeInterval  timerInterval;

    NSArray     *datas_;
}
@property (nonatomic, retain) NSArray *datas;

- (id)initWithFrame:(CGRect)frame list:(NSArray*)list;

//delegate
-(void)tappedImage:(UIImageView *)image info:(id)userinfo;


@end


