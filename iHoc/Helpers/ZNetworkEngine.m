//
//  ZNetworkEngine.m
//  iHoc
//
//  Created by Zelic on 8/1/14.
//  Copyright (c) 2014 Zelic. All rights reserved.
//

#import "ZNetworkEngine.h"

@implementation ZNetworkEngine

- (MKNetworkOperation *)signInWithEmail:(NSString *)email
                               password:(NSString *)password
                             completion:(CompletionObjectBlock)completionBlock
                                failure:(FailureBlock)failureBlock
{
    NSString *path = @"/users/sign_in?f=json";
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:email, @"user[email]", password, @"user[password]", nil];
    MKNetworkOperation *op = [self operationWithPath:path params:params httpMethod:@"POST"];
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        if (completionBlock) {
            completionBlock(completedOperation.responseJSON);
        }
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        if (failureBlock) {
            failureBlock(completedOperation.responseJSON, error);
        }
    }];
    [self enqueueOperation:op];
    return op;
}

- (MKNetworkOperation *)signUpWithUser:(ZUser *)user
                            completion:(CompletionObjectBlock)completionBlock
                               failure:(FailureBlock)failureBlock
{
    NSString *path = @"/users/sign_up?f=json";
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:user.email, @"user[email]", user.password, @"user[password]", user.phone, @"user[phone]", nil];
    MKNetworkOperation *op = [self operationWithPath:path params:params httpMethod:@"POST"];
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        if (completionBlock) {
            completionBlock(completedOperation.responseJSON);
        }
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        if (failureBlock) {
            failureBlock(completedOperation.responseJSON, error);
        }
    }];
    [self enqueueOperation:op];
    return op;
}

- (MKNetworkOperation *)getSponsoredCourses:(CompletionArrayBlock)completionBlock
                                    failure:(FailureBlock)failureBlock
{
    NSString *path = @"/courses/sponsored?f=json";
    MKNetworkOperation *op = [self operationWithPath:path];
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        if (completionBlock) {
            NSMutableArray *result = [NSMutableArray array];
            for (NSDictionary *dic in completedOperation.responseJSON) {
                ZCourse *course = [[ZCourse alloc] initWithDic:dic];
                [result addObject:course];
            }
            completionBlock(result);
        }
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        if (failureBlock) {
            failureBlock(completedOperation.responseJSON, error);
        }
    }];
    [self enqueueOperation:op];
    return op;
}

- (MKNetworkOperation *)getFeaturedCourses:(CompletionArrayBlock)completionBlock
                                   failure:(FailureBlock)failureBlock
{
    NSString *path = @"/courses/featured?f=json";
    MKNetworkOperation *op = [self operationWithPath:path];
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        if (completionBlock) {
            NSMutableArray *result = [NSMutableArray array];
            for (NSDictionary *dic in completedOperation.responseJSON) {
                ZCourse *course = [[ZCourse alloc] initWithDic:dic];
                [result addObject:course];
            }
            completionBlock(result);
        }
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        if (failureBlock) {
            failureBlock(completedOperation.responseJSON, error);
        }
    }];
    [self enqueueOperation:op];
    return op;
}

- (MKNetworkOperation *)getFeaturedPartners:(CompletionArrayBlock)completionBlock
                                    failure:(FailureBlock)failureBlock
{
    NSString *path = @"/partners/featured?f=json";
    MKNetworkOperation *op = [self operationWithPath:path];
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        if (completionBlock) {
            NSMutableArray *result = [NSMutableArray array];
            for (NSDictionary *dic in completedOperation.responseJSON) {
                ZPartner *partner = [[ZPartner alloc] initWithDic:dic];
                [result addObject:partner];
            }
            completionBlock(result);
        }
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        if (failureBlock) {
            failureBlock(completedOperation.responseJSON, error);
        }
    }];
    [self enqueueOperation:op];
    return op;
}

- (MKNetworkOperation *)getCategories:(CompletionArrayBlock)completionBlock
                              failure:(FailureBlock)failureBlock
{
    NSString *path = @"/categories?f=json";
    MKNetworkOperation *op = [self operationWithPath:path];
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        if (completionBlock) {
            NSMutableArray *result = [NSMutableArray array];
            for (NSDictionary *dic in completedOperation.responseJSON) {
                ZCategory *category = [[ZCategory alloc] initWithDic:dic];
                [result addObject:category];
            }
            completionBlock(result);
        }
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        if (failureBlock) {
            failureBlock(completedOperation.responseJSON, error);
        }
    }];
    [self enqueueOperation:op];
    return op;
}

- (MKNetworkOperation *)getCourses:(NSInteger)page
                        completion:(CompletionArrayBlock)completionBlock
                           failure:(FailureBlock)failureBlock
{
    NSString *path = @"/courses/featured?f=json";
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInteger:page], @"p", nil];
    MKNetworkOperation *op = [self operationWithPath:path params:params];
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        if (completionBlock) {
            NSMutableArray *result = [NSMutableArray array];
            for (NSDictionary *dic in completedOperation.responseJSON) {
                ZCourse *course = [[ZCourse alloc] initWithDic:dic];
                [result addObject:course];
            }
            completionBlock(result);
        }
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        if (failureBlock) {
            failureBlock(completedOperation.responseJSON, error);
        }
    }];
    [self enqueueOperation:op];
    return op;
}

- (MKNetworkOperation *)getCourseDetails:(NSInteger)courseId
                              completion:(CompletionObjectBlock)completionBlock
                                 failure:(FailureBlock)failureBlock
{
    NSString *path = [NSString stringWithFormat:@"/courses/%d?f=json", (int)courseId];
    MKNetworkOperation *op = [self operationWithPath:path];
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        if (completionBlock) {
            completionBlock(completedOperation.responseJSON);
        }
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        if (failureBlock) {
            failureBlock(completedOperation.responseJSON, error);
        }
    }];
    [self enqueueOperation:op];
    return op;
}

- (MKNetworkOperation *)getPartners:(CompletionArrayBlock)completionBlock
                            failure:(FailureBlock)failureBlock
{
    NSString *path = @"/partners?f=json";
    MKNetworkOperation *op = [self operationWithPath:path];
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        if (completionBlock) {
            NSMutableArray *result = [NSMutableArray array];
            for (NSDictionary *dic in completedOperation.responseJSON) {
                ZPartner *partner = [[ZPartner alloc] initWithDic:dic];
                [result addObject:partner];
            }
            completionBlock(result);
        }
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        if (failureBlock) {
            failureBlock(completedOperation.responseJSON, error);
        }
    }];
    [self enqueueOperation:op];
    return op;
}


- (MKNetworkOperation *)getBookmarksForUser:(ZUser *)user
                                 completion:(CompletionArrayBlock)completionBlock
                                    failure:(FailureBlock)failureBlock
{
    NSString *path = @"/bookmarks?f=json";
        NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:user.authenticationToken, @"user_token", [NSNumber numberWithInteger:user.id], @"user_id", nil];
    MKNetworkOperation *op = [self operationWithPath:path params:params];
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        if (completionBlock) {
            NSMutableArray *result = [NSMutableArray array];
            for (NSDictionary *dic in completedOperation.responseJSON) {
                ZBookmark *bookmark = [[ZBookmark alloc] initWithDic:dic];
                [result addObject:bookmark];
            }
            completionBlock(result);
        }
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        if (failureBlock) {
            failureBlock(completedOperation.responseJSON, error);
        }
    }];
    [self enqueueOperation:op];
    return op;
}

- (MKNetworkOperation *)postBookmarkWithCourseId:(NSInteger)courseId
                                         forUser:(ZUser *)user
                                      completion:(CompletionArrayBlock)completionBlock
                                         failure:(FailureBlock)failureBlock
{
    NSString *path = @"/bookmarks?f=json";
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInteger:courseId], @"course_id", user.authenticationToken, @"user_token", [NSNumber numberWithInteger:user.id], @"user_id", nil];
    MKNetworkOperation *op = [self operationWithPath:path params:params httpMethod:@"POST"];
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        if (completionBlock) {
            completionBlock(completedOperation.responseJSON);
        }
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        if (failureBlock) {
            failureBlock(completedOperation.responseJSON, error);
        }
    }];
    [self enqueueOperation:op];
    return op;
}

- (MKNetworkOperation *)postCourseRegistration:(NSInteger)courseId
                                       forUser:(ZUser *)user
                                    completion:(CompletionArrayBlock)completionBlock
                                       failure:(FailureBlock)failureBlock
{
    NSString *path = @"/course_registrations?f=json";
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInteger:courseId], @"course_id", user.authenticationToken, @"user_token", [NSNumber numberWithInteger:user.id], @"user_id", nil];
    MKNetworkOperation *op = [self operationWithPath:path params:params httpMethod:@"POST"];
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        if (completionBlock) {
            completionBlock(completedOperation.responseJSON);
        }
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        if (failureBlock) {
            failureBlock(completedOperation.responseJSON, error);
        }
    }];
    [self enqueueOperation:op];
    return op;
}

@end
