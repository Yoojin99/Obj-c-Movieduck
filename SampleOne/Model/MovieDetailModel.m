//
//  MovieDetailModel.m
//  SampleOne
//
//  Created by NHN on 2021/04/05.
//

#import "MovieDetailModel.h"

@implementation MovieDetailModel

- (instancetype) initWith: (NSArray<NSURL*>*) aPhotos andSummary: (NSString*) aSummary {
    self = [super init]; //부모의 designed된 Init 호출필요(지정초기화m)
    if (self) {
        [self setMPhotos:aPhotos];
        [self setMSummary:aSummary];
    }
    return self;
}

-(instancetype) init {
    return [self initWith:[[NSArray alloc]init] andSummary:@""];
}
@end
