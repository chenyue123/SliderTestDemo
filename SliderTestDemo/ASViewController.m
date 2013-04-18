//
//  ASViewController.m
//  SliderTestDemo
//
//  Created by  on 13-4-17.
//  Copyright (c) 2013年 Alpha Studio. All rights reserved.
//

#import "ASViewController.h"
#import <QuartzCore/QuartzCore.h>
static const CGPoint kBTSPathEndPoint = {300.0, 300.0};
@implementation ASViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (void)addPathAnimationToLayer:(CALayer *)aLayer shouldRepeat:(BOOL)shouldRepeat
{
    [aLayer removeAllAnimations];
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    [animation setPath:_path];
    [animation setDuration:2.5];
    [animation setCalculationMode:kCAAnimationCubic];
    [animation setRotationMode:kCAAnimationRotateAuto];
    if (shouldRepeat) {
        [animation setAutoreverses:YES];
        [animation setRepeatCount:MAXFLOAT];
    }else{
        [animation setAutoreverses:NO];
        [animation setRepeatCount:1];
        [aLayer setPosition :kBTSPathEndPoint];
    }
    [aLayer addAnimation:animation forKey:@"position"];
}
-(void)buttonPressed:(id)sender
{
    [self addPathAnimationToLayer:layer shouldRepeat:NO];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	_path = CGPathCreateMutable();
    CGPathMoveToPoint(_path, NULL, 15.0, 15.0);
    CGPathAddLineToPoint(_path, NULL, 100.0, 100.0);
//    CGPathAddArc(_path, NULL, 100.0, 100.0, 75.0, 0.0, (CGFloat)M_PI, 1);
//    CGPathAddLineToPoint(_path, NULL, 15.0, 100.0);
    CGPathAddLineToPoint(_path, NULL, 200.0, 150.0);
    CGPathAddLineToPoint(_path, NULL, 300.0, 300.0);
//    CGPathAddCurveToPoint(_path, NULL, 150.0, 150.0, 50.0, 350.0, kBTSPathEndPoint.x, kBTSPathEndPoint.y);
    
    layer = [CALayer layer];
    [layer setShadowColor:[UIColor blackColor].CGColor];
    [layer setContents:(__bridge id)[UIImage imageNamed:@"american-flag.png"].CGImage];
    [layer setBounds:CGRectMake(0.0, 0.0, 75.0, 75.0)];
    [layer setPosition:CGPointMake(15.0, 15.0)];
    [layer setShadowPath:[UIBezierPath bezierPathWithRect:[layer bounds]].CGPath];
    [layer setShadowOpacity:0.8];
    [layer setShadowOffset:CGSizeMake(5.0, 5.0)];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(1, 400, 50, 35);
    [button setTitle:@"Start" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    [[[self view] layer] addSublayer:layer];
    
//    [self addPathAnimationToLayer:layer shouldRepeat:NO];
    
//    [[[self view] layer] setContentsScale:[[UIScreen mainScreen] scale]];
//    [[[self view]layer]setContentsScale:0.2];
    
//    [[[self view] layer] setDelegate:self];
//    [[[self view] layer] setNeedsDisplay];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
