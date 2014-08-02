//
//  ZNetworkEngine.h
//  iHoc
//
//  Created by Zelic on 8/1/14.
//  Copyright (c) 2014 Zelic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZNetworkEngine : MKNetworkEngine

typedef void (^CompletionArrayBlock)(NSArray *data) ;
typedef void (^CompletionObjectBlock)(NSDictionary *data);
typedef void (^FailureBlock)(NSArray *data, NSError *error);

- (MKNetworkOperation *)signInWithEmail:(NSString *)email
                               password:(NSString *)password
                             completion:(CompletionObjectBlock)completionBlock
                                failure:(FailureBlock)failureBlock;
- (MKNetworkOperation *)signUpWithUser:(ZUser *)user
                            completion:(CompletionObjectBlock)completionBlock
                               failure:(FailureBlock)failureBlock;

- (MKNetworkOperation *)getDashboardData:(CompletionObjectBlock)completionBlock
                                    failure:(FailureBlock)failureBlock;

- (MKNetworkOperation *)getSponsoredCourses:(CompletionArrayBlock)completionBlock
                                    failure:(FailureBlock)failureBlock;

- (MKNetworkOperation *)getFeaturedCourses:(CompletionArrayBlock)completionBlock
                                   failure:(FailureBlock)failureBlock;

- (MKNetworkOperation *)getFeaturedPartners:(CompletionArrayBlock)completionBlock
                                    failure:(FailureBlock)failureBlock;

- (MKNetworkOperation *)getCategories:(CompletionArrayBlock)completionBlock
                              failure:(FailureBlock)failureBlock;

- (MKNetworkOperation *)getCourses:(NSInteger)page
                        completion:(CompletionArrayBlock)completionBlock
                           failure:(FailureBlock)failureBlock;

- (MKNetworkOperation *)getCourseDetails:(NSInteger)courseId
                              completion:(CompletionObjectBlock)completionBlock
                                 failure:(FailureBlock)failureBlock;

- (MKNetworkOperation *)getPartners:(CompletionArrayBlock)completionBlock
                            failure:(FailureBlock)failureBlock;


- (MKNetworkOperation *)getBookmarksForUser:(ZUser *)user
                                 completion:(CompletionArrayBlock)completionBlock
                            failure:(FailureBlock)failureBlock;

- (MKNetworkOperation *)postBookmarkWithCourseId:(NSInteger)courseId
                                         forUser:(ZUser *)user
                                      completion:(CompletionArrayBlock)completionBlock
                                         failure:(FailureBlock)failureBlock;

- (MKNetworkOperation *)postCourseRegistration:(NSInteger)courseId
                                         forUser:(ZUser *)user
                                      completion:(CompletionArrayBlock)completionBlock
                                         failure:(FailureBlock)failureBlock;

@end
