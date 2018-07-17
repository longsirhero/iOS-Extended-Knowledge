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
#define HMMaxSections 100

@interface HMNewsViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *newses;
@end

@implementation HMNewsViewController

//- (NSMutableArray *)newses
//{
//    if (_newses == nil) {
//        self.newses = [NSMutableArray array];
//        
//        for (int i = 0; i<200; i++) {
//            NSArray *array = [HMNews objectArrayWithFilename:@"newses.plist"];
//            [self.newses addObjectsFromArray:array];
//        }
//    }
//    return _newses;
//}

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
    
//    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:500 inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:HMMaxSections/2] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.newses.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return HMMaxSections;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HMNewsCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:HMCellIdentifier forIndexPath:indexPath];
    
    cell.news = self.newses[indexPath.item];
    
    return cell;
}


@end
