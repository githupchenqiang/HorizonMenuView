//
//  HorizontalMenuView.m
//  Configure
//
//  Created by chenq@kensence.com on 15/3/8.
//  Copyright © 2015年 chenq@kensence.com. All rights reserved.
//

#import "HorizontalMenuView.h"

@implementation HorizontalMenuView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)setNameWithArray:(NSArray *)NameArray
{
    _menuArray = NameArray;
    
    //间隔
    CGFloat space = (self.frame.size.width)/[NameArray count];
    
    for (int i  = 0; i < [NameArray count]; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(space * i,0, space, self.frame.size.height);
        button.tag = 100 + i;
        if (100 == button.tag) {
            button.enabled = NO;
        }
        
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:[NameArray objectAtIndex:i]];
        [str addAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:18],NSForegroundColorAttributeName:[UIColor grayColor]} range:NSMakeRange(0, [str length])];
        NSMutableAttributedString *selStr = [[NSMutableAttributedString alloc]initWithString:[NameArray objectAtIndex:i]];
        [selStr addAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:18],NSForegroundColorAttributeName:[UIColor orangeColor]} range:NSMakeRange(0, [selStr length])];
        [button setAttributedTitle:selStr forState:UIControlStateDisabled];
        [button setTitle:[NameArray objectAtIndex:i] forState:UIControlStateNormal];
        [button setTintColor:[UIColor grayColor]];
        [button addTarget:self action:@selector(ButtonAction:) forControlEvents:UIControlEventTouchDown];
        [self addSubview:button];
       
        //分割线
        if (i > 0 && self.frame.size.height > 15) {
            UIView *Lineview = [[UIView alloc]initWithFrame:CGRectMake(space * i, 8, 1, self.frame.size.height - 15)];
            Lineview.backgroundColor = [UIColor grayColor];
            [self addSubview:Lineview];
        }
    }
    //底部分割线
    UIView *bottom = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height - 2.5,self.frame.size.width, 1.5)];
    bottom.backgroundColor = [UIColor grayColor];
    [self addSubview:bottom];
    
    //标识当前选中下划线
    UIView *Sleview = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height - 4, space + 1, 3)];
    Sleview.tag = 999;
    Sleview.backgroundColor = [UIColor orangeColor];
    [self addSubview:Sleview];

}

- (void)ButtonAction:(UIButton *)btn
{
    for (UIView *subView in self.subviews) {
        if ([subView isKindOfClass:[UIButton class]]) {
            UIButton *subBtn = (UIButton *)subView;
            if (subBtn.tag == btn.tag) {
                [subBtn setEnabled:NO];
            }else
            {
                [subBtn setEnabled:YES];
            }
        }
    }
    
    //计算每个按钮的间隔
    CGFloat space = (self.frame.size.width)/[_menuArray count];
    UIView *markView = [self viewWithTag:999];
    [UIView animateWithDuration:0.2f animations:^{
        CGRect markFrame = markView.frame;
        markFrame.origin.x = (btn.tag - 100) * space;
        markView.frame = markFrame;
    }];
    
    if ([self.HorizonDelegate respondsToSelector:@selector(GetTag:)]) {
        [self.HorizonDelegate GetTag:(btn.tag - 100)];
    }
    
}




@end
