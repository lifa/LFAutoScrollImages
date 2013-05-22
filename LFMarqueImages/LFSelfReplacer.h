//
//  LFSelfReplacer.h
//  LFMarqueImages
//
//  Created by lifa on 5/22/13.
//
//

#import <Foundation/Foundation.h>

@interface LFSelfReplacer : NSObject
{
    id      realObject;
    NSString *selector;
}
- (id)initWithObject:(NSObject *)obj selector:(NSString*)sel;
- (void)fireTimer;

@end