//
//  ViewController.m
//  DynamicTask
//
//  Created by Anatoliy on 1/30/16.
//  Copyright © 2016 mobex. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

- (IBAction)longPressDetected:(UILongPressGestureRecognizer *)sender;

@end

@implementation ViewController {
    UIDynamicAnimator *_animator;
    UIGravityBehavior *_gravity;
    UICollisionBehavior *_collision;
    UIPushBehavior *_push;
    BOOL _firstContact;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    _gravity = [[UIGravityBehavior alloc] init];
    [_animator addBehavior:_gravity];
    
    _collision = [[UICollisionBehavior alloc] init];
    _collision.translatesReferenceBoundsIntoBoundary = YES;
    [_animator addBehavior:_collision];
    
    UICollisionBehavior *squareCollision = [[UICollisionBehavior alloc] init];
    squareCollision.collisionDelegate = self;
    squareCollision.translatesReferenceBoundsIntoBoundary = YES;
    
    UICollisionBehavior *circleCollision = [[UICollisionBehavior alloc] init];
    circleCollision.collisionDelegate = self;
    circleCollision.translatesReferenceBoundsIntoBoundary = YES;

    [_animator addBehavior:squareCollision];
    [_animator addBehavior:circleCollision];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)collisionBehavior:(UICollisionBehavior*)behavior beganContactForItem:(id <UIDynamicItem>)item1 withItem:(id <UIDynamicItem>)item2 atPoint:(CGPoint)p {
    
    UIPushBehavior *push = [[UIPushBehavior alloc] initWithItems:@[item1, item2] mode:UIPushBehaviorModeInstantaneous];
    push.magnitude = M_PI / 2;
    push.angle = -M_PI / 2;
    [_animator addBehavior:push];
}
//
//- (void) willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
//    if (UIInterfaceOrientationIsPortrait(toInterfaceOrientation)) {
//        _gravity.gravityDirection = CGVectorMake(0.0, 1.0);
//    } else {
//        _gravity.gravityDirection = CGVectorMake(0.0, -1.0);
//    }
//}

- (IBAction)longPressDetected:(UILongPressGestureRecognizer *)sender {
    CGPoint point = [sender locationInView:self.view];
    
    int random = arc4random()%2;
    
    if (random) {
        UIView *square = [[UIView alloc] initWithFrame:CGRectMake(point.x, point.y, 50, 50)];
        square.backgroundColor = [UIColor redColor];
        [self.view addSubview:square];
        [_gravity addItem:square];
        [_collision addItem:square];
        
        UIDynamicItemBehavior* itemBehaviour = [[UIDynamicItemBehavior alloc] initWithItems:@[square]];
        itemBehaviour.elasticity = 0.6;
        [_animator addBehavior:itemBehaviour];
        
        
        UIPushBehavior* push = [[UIPushBehavior alloc] initWithItems:@[] mode:UIPushBehaviorModeContinuous];
        [push setAngle:-M_PI/2 magnitude:8.0f];
        [_animator addBehavior:push];
        
    } else {
        UIView *circle = [[UIView alloc] initWithFrame:CGRectMake(point.x, point.y, 50, 50)];
        circle.backgroundColor = [UIColor redColor];
        circle.layer.cornerRadius = circle.bounds.size.width/2;
        circle.clipsToBounds = YES;
        
        circle.layer.borderColor = [UIColor redColor].CGColor;
        circle.layer.borderWidth = 1;
        [self.view addSubview:circle];
        [_gravity addItem:circle];
        [_collision addItem:circle];
        
        UIDynamicItemBehavior* itemBehaviour = [[UIDynamicItemBehavior alloc] initWithItems:@[circle]];
        itemBehaviour.elasticity = 0.6;
        [_animator addBehavior:itemBehaviour];
    }
}
@end
