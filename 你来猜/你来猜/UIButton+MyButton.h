//
//  UIButton+MyButton.h
//  你来猜
//
//  Created by zero on 16/12/18.
//  Copyright © 2016年 zero. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (MyButton)


- (instancetype)initWithNormalImageName:(NSString *)normalImageName
                andHighLightedImageName:(NSString *)highLightedName
                               andImage:(NSString *)imageName
                               andTitle:(NSString *)title;



+ (instancetype)getMyButtonWithNormalImageName:(NSString *)normalImageName
                          andHighLightedImageName:(NSString *)highLightedName
                                         andImage:(NSString *)imageName
                                         andTitle:(NSString *)title;
@end
