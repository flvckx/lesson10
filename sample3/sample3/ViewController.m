//
//  ViewController.m
//  sample3
//
//  Created by Anton Lookin on 1/18/16.
//  Copyright © 2016 geekub. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *xconstraint;
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
}

- (IBAction)buttonTapped:(id)sender {
	NSLog(@"Tap");
}

- (void) buttonMovingToTheLeft {
    for (NSLayoutConstraint *constraint in self.view.constraints) {
        if (constraint.firstAttribute == NSLayoutAttributeCenterX) {
            constraint.constant = -180.0f;
            break;
        }
    }
    
    [UIView animateWithDuration:4.0
                          delay:0.0f
                        options:UIViewAnimationOptionAllowUserInteraction
                     animations:^(void) {
                         [self.view layoutIfNeeded];
                     }
                     completion:^(BOOL finished){
                         if (finished) {
                             [UIView animateWithDuration:1.8
                                                   delay:0.0f
                                                 options:UIViewAnimationOptionAllowUserInteraction
                                              animations:^(void) {
                                                  self.button.transform = CGAffineTransformMakeRotation(M_PI * 2);
                                              }
                                              completion:^(BOOL finished){
                                                  if (finished) {
                                                      [self buttonMovingToTheRight];
                                                    }
                                              }];
                         }
                     }];
}

- (void) buttonMovingToTheRight {
    for (NSLayoutConstraint *constraint in self.view.constraints) {
        if (constraint.firstAttribute == NSLayoutAttributeCenterX) {
            constraint.constant = 180.0f;
            break;
        }
    }
    
    [UIView animateWithDuration:4.0
                          delay:0.0f
                        options:UIViewAnimationOptionAllowUserInteraction
                     animations:^(void) {
                         [self.view layoutIfNeeded];
                     }
                     completion:^(BOOL finished){
                         if (finished) {
                             [UIView animateWithDuration:1.8
                                                   delay:0.0f
                                                 options:UIViewAnimationOptionAllowUserInteraction
                                              animations:^(void) {
                                                  self.button.transform = CGAffineTransformMakeRotation(M_PI);
                                              }
                                              completion:^(BOOL finished){
                                                  if (finished) {
                                                      [self buttonMovingToTheLeft];
                                                  }
                                              }];
                         }
                     }];
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
