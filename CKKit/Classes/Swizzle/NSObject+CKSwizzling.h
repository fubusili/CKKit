//
//  NSObject+CKSwizzling.h
//  CKKit
//
//  Created by Clark on 2019/12/6.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (CKSwizzling)
/// 实例方法交换
+ (BOOL)swizzleInstanceMethod:(Class)class originSel:(SEL)originSel swizzleSel:(SEL)swizzleSel;

/// 类方法交换
+ (BOOL)swizzleClassMethod:(Class)class originSel:(SEL)originSel swizzleSel:(SEL)swizzleSel;
@end

NS_ASSUME_NONNULL_END
