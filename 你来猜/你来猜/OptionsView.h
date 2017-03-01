//
//  OptionsView.h
//  你来猜
//
//  Created by zero on 16/12/18.
//  Copyright © 2016年 zero. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "QuestionModel.h"

@interface OptionsView : UIView

@property (nonatomic,strong)QuestionModel *mode;

@property (nonatomic,assign)unsigned long count;

@end
