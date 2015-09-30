//
//  DataSource.h
//  Blocstagram
//
//  Created by Kerolos Nakhla on 9/24/15.
//  Copyright (c) 2015 Bloc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Media;

@interface DataSource : NSObject

+ (instancetype) sharedInstance;

@property (nonatomic, strong, readonly) NSArray *mediaItems;

- (void) deleteMediaItem:(Media *)item;
- (void) replaceObjectInMediaItemsAtIndex:(NSUInteger)index withObject:(id)object;
@end
