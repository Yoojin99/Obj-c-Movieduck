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
@property(nonatomic) NSIndexPath* mMovieIndexPath;
@property(nonatomic) int mMovieId;

- (instancetype) initWith: (NSArray<NSURL*>*) aPhotos andSummary: (NSString*) aSummary andMovieIndexPath: (NSIndexPath*) mMovieIndexPath andMovieId: (int) aMovieId NS_DESIGNATED_INITIALIZER; //지정 초기화 메서드

@end

NS_ASSUME_NONNULL_END
