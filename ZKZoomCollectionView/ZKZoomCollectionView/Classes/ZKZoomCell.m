//
//  ZKZoomCell.m
//  ZKZoomCollectionView
//
//  Created by ZK on 16/8/28.
//  Copyright © 2016年 ZK. All rights reserved.
//

#import "ZKZoomCell.h"

@implementation ZKZoomCell

- (void)setTintColor:(UIColor *)tintColor
{
    _tintColor = tintColor;
    
    self.contentView.backgroundColor = tintColor;
}

@end
