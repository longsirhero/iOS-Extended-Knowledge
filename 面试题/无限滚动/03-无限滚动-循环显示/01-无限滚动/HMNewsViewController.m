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
@property (nonatomic, weak) IBOutlet UIPageControl *pageContol;
@property (nonatomic, strong) NSArray *newses;
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation HMNewsViewController

- (NSArray *)newses
{
    if (_newses == nil) {
        self.newses = [HMNews objectArrayWithFilename:@"newses.plist"];
        self.pageContol.numberOfPages = self.newses.count;
    }
    return _newses;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 注册cell
    [self.collectionView registerNib:[UINib nibWithNibName:@"HMNewsCell" bundle:nil] forCellWithReuseIdentifier:HMCellIdentifier];
    
    // 默认显示最中间的那组
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:HMMaxSections/2] atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    
    // 添加定时器
    [self addTimer];
}

/**
 *  添加定时器
 */
- (void)addTimer
{
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    self.timer = timer;
}

/**
 *  移除定时器
 */
- (void)removeTimer
{
    // 停止定时器
    [self.timer invalidate];
    self.timer = nil;
}

- (NSIndexPath *)resetIndexPath
{
    // 当前正在展示的位置
    NSIndexPath *currentIndexPath = [[self.collectionView indexPathsForVisibleItems] lastObject];
    // 马上显示回最中间那组的数据
    NSIndexPath *currentIndexPathReset = [NSIndexPath indexPathForItem:currentIndexPath.item inSection:HMMaxSections/2];
    [self.collectionView scrollToItemAtIndexPath:currentIndexPathReset atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    return currentIndexPathReset;
}

/**
 *  下一页
 */
- (void)nextPage
{
    // 1.马上显示回最中间那组的数据
    NSIndexPath *currentIndexPathReset = [self resetIndexPath];
    
    // 2.计算出下一个需要展示的位置
    NSInteger nextItem = currentIndexPathReset.item + 1;
    NSInteger nextSection = currentIndexPathReset.section;
    if (nextItem == self.newses.count) {
        nextItem = 0;
        nextSection++;
    }
    NSIndexPath *nextIndexPath = [NSIndexPath indexPathForItem:nextItem inSection:nextSection];
    
    // 3.通过动画滚动到下一个位置
    [self.collectionView scrollToItemAtIndexPath:nextIndexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
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

#pragma mark  - UICollectionViewDelegate
/**
 *  当用户即将开始拖拽的时候就调用
 */
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self removeTimer];
}

/**
 *  当用户停止拖拽的时候就调用
 */
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
//    NSLog(@"scrollViewDidEndDragging--松开");
    [self addTimer];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int page = (int)(scrollView.contentOffset.x / scrollView.bounds.size.width + 0.5) % self.newses.count;
    self.pageContol.currentPage = page;
}
@end