//
//  LFViewController.m
//  LFMarqueImages
//
//  Created by lifa on 5/22/13.
//
//

#import "LFViewController.h"
#import "LFImageModel.h"

@interface LFViewController ()

@end

@implementation LFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    urls_ = [[NSMutableArray arrayWithCapacity:3] retain];
    LFImageModel *md = [LFImageModel new];
    md.url = @"";
    [urls_ addObject:md];
    md = [LFImageModel new];
    md.url = @"";md = [LFImageModel new];
    [urls_ addObject:md];
    md = [LFImageModel new];
    md.url = @"";
    [urls_ addObject:md];
    
    self.view.backgroundColor = [UIColor whiteColor];
    CGRect re = self.view.bounds;// CGRectMake(0, 0, 320, 400);
    marquee_ = [[LFMarqueeView alloc] initWithFrame:re list:urls_];
    [self.view addSubview:marquee_];
}

-(void)dealloc
{
    [marquee_ release];
    [urls_ release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
