//
//  ZHCoreModelManager.h
//  ZHCoreModelMagicExample
//
//  Created by 周海林 on 2023/4/19.
//

#import <Foundation/Foundation.h>
#import "ZHCoreModelTool.h"

NS_ASSUME_NONNULL_BEGIN

@protocol ZHCoreModelManagerDelegate <NSObject>



@end

@interface ZHCoreModelObserver : NSObject

ZH_SHAREINSTANCE(ZHCoreModelObserver);

@property (nonatomic,assign,readonly) BOOL setuped;

+ (void)setupCoreDataWithName:(NSString *)name;

#pragma mark - setup controller
- (void)setresultControllerWith:(NSArray <Class> *)class sortedBy:(NSString *)sortedBy groupBy:(NSString * _Nullable)groupBy predicate:(NSPredicate *)predicate;

- (void)setResultControllerWith:(NSArray <Class> *)class groupBy:(NSString *)groupBy sortedBy:(NSString * _Nullable)sortedBy predicate:(NSPredicate *)predicate;

#pragma mark - method
- (void)setNotificationObjects:(NSArray <Class> *)objects;

#pragma mark - delegate
- (void)addDelegate:(id <ZHCoreModelManagerDelegate>)delegate;

- (void)removeDelegate:(id <ZHCoreModelManagerDelegate>)delegate;

- (instancetype)init NS_UNAVAILABLE;

+ (instancetype)new NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
