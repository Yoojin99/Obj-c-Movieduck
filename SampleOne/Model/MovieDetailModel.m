//
//  MovieDetailModel.m
//  SampleOne
//
//  Created by NHN on 2021/04/05.
//

#import "MovieDetailModel.h"

@implementation MovieDetailModel

- (instancetype) initWith: (NSArray<NSURL*>*) aPhotos andSummary: (NSString*) aSummary andMovieIndexPath: (NSIndexPath*) mMovieIndexPath andMovieId: (int) aMovieId {
    self = [super init]; //부모의 designed된 Init 호출필요(지정초기화m)
    if (self) {
        [self setMPhotos:aPhotos];
        [self setMSummary:aSummary];
        [self setMMovieIndexPath:mMovieIndexPath];
        [self setMMovieId: aMovieId];
    }
    return self;
}

-(instancetype) init {
    return [self initWith:[NSArray array] andSummary:@"" andMovieIndexPath:[NSIndexPath indexPathWithIndex:0] andMovieId:0];
}
@end
