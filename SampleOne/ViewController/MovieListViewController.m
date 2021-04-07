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

@interface MovieListViewController () <UITableViewDataSource, UITableViewDelegate> //

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
    
    MovieModel* sModel0 = [[MovieModel alloc] initWith: [[NSURL alloc] initWithString:@"https://img.cgv.co.kr/Movie/Thumbnail/Poster/000084/84184/84184_320.jpg"] andName:@"자산어보" andDirector:@"이준익" andActor:@"설경구 ,  변요한" andReleaseDate:@"2021.03.31" andTag:@"시대극, 드라마, 12세 이상, 126분, 한국"];
    MovieModel* sModel1 = [[MovieModel alloc] initWith: [[NSURL alloc] initWithString:@"https://img.cgv.co.kr/Movie/Thumbnail/Poster/000084/84380/84380_320.jpg"] andName:@"고질라 VS 콩" andDirector:@"애덤 윈가드" andActor:@"알렉산더 스카스가드 ,  밀리 바비 브라운" andReleaseDate:@"2021.03.25" andTag:@"액션, 12세 이상, 113분, 미국"];
    MovieModel* sModel2 = [[MovieModel alloc] initWith: [[NSURL alloc] initWithString:@"https://img.cgv.co.kr/Movie/Thumbnail/Poster/000084/84412/84412_320.jpg"] andName:@"아무도 없는 곳" andDirector:@"김종관" andActor:@"연우진 ,  김상호 ,  아이유 ,  이주영 ,  윤혜리" andReleaseDate:@"2021.03.31" andTag:@"드라마, 미정, 83분, 한국"];
    MovieModel* sModel3 = [[MovieModel alloc] initWith: [[NSURL alloc] initWithString:@"https://img.cgv.co.kr/Movie/Thumbnail/Poster/000084/84279/84279_320.jpg"] andName:@"극장판 귀멸의 칼날-무한열차편" andDirector:@"소토자키 하루오" andActor:@"하나에 나츠키 ,  시모노 히로 ,  마츠오카 요시츠구 ,  키토 아카리" andReleaseDate:@"2021.02.03" andTag:@"애니메이션, 15세 이상, 117분, 일본"];
    MovieModel* sModel4 = [[MovieModel alloc] initWith: [[NSURL alloc] initWithString:@"https://img.cgv.co.kr/Movie/Thumbnail/Poster/000084/84421/84421_320.jpg"] andName:@"조제, 호랑이 그리고 물고기들" andDirector:@"타무라 코타로" andActor:@"타무라 코타로" andReleaseDate:@"2021.03.03" andTag:@"애니메이션, 12세 이상, 98분, 일본"];
    MovieModel* sModel5 = [[MovieModel alloc] initWith: [[NSURL alloc] initWithString:@"https://img.cgv.co.kr/Movie/Thumbnail/Poster/000084/84273/84273_320.jpg"] andName:@"미나리" andDirector:@"정이삭" andActor:@"스티븐 연 ,  한예리 ,  윤여정 ,  앨런 김 ,  노엘 조 ,  윌 패튼" andReleaseDate:@"2021.03.03" andTag:@"드라마, 12세 이상, 115분, 미국"];
    MovieModel* sModel6 = [[MovieModel alloc] initWith: [[NSURL alloc] initWithString:@"https://img.cgv.co.kr/Movie/Thumbnail/Poster/000084/84343/84343_320.jpg"] andName:@"해길랍" andDirector:@"채밀결" andActor:@"허광한 ,  요애녕 ,  임의잠" andReleaseDate:@"2021.03.31" andTag:@"로맨스, 멜로, 15세 이상, 83분, 대만"];
    
    mMovies = @[sModel0, sModel1, sModel2, sModel3, sModel4, sModel5, sModel6];
    
    MovieDetailModel* sDetailModel0 = [[MovieDetailModel alloc] initWith:
                                       @[
                                           [[NSURL alloc] initWithString:@"https://img.cgv.co.kr/Movie/Thumbnail/StillCut/000084/84184/84184189527_727.jpg"],
                                           [[NSURL alloc] initWithString:@"https://img.cgv.co.kr/Movie/Thumbnail/StillCut/000084/84184/84184189210_727.jpg"],
                                           [[NSURL alloc] initWithString:@"https://img.cgv.co.kr/Movie/Thumbnail/StillCut/000084/84184/84184189209_727.jpg"]
                                       ] andSummary:@"\"이 양반은 대역 죄인이니 너무 잘해줄 생각들 말어\" 순조 1년, 신유박해로 세상의 끝 흑산도로 유배된 ‘정약전’. 호기심 많은 '정약전'은 그 곳에서 바다 생물에 매료되어 책을 쓰기로 한다. 이에 바다를 훤히 알고 있는 청년 어부 ‘창대’에게 도움을 구하지만 ‘창대’는 죄인을 도울 수 없다며 단칼에 거절한다."];
    MovieDetailModel* sDetailModel1 = [[MovieDetailModel alloc] initWith:
                                       @[
                                           [[NSURL alloc] initWithString:@"https://img.cgv.co.kr/Movie/Thumbnail/StillCut/000084/84380/84380189711_727.jpg"],
                                           [[NSURL alloc] initWithString:@"https://img.cgv.co.kr/Movie/Thumbnail/StillCut/000084/84380/84380189710_727.jpg"],
                                           [[NSURL alloc] initWithString:@"https://img.cgv.co.kr/Movie/Thumbnail/StillCut/000084/84380/84380189709_727.jpg"]
                                       ] andSummary:@"거대 몬스터들의 습격을 받은 지 3년 후, 콩은 스컬 아일랜드를 떠나 인간들의 보호관찰을 받고 있다. 한편, 인간들에게 등을 돌린 고질라는 비밀연구회사인 에이펙스에 존재하는 알 수 없는 힘에 이끌려 그곳을 쑥대밭으로 만든다. 위기 상황 속, 지구 안의 또 다른 지구인 할로우 어스의 에너지원을 찾아야만 인류가 안전할 수 있다는 판단하고 콩의 보호자들은 콩과 특별한 유대감을 형성하는 아이 지아와 함께 타이탄들의 고향일지 모르는 그 곳으로 위험한 여정을 떠난다. 그러던 중 분노에 찬 고질라의 공격을 받고, 마침내 맞붙게 된 두 전설의 장대한 대결은 앞으로 닥쳐올 대재앙의 서막에 불가했는데…세상의 운명을 놓고, 지구상 가장 거대한 신화적 존재들의 스펙터클한 대격돌이 시작된다!"];
    MovieDetailModel* sDetailModel2 = [[MovieDetailModel alloc] initWith:
                                       @[
                                           [[NSURL alloc] initWithString:@"https://img.cgv.co.kr/Movie/Thumbnail/StillCut/000084/84412/84412189463_727.jpg"],
                                           [[NSURL alloc] initWithString:@"https://img.cgv.co.kr/Movie/Thumbnail/StillCut/000084/84412/84412189462_727.jpg"],
                                           [[NSURL alloc] initWithString:@"https://img.cgv.co.kr/Movie/Thumbnail/StillCut/000084/84412/84412189461_727.jpg"]
                                       ] andSummary:@"어느 이른 봄, 7년 만에 서울로 돌아온 소설가 ‘창석’이 우연히 만나고 헤어진 여기, 길 잃은 마음의 이야기"];
    MovieDetailModel* sDetailModel3 = [[MovieDetailModel alloc] initWith:
                                       @[
                                           [[NSURL alloc] initWithString:@"https://img.cgv.co.kr/Movie/Thumbnail/StillCut/000084/84279/84279187609_727.jpg"],
                                           [[NSURL alloc] initWithString:@"https://img.cgv.co.kr/Movie/Thumbnail/StillCut/000084/84279/84279187607_727.jpg"],
                                           [[NSURL alloc] initWithString:@"https://img.cgv.co.kr/Movie/Thumbnail/StillCut/000084/84279/84279187601_727.jpg"]
                                       ] andSummary:@"혈귀로 변해버린 여동생 ‘네즈코’를 인간으로 되돌릴 단서를 찾아 비밀조직 귀살대에 들어간 ‘탄지로.’ ‘젠이츠’, ‘이노스케’와새로운 임무 수행을 위해 무한열차에 탑승 후 귀살대 최강 검사 염주 ‘렌고쿠’와 합류한다. 달리는 무한열차에서 승객들이 하나 둘 흔적 없이 사라지자 숨어있는 식인 혈귀의 존재를 직감하는 ‘렌고쿠’. 귀살대 ‘탄지로’ 일행과 최강 검사 염주 ‘렌고쿠’는 어둠 속을 달리는 무한열차에서 모두의 목숨을 구하기 위해 예측불가능한 능력을 가진 혈귀와 목숨을 건 혈전을 시작하는데…"];
    MovieDetailModel* sDetailModel4 = [[MovieDetailModel alloc] initWith:
                                       @[
                                           [[NSURL alloc] initWithString:@"https://img.cgv.co.kr/Movie/Thumbnail/StillCut/000084/84421/84421188819_727.png"],
                                           [[NSURL alloc] initWithString:@"https://img.cgv.co.kr/Movie/Thumbnail/StillCut/000084/84421/84421188818_727.jpg"],
                                           [[NSURL alloc] initWithString:@"https://img.cgv.co.kr/Movie/Thumbnail/StillCut/000084/84421/84421188817_727.jpg"]
                                       ] andSummary:@"세상과 단절된 채 살아가던 조제, 지구 반대편의 세상을 꿈꾸며 살아가는 츠네오. 운명처럼 만난 두 사람은 같은 바다를 꿈꾸게 된다."];
    MovieDetailModel* sDetailModel5 = [[MovieDetailModel alloc] initWith:
                                       @[
                                           [[NSURL alloc] initWithString:@"https://img.cgv.co.kr/Movie/Thumbnail/StillCut/000084/84273/84273188057_727.jpg"],
                                           [[NSURL alloc] initWithString:@"https://img.cgv.co.kr/Movie/Thumbnail/StillCut/000084/84273/84273188056_727.jpg"],
                                           [[NSURL alloc] initWithString:@"https://img.cgv.co.kr/Movie/Thumbnail/StillCut/000084/84273/84273188055_727.jpg"]
                                       ] andSummary:@"2021년 전 세계가 기다린 어느 한국 가족의 원더풀한 이야기 \"미나리는 어디서든 잘 자라\""];
    MovieDetailModel* sDetailModel6 = [[MovieDetailModel alloc] initWith:
                                       @[
                                           [[NSURL alloc] initWithString:@"https://img.cgv.co.kr/Movie/Thumbnail/StillCut/000084/84343/84343189821_727.jpg"],
                                           [[NSURL alloc] initWithString:@"https://img.cgv.co.kr/Movie/Thumbnail/StillCut/000084/84343/84343189820_727.jpg"],
                                           [[NSURL alloc] initWithString:@"https://img.cgv.co.kr/Movie/Thumbnail/StillCut/000084/84343/84343189030_727.jpg"]
                                       ] andSummary:@"등굣길 버스 안, 반짝이는 서로에게 반한 ‘탕셩’과 ‘완팅’은 가슴 뛰는 첫사랑을 시작한다. 서로의 세상이 되어가던 어느 날, 충격적인 사고로 ‘완팅’은 한 통의 편지와 ‘탕셩’만 남겨둔 채 곁을 떠난다. 몇 년 후, ‘탕셩’ 앞에 새로운 친구 ‘류팅’이 등장한다.낯선 익숙함에 잊지 못했던 감정이 자라나는데…"];
    
    mMovieDetails = @[sDetailModel0, sDetailModel1, sDetailModel2, sDetailModel3, sDetailModel4,sDetailModel5, sDetailModel6];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

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
    MovieDetailViewController* sViewController = [[MovieDetailViewController alloc] initWithMovieDetail: [[self mMovieDetails] objectAtIndex:indexPath.row]];

    
    [self.navigationController pushViewController:sViewController animated:YES];
    //NSLog(@"%i", indexPath.row);
}
@end
