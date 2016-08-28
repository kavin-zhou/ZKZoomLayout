//
//  ZKZoomLayout.m
//  ZKZoomCollectionView
//
//  Created by ZK on 16/8/28.
//  Copyright © 2016年 ZK. All rights reserved.
//

#import "ZKZoomLayout.h"

@implementation ZKZoomLayout

#pragma mark - Overwrite

- (void)prepareLayout
{
    [super prepareLayout];
    CGFloat inset = (self.collectionView.frame.size.width - self.itemSize.width) * 0.5;
    self.sectionInset = UIEdgeInsetsMake(self.sectionInset.top,
                                         inset,
                                         self.sectionInset.top,
                                         inset);
}

/** 返回值为rect范围内所有元素的布局属性, 即排布方式(frame) */
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray<UICollectionViewLayoutAttributes *> *array = [super layoutAttributesForElementsInRect:rect];
    
    // 计算collectionView的centerX
    CGFloat collectionViewConterX = self.collectionView.contentOffset.x + self.collectionView.frame.size.width * 0.5;
    
    for (UICollectionViewLayoutAttributes *attributes in array) {
        CGFloat delta = ABS(attributes.center.x - collectionViewConterX);
        CGFloat scale = 1.1f - delta / self.collectionView.frame.size.width;
        
        attributes.transform = CGAffineTransformMakeScale(scale, scale);
    }
    
    return array;
}

/** bounds改变, 实时刷新layout 默认NO */
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    CGRect rect;
    rect.origin.y = 0;
    rect.origin.x = proposedContentOffset.x;
    rect.size = self.collectionView.frame.size;
    
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    
    CGFloat centerX = proposedContentOffset.x + self.collectionView.frame.size.width * 0.5;
    
    CGFloat minDelta = MAXFLOAT;
    for (UICollectionViewLayoutAttributes *attributes in array) {
        if (ABS(minDelta) > ABS(attributes.center.x - centerX)) {
            minDelta = attributes.center.x - centerX;
        }
    }
    
    proposedContentOffset.x += minDelta;
    return proposedContentOffset;
}

@end
