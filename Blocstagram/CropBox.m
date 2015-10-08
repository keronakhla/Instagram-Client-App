//
//  CropBox.m
//  Blocstagram
//
//  Created by Kerolos Nakhla on 10/7/15.
//  Copyright (c) 2015 Bloc. All rights reserved.
//

#import "CropBox.h"

@interface CropBox ()

@property (nonatomic, strong) NSArray *horizontalLines;
@property (nonatomic, strong) NSArray *verticalLines;
@property (nonatomic, strong) UIToolbar *topView;
@property (nonatomic, strong) UIToolbar *bottomView;

@end

@implementation CropBox

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = NO;
        
        NSArray *lines = [self.horizontalLines arrayByAddingObjectsFromArray:self.verticalLines];
        for (UIView *lineView in lines) {
            [self addSubview:lineView];
        }
        [self createToolbars];
    }
    return self;
}

- (void) createToolbars {
    UIColor *whiteBG = [UIColor colorWithWhite:1 alpha:.15];
    self.topView = [UIToolbar new];
    self.bottomView = [UIToolbar new];
    self.topView.barTintColor = whiteBG;
    self.bottomView.barTintColor = whiteBG;
    self.topView.alpha = 0.5;
    self.bottomView.alpha = 0.5;
}

- (void) addWidthCropBoxToolbar:(CGFloat)width layoutGuide:(CGFloat)topLayoutGuide {
    self.topView.frame = CGRectMake(0, topLayoutGuide, width, 44);
    CGFloat yOriginOfBottomView = CGRectGetMaxY(self.topView.frame) + width;
    CGFloat heightOfBottomView = CGRectGetHeight(self.frame) - yOriginOfBottomView;
    self.bottomView.frame = CGRectMake(0, yOriginOfBottomView, width, heightOfBottomView);
    self.frame = CGRectMake(0, CGRectGetMaxY(self.topView.frame), width, width);
}


- (NSArray *) horizontalLines {
    if (!_horizontalLines) {
        _horizontalLines = [self newArrayOfFourWhiteViews];
    }
    
    return _horizontalLines;
}

- (NSArray *) verticalLines {
    if (!_verticalLines) {
        _verticalLines = [self newArrayOfFourWhiteViews];
    }
    
    return _verticalLines;
}

- (NSArray *) newArrayOfFourWhiteViews {
    NSMutableArray *array = [NSMutableArray array];
    
    for (int i = 0; i < 4; i++) {
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor whiteColor];
        [array addObject:view];
    }
    
    return array;
}

- (void) layoutSubviews {
    [super layoutSubviews];
    
    CGFloat width = CGRectGetWidth(self.frame);
    CGFloat thirdOfWidth = width / 3;
    
    for (int i = 0; i < 4; i++) {
        UIView *horizontalLine = self.horizontalLines[i];
        UIView *verticalLine = self.verticalLines[i];
        
        horizontalLine.frame = CGRectMake(0, (i * thirdOfWidth), width, 0.5);
        
        CGRect verticalFrame = CGRectMake(i * thirdOfWidth, 0, 0.5, width);
        
        if (i == 3) {
            verticalFrame.origin.x -= 0.5;
        }
        
        verticalLine.frame = verticalFrame;
    }
}

@end
