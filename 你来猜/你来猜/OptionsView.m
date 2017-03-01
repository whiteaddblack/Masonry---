//
//  OptionsView.m
//  你来猜
//
//  Created by zero on 16/12/18.
//  Copyright © 2016年 zero. All rights reserved.
//

#import "OptionsView.h"
#import "UIButton+MyButton.h"
#import "Masonry.h"


#define  SIZE 30
#define MARGIN 10
#define MARGIN_H 20
#define COL 7

@implementation OptionsView



#pragma mark
#pragma mark -  重写count的方法

- (void)setCount:(unsigned long)count{
    
    _count = count;
    
     [self creatOptionsBtns];
}

#pragma mark
#pragma mark - 添加选项按钮

- (void)creatOptionsBtns{
    
    for (int i = 0; i < self.count; i++) {
        
        //  实例化 btn
        UIButton *btn = [UIButton getMyButtonWithNormalImageName:@"btn_option"  andHighLightedImageName:@"btn_option_highlighted" andImage:nil andTitle:nil];
        
        
        [self addSubview:btn];
        
        CGFloat btnX = (i % COL) * (SIZE + MARGIN);
        CGFloat btnY = (i / COL) * (SIZE + MARGIN);
        
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.width.height.mas_offset(SIZE);
            make.leading.equalTo(self).offset(btnX);
            make.top.equalTo(self).offset(btnY);
        }];
        
    }
    
}

#pragma mark
#pragma mark - 重写setModel
- (void)setMode:(QuestionModel *)mode{
    
    _mode = mode;
    
    //  更新数据
    [self updateModel];
    
}

#pragma mark
#pragma mark - 更新数据
- (void)updateModel{
 
    int index = 0;
    
    for (UIButton *btn in self.subviews) {
        
        [btn setTitle:self.mode.options[index] forState:UIControlStateNormal];
        
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        index++;
    }
    
}
@end
