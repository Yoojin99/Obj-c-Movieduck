//
//  LocalDataLoader.h
//  SampleOne
//
//  Created by NHN on 2021/05/06.
//

#import <Foundation/Foundation.h>
#import "LoadData.h"

NS_ASSUME_NONNULL_BEGIN

@interface LocalDataLoader : NSObject <LoadData>

+ (NSArray*) loadMovieData;
+ (NSArray*) loadMovieDetailData;

@end

NS_ASSUME_NONNULL_END
