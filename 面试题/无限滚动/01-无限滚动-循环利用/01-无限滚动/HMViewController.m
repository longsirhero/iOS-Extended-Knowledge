//
//  HMViewController.m
//  01-无限滚动
//
//  Created by apple on 14-7-29.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "HMViewController.h"
#import "HMImageCell.h"
#import <MediaPlayer/MediaPlayer.h>

#define HMCellIdentifier @"cell"

@interface HMViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation HMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 注册cell(如果缓存池中没有HMCellIdentifier对应的cell，就会自动创建HMCellIdentifier对应的注册过的cell)
    [self.collectionView registerClass:[HMImageCell class] forCellWithReuseIdentifier:HMCellIdentifier];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 16;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HMImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:HMCellIdentifier forIndexPath:indexPath];
    
    cell.icon = NSString(@"minion_%02d", indexPath.item + 1);
    
    return cell;
}

#pragma mark - UICollectionViewDelegate

@end
