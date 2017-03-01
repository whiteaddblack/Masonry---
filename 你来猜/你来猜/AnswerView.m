//
//  AnswerView.m
//  你来猜
//
//  Created by zero on 16/12/18.
//  Copyright © 2016年 zero. All rights reserved.
//

#import "AnswerView.h"
#import "Masonry.h"
#import "UIButton+MyButton.h"

#define  SIZE 30
#define MARGIN 10

@implementation AnswerView


#pragma mark
#pragma mark - 添加答案的按钮
- (void)creatAnswerBtns{
    
    for (int i = 0; i < self.mode.answer.length; i++) {
        
        //  实例按钮
        UIButton *btn = [UIButton getMyButtonWithNormalImageName:@"btn_answer"  andHighLightedImageName:@"btn_answer_highlighted" andImage:nil andTitle:nil];
        
        [self addSubview:btn];
        
        CGFloat btnX = i *(SIZE + MARGIN);
        
        //  按钮约束
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.width.height.mas_offset(SIZE);
            
            make.top.equalTo(self).offset(5);
            make.leading.equalTo(self).offset(btnX);
        }];
        
    }
    
}




#pragma mark
#pragma mark - 重写mode的set方法
- (void)setMode:(QuestionModel *)mode{
    
    _mode = mode;
    
    for (UIButton *btn in self.subviews) {
        
        [btn removeFromSuperview];
        
    }
    
    [self creatAnswerBtns];
    
}



@end
