//
//  LocalDataLoader.m
//  SampleOne
//
//  Created by NHN on 2021/05/06.
//

#import "LocalDataLoader.h"
#import "MovieModel.h"
#import "MovieDetailModel.h"

@implementation LocalDataLoader

+ (NSArray*) loadMovieData {
    NSMutableArray* movieArray = [NSMutableArray array];
    NSDictionary* sDictionary = [self loadData:@"MovieJson"];
    
    if ([sDictionary isKindOfClass:NSArray.class])
    {
        NSArray<NSDictionary *> *sRawMovieList = (NSArray<NSDictionary *> *)sDictionary;
        [sRawMovieList enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull aObj, NSUInteger aIdx, BOOL * _Nonnull aStop) {

            NSString *sName         = [aObj objectForKey:@"name"];
            NSString *sReleaseDate  = [aObj objectForKey:@"releaseDate"];
            NSString *sTag          = [aObj objectForKey:@"tag"];
            NSString *sUrl          = [aObj objectForKey:@"url"];
            NSString *sDirector     = [aObj objectForKey:@"director"];
            NSString *sActor        = [aObj objectForKey:@"actor"];

            MovieModel *sMovieModel = [[MovieModel alloc] initWith: [[NSURL alloc] initWithString:sUrl] andName:sName andDirector:sDirector andActor:sActor andReleaseDate:sReleaseDate andTag:sTag];
            
            [movieArray addObject:sMovieModel];

        }];
    }
    return [movieArray copy];
}

+ (NSArray*) loadMovieDetailData {
    NSMutableArray* movieDetailArray = [NSMutableArray array];
    NSDictionary* sDictionary = [self loadData:@"MovieDetailJson"];
    
    if ([sDictionary isKindOfClass:NSArray.class])
    {
        NSArray<NSDictionary *> *sRawMovieList = (NSArray<NSDictionary *> *)sDictionary;
        [sRawMovieList enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull aObj, NSUInteger aIdx, BOOL * _Nonnull aStop) {

            NSString *sUrl1 = [aObj objectForKey:@"Url1"];
            NSString *sUrl2 = [aObj objectForKey:@"Url2"];
            NSString *sUrl3 = [aObj objectForKey:@"Url3"];
            
            NSArray *sUrls = @[[[NSURL alloc] initWithString:sUrl1], [[NSURL alloc] initWithString:sUrl2], [[NSURL alloc] initWithString:sUrl3]];
            
            NSString *sSummary = [aObj objectForKey:@"Summary"];
            
            MovieDetailModel *sMovieDetailModel = [[MovieDetailModel alloc] initWith:sUrls andSummary:sSummary];
            [movieDetailArray addObject:sMovieDetailModel];

        }];
    }
    return [movieDetailArray copy];
}


+ (nonnull NSDictionary *)loadData:(nonnull NSString *)aFileName {
    NSString *path = [[NSBundle mainBundle] pathForResource:aFileName ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    
}

@end
