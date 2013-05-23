//
//  LFViewController.h
//  LFMarqueImages
//
//  Created by lifa on 5/22/13.
//
//

#import <UIKit/UIKit.h>
#import "LFMarqueeView.h"

@interface LFViewController : UIViewController
{
    NSMutableArray             *urls_;
    LFMarqueeView       *marquee_;
}

@end
