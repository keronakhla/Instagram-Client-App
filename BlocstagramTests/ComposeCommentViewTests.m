//
//  ComposeCommentViewTests.m
//  Blocstagram
//
//  Created by Kerolos Nakhla on 10/10/15.
//  Copyright (c) 2015 Bloc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ComposeCommentView.h"

@interface ComposeCommentViewTests : XCTestCase

@end

@implementation ComposeCommentViewTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testThatComposeCommentsSetText {
    ComposeCommentView *testCommentView = [[ComposeCommentView alloc] init];
    [testCommentView setText:@"This is text"];
    
    XCTAssertEqual(testCommentView.isWritingComment, (BOOL)YES, "Setting text successfully sets isWriting to True");
}

-(void)testThatComposeCommentsSetTextToNo{
    ComposeCommentView *testCommentView = [[ComposeCommentView alloc] init];
    
    XCTAssertEqual(testCommentView.isWritingComment, (BOOL)NO, "Not setting text returns isWriting as false");
}
@end
