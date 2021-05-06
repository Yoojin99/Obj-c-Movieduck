//
//  MovieModel.h
//  SampleOne
//
//  Created by NHN on 2021/03/31.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MovieModel : NSObject

    @property NSURL* mUrl;
    @property NSString* mName;
    @property NSString* mDirector;
    @property NSString* mActor;
    @property NSString* mReleaseDate;
    @property NSString* mTag;
    @property int likeCount;


- (instancetype) initWith: (NSURL*) aUrl andName: (NSString*) aName andDirector: (NSString*) aDirector andActor: (NSString*) aActor andReleaseDate: (NSString*) aReleaseDate andTag: (NSString*) aTag NS_DESIGNATED_INITIALIZER; //지정 초기화 메서드

@end

NS_ASSUME_NONNULL_END
