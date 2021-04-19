//
//  MovieDetailViewController.h
//  SampleOne
//
//  Created by NHN on 2021/04/01.
//

#import <UIKit/UIKit.h>
#import "MovieDetailModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MovieDetailViewController : UIViewController
// public
@property(nonatomic) UICollectionView *photoList;
@property(nonatomic) NSArray<NSURL*>* photos;
@property(nonatomic) UILabel* mSummary;

// add
@property(nonatomic) NSString* mSummaryString;
@property(nonatomic) MovieDetailModel* movieDetail;

-(instancetype) initWithMovieDetail: (nullable MovieDetailModel*) aMovieDetail NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
