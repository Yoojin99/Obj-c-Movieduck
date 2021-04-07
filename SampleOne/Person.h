//
//  Person.h
//  SampleOne
//
//  Created by NHN on 2021/04/01.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject
{
@public NSString *testPublic;
}

@property NSString *name;
@property NSInteger age;

@end

NS_ASSUME_NONNULL_END
