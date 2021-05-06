//
//  MovieDetailContentUIView.h
//  SampleOne
//
//  Created by NHN on 2021/04/06.
//

#import <UIKit/UIKit.h>
#import "MovieDetailModel.h"
#import "ThumbUpDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface MovieDetailContentUIView : UIView

@property(nonatomic) UICollectionView *photoList;
@property(nonatomic) NSArray<NSURL*>* photos;
@property(nonatomic) UILabel* summary;
@property(nonatomic) MovieDetailModel* movieDetail;
@property (nonatomic, nullable) id <ThumbUpDelegate> delegate;

-(instancetype) initWithMovieDetail: (nullable MovieDetailModel*) aMovieDetail NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
