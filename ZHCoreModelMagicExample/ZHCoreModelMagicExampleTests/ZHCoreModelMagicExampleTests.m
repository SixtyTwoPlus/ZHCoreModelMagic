//
//  ZHCoreModelMagicExampleTests.m
//  ZHCoreModelMagicExampleTests
//
//  Created by 周海林 on 2023/4/20.
//

#import <XCTest/XCTest.h>
#import "ZHCoreModelMagic.h"
#import "ZHCoreModelExample.h"

@interface ZHCoreModelMagicExampleTests : XCTestCase <ZHCoreModelObserverDelegate>

@end

@implementation ZHCoreModelMagicExampleTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    [ZHCoreModelObserver setupCoreDataWithName:@"ZHCoreModel"];
    [[ZHCoreModelObserver sharedInstance] setresultControllerWith:@[ZHCoreModelExample.class] sortedBy:@"id" ascending:YES groupBy:@"" predicate:ZH_EMPTY_PREDICATE];
    [[ZHCoreModelObserver sharedInstance] addDelegate:self];
    
//    [ZHCoreModelExample zh_deleteAll];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    // Override point for customization after application launch.
    
    NSArray *arr = [ZHCoreModelExample zh_queryAll];
    NSArray *arr1 = [ZHCoreModelExample zh_quertWithKey:@"text" value:@"hhhh"];
    NSArray *arr2 = [ZHCoreModelExample zh_quertWithKey:@"text" value:@"hhhh" sorted:@"text" ascending:YES];
    NSArray *arr3 = [ZHCoreModelExample zh_quertWithKey:@"text" value:@"2222"];
    
    NSLog(@"");
    
//    ZHCoreModelExample *example = [ZHCoreModelExample new];
//    example.text = @"2222";
//    [example zh_saveOrUpdate];
    
}

- (void)zhCoreModelObserverCoreDataListDidChanged:(NSDictionary *)dict{
    NSArray *arr = dict.allValues;
    for (ZHCoreModelExample * e in arr.firstObject) {
        XCTAssertNotNil(e,"This Objc cannot be nil");
        if([e.text isEqualToString:@"hhhh"]){
            NSLog(@"hhhh");
        }
        NSLog(@"%@",e.text);
    }
}


- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
