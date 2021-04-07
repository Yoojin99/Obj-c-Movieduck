//
//  MovieDetailPhotoCollectionViewCell.m
//  SampleOne
//
//  Created by NHN on 2021/04/01.
//

#import "MovieDetailPhotoCollectionViewCell.h"

@implementation MovieDetailPhotoCollectionViewCell

-(instancetype) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.photoImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        self.photoImageView.contentMode = UIViewContentModeScaleAspectFill;
        self.photoImageView.clipsToBounds = YES;
        [self.contentView addSubview:self.photoImageView];
        self.photoImageView.translatesAutoresizingMaskIntoConstraints = NO;
        [NSLayoutConstraint activateConstraints: @[
            [self.contentView.leadingAnchor constraintEqualToAnchor:self.photoImageView.leadingAnchor],
            [self.contentView.trailingAnchor constraintEqualToAnchor:self.photoImageView.trailingAnchor],
            [self.contentView.topAnchor constraintEqualToAnchor:self.photoImageView.topAnchor],
            [self.contentView.bottomAnchor constraintEqualToAnchor:self.photoImageView.bottomAnchor]
        ]];
    }
    return self;
}

@end
