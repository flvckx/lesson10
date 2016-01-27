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
	
	for (NSLayoutConstraint *constraint in self.view.constraints) {
		if (constraint.firstAttribute == NSLayoutAttributeCenterX) {
			constraint.constant = 180.0f;
			break;
		}
	}

	[UIView animateWithDuration:4.4
						  delay:0.0f
						options:(UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionAutoreverse
                                 | UIViewAnimationOptionRepeat)
					 animations:^(void) {
						 [self.view layoutIfNeeded];
//                         CALayer *presentationLayer = self.button.layer.presentationLayer;
//                         NSLog(@"%f, %f", presentationLayer.position.x, presentationLayer.position.y);
                         self.button.transform = CGAffineTransformMakeRotation(M_PI);
					 }
					 completion:NULL];
    
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
