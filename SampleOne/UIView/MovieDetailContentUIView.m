//
//  MovieDetailContentUIView.m
//  SampleOne
//
//  Created by NHN on 2021/04/06.
//

#import "MovieDetailContentUIView.h"
#import "MovieDetailPhotoCollectionViewCell.h"

@interface MovieDetailContentUIView() <UICollectionViewDataSource>

@end

@implementation MovieDetailContentUIView

@synthesize photoList, photos, summary, movieDetail;

-(instancetype) initWithFrame:(CGRect)frame andMovieDetail: (nullable MovieDetailModel*) aMovieDetail {
    self = [super initWithFrame:frame];
    if (self) {
        movieDetail = aMovieDetail;
    }
    
    [self movieDetail];
    
    self.backgroundColor = UIColor.greenColor;
    
    UILabel* mName = [[UILabel alloc] initWithFrame: CGRectZero];
    mName.numberOfLines = 0;
    mName.font = [UIFont systemFontOfSize:24 weight:UIFontWeightBold];
    mName.textColor = UIColor.blackColor;
    mName.text = @"WHyyyyyyy";
    [self addSubview:mName];
    
    mName.translatesAutoresizingMaskIntoConstraints = NO;
    
    [NSLayoutConstraint activateConstraints: @[
        [mName.topAnchor constraintEqualToAnchor:self.topAnchor constant:50],
        [mName.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:30]
    ]];
    
    return self;
}

-(instancetype) initWithFrame:(CGRect)frame {
    return [self initWithFrame:frame andMovieDetail:nil];
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    MovieDetailPhotoCollectionViewCell *sCell = (MovieDetailPhotoCollectionViewCell*) [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(MovieDetailPhotoCollectionViewCell.class) forIndexPath:indexPath];

 //    NSURL *sUrl = [photos objectAtIndex:indexPath.item];
 //    mSummary.text = mSummaryString;

     NSURL *sUrl = [[movieDetail mPhotos] objectAtIndex:indexPath.item];
     summary.text = [movieDetail mSummary];

     dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul); //비동기로 처리하게 만듦
     dispatch_async(queue, ^{
     NSData *data = [NSData dataWithContentsOfURL:sUrl];
     UIImage *image = [UIImage imageWithData:data];
     dispatch_async(dispatch_get_main_queue(), ^{
         sCell.photoImageView.image = image;
     });
     });

     return sCell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self photos].count;
}


@end
