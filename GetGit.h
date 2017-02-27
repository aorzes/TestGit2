//
//  GetGit.h
//  TestGit2
//
//  Created by Anton Orzes on 26/02/2017.
//  Copyright © 2017 Anton Orzes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GetGit : NSObject
- (void)getReposData:(NSString *)reposUpit;
@property (strong, nonatomic) NSDictionary *gitData;
@property BOOL endRun;

@end
