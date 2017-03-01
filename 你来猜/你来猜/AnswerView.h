//
//  AnswerView.h
//  你来猜
//
//  Created by zero on 16/12/18.
//  Copyright © 2016年 zero. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuestionModel.h"

#pragma mark
#pragma mark - AnswerView的需要代理方法
@protocol AnswerViewDelegate <NSObject>



@end

@interface AnswerView : UIView

@property (nonatomic,strong)id<AnswerViewDelegate> delegate;


@property (nonatomic,strong)QuestionModel *mode;




@end
