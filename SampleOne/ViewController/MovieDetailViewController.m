//
//  MovieDetailViewController.m
//  SampleOne
//
//  Created by NHN on 2021/04/01.
//

#import "MovieDetailViewController.h"
#import "MovieDetailPhotoCollectionViewCell.h"
#import "MovieDetailContentUIView.h"

// extension
@interface MovieDetailViewController () <UICollectionViewDataSource>
//private
//@property(nonatomic) UICollectionView *photoList;
//@property(nonatomic) NSArray<NSURL*>* photos;
//@property(nonatomic) UILabel* mSummary;
@property(nonatomic) MovieDetailContentUIView* mMovieDetailContentView;

@end

@implementation MovieDetailViewController

@synthesize photoList, photos, mSummary, mSummaryString, movieDetail, mMovieDetailContentView;

-(instancetype) initWithMovieDetail: (nullable MovieDetailModel*) aMovieDetail{
    self = [super initWithNibName:nil bundle:nil];
    
    if (self) {
        self.movieDetail = aMovieDetail;
    }
    return self;
}

-(instancetype) initWithCoder:(NSCoder *)coder {
    return [self initWithMovieDetail:nil];
}

-(instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    return [self initWithMovieDetail:nil];
}

-(void) dealloc {
    //∂NSLog(@"dealloc");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
    UICollectionViewFlowLayout *sLayout = [[UICollectionViewFlowLayout alloc] init]; // layout 정렬.custom으로 만들 수 있음
        sLayout.scrollDirection             = UICollectionViewScrollDirectionHorizontal;
        sLayout.sectionInset                = UIEdgeInsetsZero;
        sLayout.minimumInteritemSpacing     = 0.0f;
        sLayout.minimumLineSpacing          = 0.0f;
        sLayout.headerReferenceSize         = CGSizeZero;
        sLayout.footerReferenceSize         = CGSizeZero;
    sLayout.itemSize = CGSizeMake(UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.width); // cell 하나의 크기
    
    photoList = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:sLayout];
    mSummary = [[UILabel alloc] initWithFrame: CGRectZero];
    mSummary.numberOfLines = 0;
    mSummary.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
    mSummary.textColor = UIColor.grayColor;
    CGRect cgRect = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    //mMovieDetailContentView = [[MovieDetailContentUIView alloc] initWithFrame:cgRect andMovieDetail:movieDetail];
    //mMovieDetailContentView.backgroundColor = UIColor.blueColor;
    
    [self.view addSubview:photoList];
    [self.view addSubview:mSummary];
    //[self.view addSubview:mMovieDetailContentView];
    
    photoList.translatesAutoresizingMaskIntoConstraints = NO;
    mSummary.translatesAutoresizingMaskIntoConstraints = NO;
    mMovieDetailContentView.translatesAutoresizingMaskIntoConstraints = NO;
    
    
    photoList.backgroundColor = UIColor.whiteColor;
    [photoList registerClass:MovieDetailPhotoCollectionViewCell.class forCellWithReuseIdentifier:NSStringFromClass(MovieDetailPhotoCollectionViewCell.class)];
    photoList.dataSource = self;
    photoList.pagingEnabled = YES;
    
//    photos = @[
//        [[NSURL alloc] initWithString:@"https://img.cgv.co.kr/Movie/Thumbnail/StillCut/000084/84421/84421188819_727.png"],
//        [[NSURL alloc] initWithString:@"https://img.cgv.co.kr/Movie/Thumbnail/StillCut/000084/84421/84421188818_727.jpg"],
//        [[NSURL alloc] initWithString:@"https://img.cgv.co.kr/Movie/Thumbnail/StillCut/000084/84421/84421188817_727.jpg"]
//    ];
    

    [NSLayoutConstraint activateConstraints:@[
                                               [photoList.widthAnchor constraintEqualToConstant:sLayout.itemSize.width],
                                               [photoList.heightAnchor constraintEqualToConstant:sLayout.itemSize.height],

                                               [photoList.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
                                               [photoList.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor],

                                               [mSummary.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20],
                                               [mSummary.topAnchor constraintEqualToAnchor:photoList.bottomAnchor constant:30],
                                               [mSummary.trailingAnchor constraintLessThanOrEqualToAnchor:self.view.trailingAnchor constant:-20],

   ]];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
   MovieDetailPhotoCollectionViewCell *sCell = (MovieDetailPhotoCollectionViewCell*) [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(MovieDetailPhotoCollectionViewCell.class) forIndexPath:indexPath];

//    NSURL *sUrl = [photos objectAtIndex:indexPath.item];
//    mSummary.text = mSummaryString;

    NSURL *sUrl = [[movieDetail mPhotos] objectAtIndex:indexPath.item];
    mSummary.text = [movieDetail mSummary];

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

@end
