/*
 *  NSObject+AddMethod.h
 *  NSObject+AddMethod
 *
 *  Created by Joachim Bengtsson on 2009-08-28.
 *  Copyright 2009 Third Cog Software. All rights reserved.
 *
 */
 
@interface NSObject (AddMethod)
+(BOOL)addMethodForSelector:(SEL)selector typed:(const char*)types implementation:(id)blockPtr;
@end