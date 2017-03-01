//
//  QuestionModel.m
//  你来猜
//
//  Created by zero on 16/12/17.
//  Copyright © 2016年 zero. All rights reserved.
//

#import "QuestionModel.h"

@interface QuestionModel()



@end

@implementation QuestionModel



- (instancetype)initWithDict:(NSDictionary *)dict{
    
    if (self = [super init]) {
        
        [self setValuesForKeysWithDictionary:dict];
        
    }
    
    return  self;
}

+ (instancetype)questionModelWithDict:(NSDictionary *)dict{
    
    return  [[self alloc]initWithDict:dict];
}



@end
