//
//  UIButton+MyButton.m
//  你来猜
//
//  Created by zero on 16/12/18.
//  Copyright © 2016年 zero. All rights reserved.
//

#import "UIButton+MyButton.h"

@implementation UIButton (MyButton)


- (instancetype)initWithNormalImageName:(NSString *)normalImageName
                andHighLightedImageName:(NSString *)highLightedName
                               andImage:(NSString *)imageName
                               andTitle:(NSString *)title
                               {
    
    if (self = [super init]) {
        
        //  实例化一个按钮
        UIButton *btn = [[UIButton alloc]init];
        //  设置按钮的title
        [btn setTitle:title forState:UIControlStateNormal];
        //  设置按钮的颜色
        [btn setTintColor:[UIColor whiteColor]];
        //  设置图片的image属性
        [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        //  设置背景图片
        [btn setBackgroundImage:[UIImage imageNamed:normalImageName] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:highLightedName] forState:UIControlStateHighlighted];
        //  设置按钮的位置
       
        self = btn;
    }
    
    
    return self;
}




+ (instancetype)getMyButtonWithNormalImageName:(NSString *)normalImageName
                          andHighLightedImageName:(NSString *)highLightedName
                                         andImage:(NSString *)imageName
                                         andTitle:(NSString *)title
                                         {
    
    return [[self alloc]initWithNormalImageName:normalImageName andHighLightedImageName:highLightedName andImage:imageName andTitle:title];
}
@end
