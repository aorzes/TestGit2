//
//  GetGit.m
//  TestGit2
//
//  Created by Anton Orzes on 26/02/2017.
//  Copyright © 2017 Anton Orzes. All rights reserved.
//

#import "GetGit.h"

@implementation GetGit

- (void)getReposData:(NSString *)reposUpit {
    //NSString     *urlString = @"https://api.github.com/users/aorzes";
    _endRun = NO;
    NSString *urlString = [NSString stringWithFormat: @"https://api.github.com/search/repositories?q=%@",reposUpit];
    NSURL    *url       = [NSURL URLWithString:urlString];
    NSURLRequest *request  = [NSURLRequest requestWithURL:url];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:
                                  ^(NSData *data, NSURLResponse *response, NSError *error) {
                                      // get data from php
                                      NSError *parseError = nil;
                                      NSDictionary *results = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&parseError];
                                      if (parseError) {
                                          NSLog(@"JSONObjectWithData error: %@", parseError);
                                          [self notSucess];
                                          return;
                                      }else {
                                          //NSLog(@"%@", results);
                                          //NSLog(@"Models: %@", [results allKeys]);
                                          NSArray *itemsArr = [results objectForKey: @"items"];
                                          NSDictionary *ownerDict = [[itemsArr objectAtIndex:0] objectForKey: @"owner"];
                                          NSLog(@"ukupni broj: %lu",(unsigned long)itemsArr.count);
                                          NSLog(@"ITEMS: %@", [itemsArr objectAtIndex:0]);
                                          NSLog(@"name: %@", [ownerDict objectForKey:@"login"]);
                                          _endRun = YES;
                                          _gitData = results;
                                      }
                                  }];

    [task resume];
    
}

-(void)notSucess {
    _gitData = nil;
}



@end
