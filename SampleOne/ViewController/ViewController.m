//
//  ViewController.m
//  SampleOne
//
//  Created by NHN on 2021/03/30.
//

#import "ViewController.h"
#import "MovieListViewController.h"

@implementation ViewController
{
    UIImageView *mImageView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //[self Greeting: @"iOS"];
    //[self Greeting2: 10];
    mImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"movieDuck"]];
    [self.view addSubview:mImageView];
    [mImageView sizeToFit];
    
    // Case 1.
    /*
    CGFloat x = self.view.frame.origin.x + (self.view.frame.size.width - mImageView.frame.size.width)/2;
    CGFloat y = self.view.frame.origin.y + (self.view.frame.size.height - mImageView.frame.size.height)/2;
    
    mImageView.frame = CGRectMake(x, y, mImageView.frame.size.width, mImageView.frame.size.height);
    */
    
    // AutoLayout
    mImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
        [self.view.centerYAnchor constraintEqualToAnchor:mImageView.centerYAnchor],
        [self.view.centerXAnchor constraintEqualToAnchor:mImageView.centerXAnchor]
    ]];
    
    
    mImageView.alpha = 0.0;
    
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // move to center of screen
//    [UIView animateWithDuration:3 animations:^{
//        CGFloat x = self.view.frame.origin.x + (self.view.frame.size.width - self->mImageView.frame.size.width)/2;
//        CGFloat y = self.view.frame.origin.y + (self.view.frame.size.height - self->mImageView.frame.size.height)/2;
//
//        self->mImageView.frame = CGRectMake(x, y, self->mImageView.frame.size.width, self->mImageView.frame.size.height);
//    }];
    
//    [UIView animateWithDuration:3 animations:^{
//        CGFloat alphaValue = 1.0;
//
//        self->mImageView.alpha = alphaValue;
//    }];
    
    [UIView animateWithDuration:3 animations:^{
        CGFloat alphaValue = 1.0;
        
        self->mImageView.alpha = alphaValue;
    } completion:^(BOOL finished) {
        MovieListViewController* sViewController = [[MovieListViewController alloc] initWithNibName:nil bundle:nil];
        UINavigationController* sNavigationController = [[UINavigationController alloc] initWithRootViewController:sViewController];
        [self presentViewController:sNavigationController animated:YES completion:nil]; //push도 있음
    }];
}
- (void)Greeting : (NSString*) message {
    NSLog(@"Hello %@", message);
}

- (void)Greeting2 : (NSInteger) number {
    NSLog(@"Hello2 %ld", number);
}
@end
