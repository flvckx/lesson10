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
    //thanks to madlax19 commits
    [self buttonMovingToTheRight];
}

- (void) buttonMovingToTheRight {
    CGRect rect = self.button.frame;
    rect.origin.x = self.view.bounds.size.width - self.button.bounds.size.width;
    [UIView beginAnimations:@"MoveToRight" context:nil];
    [UIView setAnimationDuration:3.4];
    [UIView setAnimationDelay:0.0];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(makeFirstRotation)];

    self.button.frame = rect;

    [UIView commitAnimations];
}

- (void) makeFirstRotation {
    [UIView beginAnimations:@"ButtonRotateFirst" context:nil];
    [UIView setAnimationDuration:1.5];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(buttonMovingToTheLeft)];

    self.button.transform = CGAffineTransformRotate(self.button.transform, M_PI);
    [UIView commitAnimations];
}

- (void) buttonMovingToTheLeft {
    CGRect rect = self.button.frame;
    rect.origin.x = 0;
    [UIView beginAnimations:@"MoveToLeft" context:nil];
    [UIView setAnimationDuration:3.4];
    [UIView setAnimationDelay:0.0];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(makeSecondRotation)];

    self.button.frame = rect;

    [UIView commitAnimations];
   
}

- (void) makeSecondRotation {
    [UIView beginAnimations:@"ButtonRotateFirst" context:nil];
    [UIView setAnimationDuration:1.5];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(buttonMovingToTheRight)];
    
    self.button.transform = CGAffineTransformRotate(self.button.transform, M_PI);
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
