//
//  HMNewsViewController.m
//  01-无限滚动
//
//  Created by apple on 14-7-29.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "HMNewsViewController.h"
#import "HMNewsCell.h"
#import "MJExtension.h"
#import "HMNews.h"

#define HMCellIdentifier @"news"

@interface HMNewsViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *newses;
@end

@implementation HMNewsViewController
- (NSArray *)newses
{
    if (_newses == nil) {
        self.newses = [HMNews objectArrayWithFilename:@"newses.plist"];
    }
    return _newses;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 注册cell
    [self.collectionView registerNib:[UINib nibWithNibName:@"HMNewsCell" bundle:nil] forCellWithReuseIdentifier:HMCellIdentifier];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.newses.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HMNewsCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:HMCellIdentifier forIndexPath:indexPath];
    
    cell.news = self.newses[indexPath.item];
    
    return cell;
}


@end
