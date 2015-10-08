//
//  FilteredImageCollectionViewCell.m
//  Blocstagram
//
//  Created by Kerolos Nakhla on 10/8/15.
//  Copyright (c) 2015 Bloc. All rights reserved.
//

#import "FilteredImageCollectionViewCell.h"
#import "Media.h"

@interface FilteredImageCollectionViewCell ()

@property (nonatomic, strong) UIImageView *filterImageView;
@property (nonatomic, strong) UILabel *filterTitle;

@end

@implementation FilteredImageCollectionViewCell

- (id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        self.filterImageView = [[UIImageView alloc] initWithFrame:CGRectInset(CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetWidth(frame)), 5, 5)];
        self.filterTitle = [[UILabel alloc] init];
    
        for (UIView *view in @[self.filterImageView, self.filterTitle]) {
            [self.contentView addSubview:view];
        }
        self.backgroundColor = [UIColor whiteColor];
    }
    
    return self;
}

- (void) layoutSubviews {
    [super layoutSubviews];
    
    CGFloat imageHeight = self.filterImageView.image.size.height / self.filterImageView.image.size.width * CGRectGetWidth(self.contentView.bounds);
    self.filterImageView.frame = CGRectMake(0, 0, CGRectGetWidth(self.contentView.bounds), imageHeight);
    self.filterTitle.frame = CGRectMake(0, imageHeight, CGRectGetWidth(self.contentView.bounds), 20);
    self.filterTitle.textAlignment = NSTextAlignmentCenter;
}
- (void) setImage:(UIImage *)image {
    self.filterImageView.image = image;
}

- (void) setTitle:(NSString *)title{
    self.filterTitle.text = title;
}
@end
