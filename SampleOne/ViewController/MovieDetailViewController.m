//
//  MovieDetailViewController.m
//  SampleOne
//
//  Created by NHN on 2021/04/01.
//

#import "MovieDetailViewController.h"
#import "MovieDetailPhotoCollectionViewCell.h"
#import "MovieDetailContentUIView.h"
#import "ThumbUpDelegate.h"

// extension
@interface MovieDetailViewController () <UICollectionViewDataSource, ThumbUpDelegate>
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
    mMovieDetailContentView = [[MovieDetailContentUIView alloc] initWithMovieDetail:movieDetail];
    mMovieDetailContentView.delegate = self;
    
    [self.view addSubview:mMovieDetailContentView];
    
    mMovieDetailContentView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [NSLayoutConstraint activateConstraints:@[
        
        [mMovieDetailContentView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [mMovieDetailContentView.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor]
        
    ]];
}

- (void)clickedThumbsUp {
    [self.delegate clickedThumbsUpWithIndexPath:[movieDetail mMovieIndexPath] andMovieId:[movieDetail mMovieId]];
}

@end
