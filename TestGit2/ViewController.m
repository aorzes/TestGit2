//
//  ViewController.m
//  TestGit2
//
//  Created by Anton Orzes on 26/02/2017.
//  Copyright © 2017 Anton Orzes. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import "GetGit.h"

@interface ViewController ()
{
    NSArray *itemsArr;
    GetGit *dData;
}
@property (weak, nonatomic) IBOutlet UITableView *tablica;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    dData = [[GetGit alloc]init];
    [dData getReposData:@"tetris"];
    [self waitReload:^(BOOL blockName) { //argument metode
        if (blockName) {
            [_tablica reloadData];
        }
    }];

}

- (void)waitReload:(void(^)(BOOL))blockName {//metoda pozvana s blokom
    while(!dData.endRun); //prazna petlja - čekanje
    itemsArr = [dData.gitData objectForKey: @"items"];
    blockName(YES);

}


- (IBAction)repoz:(id)sender {
    
    itemsArr = [dData.gitData objectForKey: @"items"];
    [_tablica reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell"];
    NSDictionary *ownerDict = [[itemsArr objectAtIndex:indexPath.row] objectForKey: @"owner"];
    NSString *imageUrl = [ownerDict objectForKey:@"avatar_url"];
    NSURL *url = [NSURL URLWithString:imageUrl];
    NSData *data = [NSData dataWithContentsOfURL : url];
    UIImage *image = [UIImage imageWithData: data];
    cell.imageT.image = image;
    cell.repoz.text = [[itemsArr objectAtIndex:indexPath.row] objectForKey: @"name"];
    cell.author.text = [ownerDict objectForKey:@"login"];
    cell.watchers.text = [[[itemsArr objectAtIndex:indexPath.row] objectForKey: @"watchers_count"] stringValue];
    cell.forks.text = [[[itemsArr objectAtIndex:indexPath.row] objectForKey: @"forks_count"] stringValue];
    cell.issue.text = [[[itemsArr objectAtIndex:indexPath.row] objectForKey: @"has_issues"] stringValue];
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return itemsArr.count;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
