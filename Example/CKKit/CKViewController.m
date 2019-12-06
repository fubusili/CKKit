//
//  CKViewController.m
//  CKKit
//
//  Created by fubusili on 12/06/2019.
//  Copyright (c) 2019 fubusili. All rights reserved.
//

#import "CKViewController.h"

@interface CKViewController ()

@end

@implementation CKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSMutableArray *array = [NSMutableArray array];
    [array insertObject:@"ddd" atIndex:1];
    
    [array replaceObjectAtIndex:1 withObject:@""];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
