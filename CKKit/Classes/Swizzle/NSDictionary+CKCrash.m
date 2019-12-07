//
//  NSDictionary+CKCrash.m
//  CKKit
//
//  Created by Clark on 2019/12/7.
//

#import "NSDictionary+CKCrash.h"
#import <objc/runtime.h>
#import "NSObject+CKSwizzling.h"
@implementation NSDictionary (CKCrash)
+ (void)load {
#ifndef DEBUG
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 可变字典
        // 设置
        [self swizzleInstanceMethod:NSClassFromString(@"__NSDictionaryM") originSel:@selector(setObject:forKey:) swizzleSel:@selector(ck_setObject:forKey:)];
        
        // 获取
//        [self swizzleInstanceMethod:NSClassFromString(@"__NSDictionaryM") originSel:@selector(objectForKey:) swizzleSel:@selector(ck_objectForKey:)];
//      // 删除
//        [self swizzleInstanceMethod:NSClassFromString(@"__NSDictionaryM") originSel:@selector(removeObjectForKey:) swizzleSel:@selector(ck_removeObjectForKey:)];
        
        [self swizzleInstanceMethod:NSClassFromString(@"__NSPlaceholderDictionary") originSel:@selector(initWithObjects:forKeys:count:) swizzleSel:@selector(ck_initWithObjects:forKeys:count:)];
    });
#endif
}

- (void)ck_setObject:(id)obj forKey:(NSString *)key {
    if (!key) {
        return;
    }
    if (!obj) {
        obj = [NSNull null];
    }
    [self ck_setObject:obj forKey:key];
}

- (id)ck_objectForKey:(NSString *)key {
    if (!key) {
        return nil;
    }
    return [self ck_objectForKey:key];
}

- (void)ck_removeObjectForKey:(NSString *)key {
    if (!key) {
        return;
    }
    [self ck_removeObjectForKey:key];
}

- (instancetype)ck_initWithObjects:(const id [])objects forKeys:(const id<NSCopying> [])keys count:(NSUInteger)index {
    id safeObjects[index];
    id safeKeys[index];
    NSUInteger j = 0;
    for (NSUInteger i = 0; i < index; i++) {
        id key = keys[i];
        id obj = objects[i];
        if (!key) {
            continue;
        }
        if (!obj) {
            obj = [NSNull null];
        }
        safeKeys[j] = key;
        safeObjects[j] = obj;
        j++;
    }
    return [self ck_initWithObjects:safeObjects forKeys:safeKeys count:j];
}

@end
