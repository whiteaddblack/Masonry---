//
//  HeadView.h
//  你来猜
//
//  Created by zero on 16/12/18.
//  Copyright © 2016年 zero. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuestionModel.h"

@protocol HeadViewDelegate <NSObject>



@end

@interface HeadView : UIView

//  模型数据
@property (nonatomic,strong)QuestionModel *mode;
//  记录总数
@property (nonatomic,assign)unsigned long count;

//  图片按钮
@property (nonatomic,weak)UIButton *imageBtn;



@end
