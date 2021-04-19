//
//  MovieListViewCell.h
//  SampleOne
//
//  Created by NHN on 2021/03/31.
//

#import <UIKit/UIKit.h>
#import "MovieModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MovieListViewCell : UITableViewCell

@property UIImageView* mPosterImage; // m delete
@property UILabel* mName;
@property UILabel* mDirector;
@property UILabel* mActor;
@property UILabel* mReleaseDate;
@property UILabel* mTag;

- (void) updateView : (MovieModel*) aMovieModel;

@end

NS_ASSUME_NONNULL_END
