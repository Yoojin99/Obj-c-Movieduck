//
//  ThumbUpDelegate.h
//  SampleOne
//
//  Created by NHN on 2021/05/06.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@protocol ThumbUpDelegate <NSObject>

-(void) clickedThumbsUp;
-(void) clickedThumbsUpWithIndexPath: (NSIndexPath*) aMovieIndexPath andMovieId: (int) aMovieId;

@end

NS_ASSUME_NONNULL_END
