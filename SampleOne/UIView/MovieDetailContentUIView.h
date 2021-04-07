//
//  MovieDetailContentUIView.h
//  SampleOne
//
//  Created by NHN on 2021/04/06.
//

#import <UIKit/UIKit.h>
#import "MovieDetailModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MovieDetailContentUIView : UIView

@property(nonatomic) UICollectionView *photoList;
@property(nonatomic) NSArray<NSURL*>* photos;
@property(nonatomic) UILabel* summary;
@property(nonatomic) MovieDetailModel* movieDetail;

-(instancetype) initWithFrame:(CGRect)frame andMovieDetail: (nullable MovieDetailModel*) aMovieDetail NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
