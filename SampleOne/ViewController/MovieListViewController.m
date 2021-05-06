//
//  MovieListViewController.m
//  SampleOne
//
//  Created by NHN on 2021/03/31.
//

#import "MovieListViewController.h"
#import "MovieListViewCell.h"
#import "Person.h"
#import "MovieDetailViewController.h"
#import "LocalDataLoader.h"
#import "ThumbUpDelegate.h"

@interface MovieListViewController () <UITableViewDataSource, UITableViewDelegate, ThumbUpDelegate> //

@end

@implementation MovieListViewController

@synthesize mMovieList, mMovies, mMovieDetails;

- (void) dealloc {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    self.title = @"상영중 영화";
    // Do any additional setup after loading the view.
    
    Person *sPerson = [[Person alloc] init];
    
    
    [sPerson setName:@"Hi"];
    [sPerson setAge:10];
    [sPerson name];
    
    
    mMovieList = [[UITableView alloc] initWithFrame:(CGRectZero) style:UITableViewStylePlain];
    mMovieList.estimatedRowHeight = 100;
    mMovieList.rowHeight = UITableViewAutomaticDimension;
    
    
    [mMovieList registerClass:MovieListViewCell.class forCellReuseIdentifier:NSStringFromClass(MovieListViewCell.class)]; // tableview에 cell register
    [self.view addSubview:mMovieList];
    mMovieList.translatesAutoresizingMaskIntoConstraints = NO;
    mMovieList.dataSource = self;
    mMovieList.delegate = self; 
    
    [NSLayoutConstraint activateConstraints:@[
        [self.view.leadingAnchor constraintEqualToAnchor:mMovieList.leadingAnchor],
        [self.view.trailingAnchor constraintEqualToAnchor:mMovieList.trailingAnchor],
        [self.view.topAnchor constraintEqualToAnchor:mMovieList.topAnchor],
        [self.view.bottomAnchor constraintEqualToAnchor:mMovieList.bottomAnchor]
    ]];
    mMovies = [LocalDataLoader loadMovieData];
    mMovieDetails = [LocalDataLoader loadMovieDetailData];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    MovieListViewCell* sCell = (MovieListViewCell*) [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(MovieListViewCell.class)]; //table에서 ~이름으로 된 cell pick up
    MovieModel* sModel = [mMovies objectAtIndex:indexPath.row];
    [sCell updateView:sModel];
    
    return sCell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return mMovies.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 객체 dealloc 언제,,,? singleton으로 생성할 필요,,,?
//    MovieDetailViewController* sViewController = [[MovieDetailViewController alloc] initWithNibName:nil bundle:nil];
//    [sViewController setPhotos: [[self mMovieDetails] objectAtIndex:indexPath.row].mPhotos];
//    [sViewController setMSummaryString:[[self mMovieDetails] objectAtIndex:indexPath.row].mSummary];
//
    [[[self mMovieDetails] objectAtIndex:indexPath.row] setMMovieIndexPath:indexPath];
    MovieDetailViewController* sViewController = [[MovieDetailViewController alloc] initWithMovieDetail: [[self mMovieDetails] objectAtIndex:indexPath.row]];
    sViewController.delegate = self;

    
    [self.navigationController pushViewController:sViewController animated:YES];
    //NSLog(@"%i", indexPath.row);
}
-(void) clickedThumbsUpWithIndexPath: (NSIndexPath*) aMovieIndexPath andMovieId: (int) aMovieId {
    mMovies[aMovieId].likeCount += 1;
    MovieListViewCell *cell = (MovieListViewCell*) [mMovieList cellForRowAtIndexPath:aMovieIndexPath];
    [cell updateView:mMovies[aMovieId]];
}

@end
