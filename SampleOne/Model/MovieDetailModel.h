//
//  MovieDetailModel.h
//  SampleOne
//
//  Created by NHN on 2021/04/05.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MovieDetailModel : NSObject

@property(nonatomic) NSArray<NSURL*>* mPhotos;
@property(nonatomic) NSString* mSummary;

- (instancetype) initWith: (NSArray<NSURL*>*) aPhotos andSummary: (NSString*) aSummary NS_DESIGNATED_INITIALIZER; //지정 초기화 메서드

@end

NS_ASSUME_NONNULL_END
