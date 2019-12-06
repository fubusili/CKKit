//
//  NSObject+CKSwizzling.m
//  CKKit
//
//  Created by Clark on 2019/12/6.
//

#import "NSObject+CKSwizzling.h"
#import <objc/Message.h>

@implementation NSObject (CKSwizzling)
+ (BOOL)swizzleInstanceMethod:(Class)class originSel:(SEL)originSel swizzleSel:(SEL)swizzleSel {
    Method originMethod = class_getInstanceMethod(class, originSel);
    Method swizzleMethod = class_getInstanceMethod(class, swizzleSel);
    if (!originSel || !swizzleSel) {
        return NO;
    }
    
    BOOL didAddMethod = class_addMethod(class, originSel, method_getImplementation(swizzleMethod), method_getTypeEncoding(swizzleMethod));
    if (didAddMethod) {
        class_replaceMethod(class, swizzleSel, method_getImplementation(originMethod), method_getTypeEncoding(originMethod));
    } else {
        method_exchangeImplementations(originMethod, swizzleMethod);
    }
    return YES;
}

+ (BOOL)swizzleClassMethod:(Class)class originSel:(SEL)originSel swizzleSel:(SEL)swizzleSel {
    Method originMethod = class_getClassMethod(class, originSel);
    Method swizzleMethod = class_getClassMethod(class, swizzleSel);
    if (!originSel || !swizzleSel) {
        return NO;
    }
    
    BOOL didAddMethod = class_addMethod(class, originSel, method_getImplementation(swizzleMethod), method_getTypeEncoding(swizzleMethod));
    if (didAddMethod) {
        class_replaceMethod(class, swizzleSel, method_getImplementation(originMethod), method_getTypeEncoding(originMethod));
    } else {
        method_exchangeImplementations(originMethod, swizzleMethod);
    }
    return YES;
}
@end
