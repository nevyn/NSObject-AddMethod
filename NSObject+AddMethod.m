#import "NSObject+AddMethod.h"

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

static id trampoline(id self, SEL _cmd) {
	id(^block)(id, SEL) = objc_getAssociatedObject([self class], _cmd);
	return block(self, _cmd);
}


@implementation NSObject (AddMethod)

+(BOOL)addMethodForSelector:(SEL)selector typed:(const char*)types implementation:(id)blockPtr;
{
	objc_setAssociatedObject(self, selector, blockPtr, OBJC_ASSOCIATION_COPY);
	
	class_addMethod(self, selector, (IMP)trampoline, types);
	
	return YES;
}

@end