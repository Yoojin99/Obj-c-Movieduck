//
//  MovieDetailContentUIView.m
//  SampleOne
//
//  Created by NHN on 2021/04/06.
//

#import "MovieDetailContentUIView.h"
#import "MovieDetailPhotoCollectionViewCell.h"

@interface MovieDetailContentUIView() <UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation MovieDetailContentUIView {
    UIImageView *mThumbUpImage;
}

@synthesize photoList, photos, summary, movieDetail;

-(instancetype) initWithCoder:(NSCoder *)coder {
    return [self initWithMovieDetail:nil];
}

-(instancetype) initWithFrame:(CGRect)frame {
    return [self initWithMovieDetail:nil];
}

-(instancetype) initWithMovieDetail: (nullable MovieDetailModel*) aMovieDetail {
    self = [super initWithFrame:CGRectZero];
    if (self) {
        movieDetail = aMovieDetail;
    }

    UICollectionViewFlowLayout *sLayout = [[UICollectionViewFlowLayout alloc] init]; // layout 정렬.custom으로 만들 수 있음
        sLayout.scrollDirection             = UICollectionViewScrollDirectionHorizontal;
        sLayout.sectionInset                = UIEdgeInsetsZero;
        sLayout.minimumInteritemSpacing     = 0.0f;
        sLayout.minimumLineSpacing          = 0.0f;
        sLayout.headerReferenceSize         = CGSizeZero;
        sLayout.footerReferenceSize         = CGSizeZero;
    sLayout.itemSize = CGSizeMake(UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.width); // cell 하나의 크기
    photoList = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:sLayout];
    summary = [[UILabel alloc] initWithFrame: CGRectZero];
    summary.numberOfLines = 0;
    summary.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
    summary.textColor = UIColor.grayColor;
    
    mThumbUpImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"thumbUpBackground"]];
    [mThumbUpImage sizeToFit];
    mThumbUpImage.alpha = 0.0;
    
    [self addSubview:photoList];
    [self addSubview:summary];
    [self addSubview:mThumbUpImage];

    photoList.translatesAutoresizingMaskIntoConstraints = NO;
    summary.translatesAutoresizingMaskIntoConstraints = NO;
    mThumbUpImage.translatesAutoresizingMaskIntoConstraints = NO;

    
    photoList.backgroundColor = UIColor.whiteColor;
    [photoList registerClass:MovieDetailPhotoCollectionViewCell.class forCellWithReuseIdentifier:NSStringFromClass(MovieDetailPhotoCollectionViewCell.class)];
    photoList.dataSource = self;
    photoList.delegate = self;
    
    photoList.pagingEnabled = YES;

    [NSLayoutConstraint activateConstraints:@[
        [photoList.widthAnchor constraintEqualToConstant:sLayout.itemSize.width],
        [photoList.heightAnchor constraintEqualToConstant:sLayout.itemSize.height],

        [photoList.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
        [photoList.topAnchor constraintEqualToAnchor:self.topAnchor],

        [summary.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:20],
        [summary.trailingAnchor constraintLessThanOrEqualToAnchor:self.trailingAnchor constant:-20],
        [summary.topAnchor constraintEqualToAnchor: self.photoList.bottomAnchor constant:30],

        [self.widthAnchor constraintEqualToAnchor:self.photoList.widthAnchor],
        [self.topAnchor constraintEqualToAnchor:self.photoList.topAnchor],
        [self.bottomAnchor constraintEqualToAnchor:self.summary.bottomAnchor],
        
        [mThumbUpImage.centerXAnchor constraintEqualToAnchor:self.photoList.centerXAnchor],
        [mThumbUpImage.centerYAnchor constraintEqualToAnchor:self.photoList.centerYAnchor],
        [mThumbUpImage.widthAnchor constraintEqualToConstant:1],
        [mThumbUpImage.heightAnchor constraintEqualToConstant:1],

   ]];
    
    return self;
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
    return [movieDetail mPhotos].count;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self thumbUpAnimation];
    [self.delegate clickedThumbsUp];
}

-(void) thumbUpAnimation {
    //위험?
    mThumbUpImage.transform = CGAffineTransformMakeScale(0.02, 0.02);
    
    [UIView animateWithDuration:0.2 animations:^{
        CGFloat alphaValue = 1.0;
        self->mThumbUpImage.alpha = alphaValue;
        self->mThumbUpImage.transform = CGAffineTransformMakeScale(200, 200);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:2 animations:^{
            CGFloat alphaValue = 0.0;
            self->mThumbUpImage.alpha = alphaValue;
        }];
    }];
}


@end
