//
//  QuestionModel.h
//  你来猜
//
//  Created by zero on 16/12/17.
//  Copyright © 2016年 zero. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuestionModel : NSObject

@property (nonatomic,copy)NSString *answer;

@property (nonatomic,copy)NSString *icon;

@property (nonatomic,copy)NSString *title;

@property (nonatomic,strong)NSArray *options;



- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)questionModelWithDict:(NSDictionary *)dict;

@end
