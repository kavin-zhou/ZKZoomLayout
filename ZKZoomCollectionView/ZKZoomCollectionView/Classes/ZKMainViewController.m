//
//  ZKMainViewController.m
//  ZKZoomCollectionView
//
//  Created by ZK on 16/8/28.
//  Copyright © 2016年 ZK. All rights reserved.
//

#import "ZKMainViewController.h"
#import "ZKZoomLayout.h"
#import "ZKZoomCell.h"

@interface ZKMainViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet ZKZoomLayout *flowLayout;

@end

static NSString *kCellIdentify = @"ZKZoomCell";

@implementation ZKMainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [_collectionView registerClass:[ZKZoomCell class] forCellWithReuseIdentifier:kCellIdentify];
}

#pragma mark - <UICollectionViewDataSource, UICollectionViewDelegate>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZKZoomCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellIdentify forIndexPath:indexPath];
    cell.tintColor = [UIColor orangeColor];
    return cell;
}

@end
