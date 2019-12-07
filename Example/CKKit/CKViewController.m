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
    
    // 不可变数组
    NSArray *array1 = [NSArray new];
    array1[0];
    array1[10];
    
    // 可变数组
    NSMutableArray *array = [NSMutableArray array];
    [array insertObject:@"ddd" atIndex:1];
    [array replaceObjectAtIndex:1 withObject:@""];
    array[0];
    array[10];
    
    // 可变字典
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:
             nil forKey:@""];
    id obj = [dict objectForKey:@""];
    
    NSString *strdict = nil;
//    NSDictionary *dict1 = [[NSDictionary alloc] initWithObjectsAndKeys:@"",nil,@"",@"", nil];
    
    NSDictionary *dict3 = [[NSDictionary alloc] initWithObjectsAndKeys:nil,@"",@"",@"sds", nil];
    
    // 字符串
    NSString *str = [@"" stringByAppendingString:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
