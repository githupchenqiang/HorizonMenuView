//
//  HorizontalMenuView.h
//  Configure
//
//  Created by chenq@kensence.com on 15/3/8.
//  Copyright © 2015年 chenq@kensence.com. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol HorizontalMenuPritocol <NSObject>

@optional

@required
- (void)GetTag:(NSInteger)tag; //获取当前选中下标

@end
@interface HorizontalMenuView : UIView
{
    NSArray *_menuArray; //获取到菜单名数组
    
}

-  (void)setNameWithArray:(NSArray *)NameArray;//设置菜单名称
@property (nonatomic ,assign)id <HorizontalMenuPritocol>HorizonDelegate;




@end
