//
//  TableViewCell.h
//  TestGit2
//
//  Created by Anton Orzes on 26/02/2017.
//  Copyright © 2017 Anton Orzes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageT;
@property (weak, nonatomic) IBOutlet UILabel *repoz;
@property (weak, nonatomic) IBOutlet UILabel *author;
@property (weak, nonatomic) IBOutlet UILabel *watchers;
@property (weak, nonatomic) IBOutlet UILabel *forks;
@property (weak, nonatomic) IBOutlet UILabel *issue;

@end
