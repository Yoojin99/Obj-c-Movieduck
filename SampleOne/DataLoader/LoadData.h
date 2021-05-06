//
//  LoadData.h
//  SampleOne
//
//  Created by NHN on 2021/05/06.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol LoadData <NSObject>

+(NSDictionary *) loadData: (NSString*) aFileName;

@end

NS_ASSUME_NONNULL_END
