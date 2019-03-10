//
//  ViewController.m
//  TDirectionView
//
//  Created by zdmr on 03/08/2019.
//  Copyright (c) 2019 zdmr. All rights reserved.
//

#import "ViewController.h"
#import "TDirectionView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet TDirectionView *steppedView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_steppedView setNumberOfPoints:5];
    });
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
