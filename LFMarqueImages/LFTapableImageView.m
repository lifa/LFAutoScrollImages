//
//  LFTapableImageView.m
//  LFMarqueImages
//
//  Created by lifa on 5/22/13.
//
//

#import "LFTapableImageView.h"

@implementation LFTapableImageView

@synthesize info = info_, delegate = delegate_;

- (id)initWithFrame:(CGRect)frame taget:(id)target info:(id)userInfo
{
    self = [super initWithFrame:frame];
    if (self) {
        self.info = userInfo;
        delegate_ = target;
        
        // Initialization code
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap)] autorelease];
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void)handleTap
{
    if ([delegate_ respondsToSelector:@selector(tappedImage:info:)])
    {
        [delegate_ tappedImage:self info:info_];
    }
}

@end
