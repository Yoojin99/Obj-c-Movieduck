//
//  MovieModel.m
//  SampleOne
//
//  Created by NHN on 2021/03/31.
//

#import "MovieModel.h"

@implementation MovieModel

- (instancetype) initWith: (NSURL*) aUrl andName: (NSString*) aName andDirector: (NSString*) aDirector andActor: (NSString*) aActor andReleaseDate: (NSString*) aReleaseDate andTag: (NSString*) aTag {
    self = [super init]; //부모의 designed된 Init 호출필요(지정초기화m)
    if (self) {
        [self setMUrl:aUrl];
        [self setMName:aName];
        [self setMDirector:aDirector];
        [self setMActor:aActor];
        [self setMReleaseDate:aReleaseDate];
        [self setMTag:aTag];
        [self setLikeCount:0];
    }
    return self;
}

//convenience method
- (instancetype) init {
    return [self initWith: [[NSURL alloc] init] andName: @"" andDirector:@"" andActor:@"" andReleaseDate:@"" andTag:@""];
}

@end
