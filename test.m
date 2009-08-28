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
@interface Foo (Dynamic)
-(void)voidreturn;
-(id)idreturn;
@end
@implementation Foo
@end


int main (int argc, const char * argv[]) {
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	
	Foo *foo = [[Foo new] autorelease];
	
	[Foo addMethodForSelector:@selector(voidreturn) typed:"v@:" implementation:^ (id self, SEL _cmd) {
		NSLog(@"Called -[%@ %@] with void return", [self class], NSStringFromSelector(_cmd));
	}];
	
	[foo voidreturn];
	
	[Foo addMethodForSelector:@selector(idreturn) typed:"@@:" implementation:^ id (id self, SEL _cmd) {
		return [NSString stringWithFormat:@"Called -[%@ %@] with id return", [self class], NSStringFromSelector(_cmd)];
	}];
	
	NSLog(@"%@", [foo idreturn]);

	
	
	[pool drain];
	return 0;
}
