//
//  MovieListViewCell.m
//  SampleOne
//
//  Created by NHN on 2021/03/31.
//

#import "MovieListViewCell.h"

@implementation MovieListViewCell

@synthesize mPosterImage, mName, mDirector, mActor, mReleaseDate, mTag, mLikes;

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self)
    {
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        mPosterImage = [[UIImageView alloc] initWithFrame: (CGRectZero)];
        mPosterImage.layer.cornerRadius = 5;
        mPosterImage.clipsToBounds = YES;
        [self.contentView addSubview:mPosterImage]; // contentView에 붙임(cell만)
        
        mName = [[UILabel alloc] initWithFrame: CGRectZero];
        mName.numberOfLines = 0;
        mName.font = [UIFont systemFontOfSize:24 weight:UIFontWeightBold];
        mName.textColor = UIColor.blackColor;
        [self.contentView addSubview:mName];
        
        mDirector = [[UILabel alloc] initWithFrame: CGRectZero];
        mDirector.font = [UIFont systemFontOfSize:16 weight:UIFontWeightRegular];
        mDirector.textColor = UIColor.darkGrayColor;
        [self.contentView addSubview:mDirector];
        
        mActor = [[UILabel alloc] initWithFrame: CGRectZero];
        mActor.font = [UIFont systemFontOfSize:16 weight:UIFontWeightRegular];
        mActor.textColor = UIColor.lightGrayColor;
        [self.contentView addSubview:mActor];
        
        mReleaseDate = [[UILabel alloc] initWithFrame: CGRectZero];
        mReleaseDate.font = [UIFont systemFontOfSize:14 weight:UIFontWeightSemibold];
        mReleaseDate.textColor = UIColor.redColor;
        [self.contentView addSubview:mReleaseDate];
        
        mTag = [[UILabel alloc] initWithFrame:CGRectZero];
        mTag.font = [UIFont systemFontOfSize:12 weight:UIFontWeightLight];
        mTag.textColor = UIColor.lightGrayColor;
        [self.contentView addSubview:mTag];

        mLikes = [[UILabel alloc] initWithFrame:CGRectZero];
        mLikes.font = [UIFont systemFontOfSize:12 weight:UIFontWeightBold];
        mLikes.textColor = UIColor.blueColor;
        [self.contentView addSubview:mLikes];
        
        mPosterImage.translatesAutoresizingMaskIntoConstraints = NO;
        mName.translatesAutoresizingMaskIntoConstraints = NO;
        mDirector.translatesAutoresizingMaskIntoConstraints = NO;
        mActor.translatesAutoresizingMaskIntoConstraints = NO;
        mReleaseDate.translatesAutoresizingMaskIntoConstraints = NO;
        mTag.translatesAutoresizingMaskIntoConstraints = NO;
        mLikes.translatesAutoresizingMaskIntoConstraints = NO;
            
        [NSLayoutConstraint activateConstraints: @[
            [mPosterImage.widthAnchor constraintEqualToConstant:80],
            [mPosterImage.heightAnchor constraintEqualToConstant:100],
            [mPosterImage.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor],
            [mPosterImage.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:20],
            
            [mName.leadingAnchor constraintEqualToAnchor:mPosterImage.trailingAnchor constant:20],
            [mName.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:30],
            [mName.trailingAnchor constraintLessThanOrEqualToAnchor:self.contentView.trailingAnchor constant:-30],
            
            [mDirector.leadingAnchor constraintEqualToAnchor:mPosterImage.trailingAnchor constant:20],
            [mDirector.topAnchor constraintEqualToAnchor:mName.bottomAnchor constant:5],
            [mDirector.trailingAnchor constraintLessThanOrEqualToAnchor:self.contentView.trailingAnchor constant:-10],
            
            [mActor.leadingAnchor constraintEqualToAnchor:mPosterImage.trailingAnchor constant:20],
            [mActor.topAnchor constraintEqualToAnchor:mDirector.bottomAnchor constant:5],
            [mActor.trailingAnchor constraintLessThanOrEqualToAnchor:self.contentView.trailingAnchor constant:-30],
            
            [mReleaseDate.leadingAnchor constraintEqualToAnchor:mPosterImage.trailingAnchor constant:20],
            [mReleaseDate.topAnchor constraintEqualToAnchor:mActor.bottomAnchor constant:5],
            [mReleaseDate.trailingAnchor constraintLessThanOrEqualToAnchor:self.contentView.trailingAnchor constant:-30],

            [mTag.leadingAnchor constraintEqualToAnchor:mPosterImage.trailingAnchor constant:20],
            [mTag.topAnchor constraintEqualToAnchor:mReleaseDate.bottomAnchor constant:5],
            [mTag.trailingAnchor constraintLessThanOrEqualToAnchor:self.contentView.trailingAnchor constant:-30],
            [mTag.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-30],
            
            [mLikes.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-30],
            [mLikes.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:30]
        ]];
    }
        
    return self;
}

- (void) updateView : (MovieModel*) aMovieModel {
    mName.text = [aMovieModel mName];
    mDirector.text = [aMovieModel mDirector];
    mActor.text = [aMovieModel mActor];
    mReleaseDate.text = [aMovieModel mReleaseDate];
    mTag.text = [aMovieModel mTag];
    mLikes.text = [NSString stringWithFormat:@"%d", [aMovieModel likeCount]];
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul); //비동기로 처리하게 만듦
    dispatch_async(queue, ^{
    NSData *data = [NSData dataWithContentsOfURL:[aMovieModel mUrl]];
    UIImage *image = [UIImage imageWithData:data];
    dispatch_async(dispatch_get_main_queue(), ^{
        self->mPosterImage.image = image;
    });
    });
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
