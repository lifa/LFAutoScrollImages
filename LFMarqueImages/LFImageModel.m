//
//  LFImageModel.m
//  LFMarqueImages
//
//  Created by lifa on 5/22/13.
//
//

#import "LFImageModel.h"

@implementation LFImageModel

@synthesize url = url_;

-(void)dealloc
{
    [url_ release];
    [super dealloc];
}

@end
