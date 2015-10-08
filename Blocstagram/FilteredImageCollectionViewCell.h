//
//  FilteredImageCollectionViewCell.h
//  Blocstagram
//
//  Created by Kerolos Nakhla on 10/8/15.
//  Copyright (c) 2015 Bloc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Media;

@interface FilteredImageCollectionViewCell : UICollectionViewCell

- (void) setImage:(UIImage *)image;
- (void) setTitle:(NSString *)title;

@end
