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
    
    
    [self buttonMovingToTheRight];
//    [UIView beginAnimations:nil
//                    context:nil];
//    [UIView setAnimationDuration:4.0];
//    [UIView setAnimationDelegate:self];
//    [UIView commitAnimations];
//    [self buttonMovingToTheLeft];
    
    
//    [UIView beginAnimations:nil
//                    context:nil];
//    [UIView setAnimationDelay:4.0f];
//    [UIView setAnimationDuration:1.5f];
//    [UIView setAnimationDelegate:self];
//    [UIView setAnimationRepeatAutoreverses:YES];
//    [UIView setAnimationRepeatCount:CGFLOAT_MAX];
//    
//    self.button.transform = CGAffineTransformMakeRotation(M_PI);
//    
//    [UIView commitAnimations];
    
}

- (void) buttonMovingToTheRight {
    CABasicAnimation* pulseAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    [pulseAnimation setFromValue:[NSValue valueWithCGPoint:self.button.frame.origin]];
    [pulseAnimation setToValue:[NSValue valueWithCGPoint:CGPointMake(self.button.frame.origin.x+250, self.button.frame.origin.y)]];
    pulseAnimation.duration = 4.0;
    [pulseAnimation setFillMode:kCAFillModeForwards];
    [pulseAnimation setRemovedOnCompletion:NO];
    [[self.button layer] addAnimation:pulseAnimation forKey:@"position"];


    [UIView beginAnimations:nil
                    context:nil];
    [UIView setAnimationDelay:4.0f];
    [UIView setAnimationDuration:1.5f];
    [UIView setAnimationDelegate:self];

    self.button.transform = CGAffineTransformMakeRotation(M_PI);

    [UIView commitAnimations];
    [self buttonMovingToTheLeft];
    
}

- (void) buttonMovingToTheLeft {
    CABasicAnimation* pulseAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    [pulseAnimation setFromValue:[NSValue valueWithCGPoint:CGPointMake(self.button.frame.origin.x+250, self.button.frame.origin.y)]];
    [pulseAnimation setToValue:[NSValue valueWithCGPoint:CGPointMake(self.button.frame.origin.x, self.button.frame.origin.y)]];
    
    pulseAnimation.duration = 4.0;
    [pulseAnimation setFillMode:kCAFillModeForwards];
    [pulseAnimation setRemovedOnCompletion:NO];
    [[self.button layer] addAnimation:pulseAnimation forKey:@"position"];
    
    [UIView beginAnimations:nil
                    context:nil];
    [UIView setAnimationDelay:4.0f];
    [UIView setAnimationDuration:1.5f];
    [UIView setAnimationDelegate:self];
    
    self.button.transform = CGAffineTransformMakeRotation(M_PI * 2);
    
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
