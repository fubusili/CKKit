//
//  NSString+CKCrash.m
//  CKKit
//
//  Created by Clark on 2019/12/7.
//

#import "NSString+CKCrash.h"
#import <objc/runtime.h>
#import "NSObject+CKSwizzling.h"

@implementation NSString (CKCrash)
+ (void)load {
#ifndef DEBUG
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleInstanceMethod:NSClassFromString(@"__NSCFConstantString") originSel:@selector(stringByAppendingString:) swizzleSel:@selector(ck_stringByAppendingString:)];
        
    });
#endif
}
- (id)ck_stringByAppendingString:(NSString *)str {
    if (!str) {
        return nil;
    }
    return [self ck_stringByAppendingString:str];
}
@end
