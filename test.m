//
//  test.m
//  NSObject+AddMethod
//
//  Created by Joachim Bengtsson on 2009-08-28.
//  Copyright 2009 Third Cog Software. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "NSObject+AddMethod.h"

@interface Foo : NSObject
{
}
@end
@implementation Foo
@end


int main (int argc, const char * argv[]) {
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	
	[Foo addMethodForSelector:@selector(testing) typed:"v@:" implementation:^ (id self, SEL _cmd) {
		NSLog(@"Woah, nice! Called %@", NSStringFromSelector(_cmd));
	}];
	
	[[Foo new] testing];
	
	
	[pool drain];
	return 0;
}
