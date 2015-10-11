//
//  MediaTableViewCellTest.m
//  Blocstagram
//
//  Created by Kerolos Nakhla on 10/10/15.
//  Copyright (c) 2015 Bloc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "MediaTableViewCell.h"
#import "User.h"
#import "Media.h"

@interface MediaTableViewCellTest : XCTestCase

@end

@implementation MediaTableViewCellTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testThatInitializationWorks{
    NSDictionary *userDictionary = @{@"id" : @"8675309",
                                     @"username" : @"d'oh",
                                     @"full_name" : @"Homer Simpson",
                                     @"profile_picture" : @"http://www.example.com/example.jpg"};
    
    
    NSDictionary *mediaDictionary = @{@"id" : @"8675309",
                                      @"users" : userDictionary,
                                      @"images" : @{@"standard_resolution" : @{@"url": @"http://exampleinmage.com/1.jpg"}},
                                      @"caption" : @{@"text" : @"This is text"},
                                      @"user_has_liked" : @"true",
                                      @"likes" : @{@"count" : @1}};
        
    Media *testMedia = [[Media alloc] initWithDictionary:mediaDictionary];
  
    XCTAssertEqualObjects(testMedia.idNumber, mediaDictionary[@"id"], @"The id should be equal");
    XCTAssertEqualObjects(testMedia.user.idNumber, mediaDictionary[@"user"][@"id"], @"The user id should be equal");
    XCTAssertEqualObjects(testMedia.user.userName, mediaDictionary[@"user"][@"username"], @"the user name should be equal");
    XCTAssertEqualObjects(testMedia.user.fullName, mediaDictionary[@"user"][@"full_name"], @"the full name should be equal");
    XCTAssertEqualObjects(testMedia.user.profilePictureURL.absoluteString, mediaDictionary[@"user"][@"profile_picture"], @"the profile picture should be equal");
    XCTAssertEqualObjects(testMedia.mediaURL.absoluteString, mediaDictionary[@"images"][@"standard_resolution"][@"url"], @"the image url should be equal");
    XCTAssertEqualObjects(testMedia.caption, mediaDictionary[@"caption"][@"text"], @"the caption text should be equal");
}

- (void)testThatHeightForMediaTableViewCellReturns {
    NSDictionary *mediaDictionary = @{@"id" : @"8675309",
                                      @"user": @{@"id": @"123456",
                                      @"username": @"michael",
                                      @"full_name": @"James Bond",
                                      @"profile_picture": @"https://goo.gl/2uOljE"
                                      },
                                      
                                      @"image": @{@"standard_resolution": @{@"url": @"https://goo.gl/2uOljE"}},
                                      @"caption" : @"This is a caption",
                                      @"comments" : @{@"data" : @[
                                                              @{@"id": @"9899887",
                                                                @"text": @"This is a comment",
                                                                @"from": @{@"id": @"1325555",
                                                                           @"username": @"matt",
                                                                           @"full_name": @"Matthew Liu",
                                                                           @"profile_picture": @"https://goo.gl/2uOljE"}}]},
                                      @"user_has_like" : @YES,
                                      @"like" : @{@"count" : @20}};
                                      
    Media *media = [[Media alloc] initWithDictionary:mediaDictionary];
    media.image = [UIImage imageNamed:@"1.jpg"];
    UITraitCollection *traitCollection = [[MediaTableViewCell alloc] init].traitCollection;
    CGFloat height = [MediaTableViewCell heightForMediaItem:media width:320 traitCollection:traitCollection];
    XCTAssert(height, @"height should be returned");
}
    

@end
