//
//  MovieListViewController.h
//  SampleOne
//
//  Created by NHN on 2021/03/31.
//

#import <UIKit/UIKit.h>
#import "MovieModel.h"
#import "MovieDetailModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MovieListViewController : UIViewController

@property UITableView* mMovieList;
@property NSArray<MovieModel*>* mMovies;

// add
@property NSArray<MovieDetailModel*>* mMovieDetails;

@end

NS_ASSUME_NONNULL_END
