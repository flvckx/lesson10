//
//  ViewController.m
//  sample3
//
//  Created by Anton Lookin on 1/18/16.
//  Copyright © 2016 geekub. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidLayoutSubviews {
	[super viewDidLayoutSubviews];
}


- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
    
    CABasicAnimation* pulseAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    [pulseAnimation setFromValue:[NSValue valueWithCGPoint:self.button.frame.origin]];
    [pulseAnimation setToValue:[NSValue valueWithCGPoint:CGPointMake(self.button.frame.origin.x+380, self.button.frame.origin.y)]];
    pulseAnimation.duration = 4.0;
    pulseAnimation.repeatCount = CGFLOAT_MAX;
    pulseAnimation.autoreverses = YES;
    pulseAnimation.cumulative = NO;
    [[self.button layer] addAnimation:pulseAnimation forKey:@"position"];
    
    
    [UIView beginAnimations:nil
                    context:nil];
    [UIView setAnimationDelay:4.0f];
    [UIView setAnimationDuration:1.5f];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationRepeatAutoreverses:YES];
    [UIView setAnimationRepeatCount:CGFLOAT_MAX];
    
    self.button.transform = CGAffineTransformMakeRotation(M_PI);
    
    [UIView commitAnimations];
    
}



- (IBAction)buttonTapped:(id)sender {
	NSLog(@"Tap");
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInView:self.view];
    if ([self.button.layer.presentationLayer hitTest:touchLocation]) {
        NSLog(@"Tap");
    }
}

@end
