//
//  LFTapableImageView.h
//  LFMarqueImages
//
//  Created by lifa on 5/22/13.
//
//

#import <UIKit/UIKit.h>

@protocol LFTapImageDelegate <NSObject>
@required
- (void)tappedImage:(UIImageView*)image info:(id)userinfo;
@end


@interface LFTapableImageView : UIImageView
{
    id info_;
    id<LFTapImageDelegate> delegate_;
}

@property (nonatomic, retain) id info;
@property (nonatomic, assign) id<LFTapImageDelegate> delegate;

//- (id)initWithFrame:(CGRect)frame taget:(id)target action:(SEL)selector;
- (id)initWithFrame:(CGRect)frame taget:(id)target info:(id)userInfo;

@end

