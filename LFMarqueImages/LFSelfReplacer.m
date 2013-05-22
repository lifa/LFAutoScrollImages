//
//  LFSelfReplacer.m
//  LFMarqueImages
//
//  Created by lifa on 5/22/13.
//
//

#import "LFSelfReplacer.h"

@implementation LFSelfReplacer

- (id)initWithObject:(NSObject *)obj selector:(NSString *)sel
{
    if (self = [super init])
    {
        realObject = obj;
        selector = [[NSString alloc] initWithString:sel];
    }
    return self;
}

- (void)fireTimer
{
    [realObject performSelector:NSSelectorFromString(selector)];
}

-(void)dealloc
{
    [selector release];
    [super dealloc];
}

@end
