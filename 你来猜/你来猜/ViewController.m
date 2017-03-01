//
//  ViewController.m
//  你来猜
//
//  Created by zero on 16/12/17.
//  Copyright © 2016年 zero. All rights reserved.
//

#import "ViewController.h"
#import "QuestionModel.h"
#import "HeadView.h"
#import "AnswerView.h"
#import "OptionsView.h"
#import "Masonry.h"

#define  SIZE 30
#define MARGIN 10
#define MARGIN_H 20
#define COL 7

@interface ViewController () <HeadViewDelegate>


@property(nonatomic,weak) UIView * views;
//  信息数组
@property (nonatomic,strong)NSArray *imageArray;

//  HeadView
@property (nonatomic,weak)HeadView *headView;

//  AnswerView
@property (nonatomic,weak)AnswerView *answerView;
//  OptionView
@property (nonatomic,weak)OptionsView *optionsView;

//  模型
@property (nonatomic,strong)QuestionModel *model;
//  模型下标
@property (nonatomic,assign)int index;
//  遮罩
@property (nonatomic,weak)UIButton *cover;

@end

@implementation ViewController

#pragma mark
#pragma mark - 懒加载数据

- (NSArray *)imageArray{
    
    if (nil == _imageArray) {
        
        //  plist 文件路径
        NSString *path = [[NSBundle mainBundle]pathForResource:@"questions.plist" ofType:nil];
        
        //  可变的临时数组
        NSMutableArray *tempArray = [NSMutableArray array];
        
        NSArray *arr = [NSArray arrayWithContentsOfFile:path];
        
        for (NSDictionary *dict in arr) {
            
            QuestionModel *model = [QuestionModel questionModelWithDict:dict];
            
            [tempArray addObject:model];
        }
        
        _imageArray = tempArray.copy;
    }
    
    return _imageArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    UIView *views = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 50, 50)];
    
    views.backgroundColor = [UIColor greenColor];
    
    
    self.views =views;
    
    [self.view addSubview:views];
    
    
    //  设置背景
    [self setBackgroundColor];
    self.model = self.imageArray[self.index];
    
    //  添加头部view
    [self creatHeadView];
    
    //  添加 AnwerView
    [self creatAnswerView];

    //  添加 OptionsView
    [self creatOptiosView];
    
}

#pragma mark
#pragma mark - 设置背景

- (void)setBackgroundColor{
    
    //  实例化背景 375 667
    UIImageView *background = [UIImageView new];
    //  设置背景颜色   31 7	7
    background.image = [UIImage imageNamed:@"bj"];
    //  添加到控制器的View上
    [self.view addSubview:background];
    
    [background mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.leading.bottom.trailing.equalTo(self.view).offset(0);
    }];
}

#pragma mark
#pragma mark - 创建HeadView

- (void)creatHeadView{
    
    HeadView *headView = [[HeadView alloc]init];
    //  成员变量 
    self.headView = headView;
    //  设置背景
//    headView.backgroundColor = [UIColor blueColor];
    
     //  调用headView的 setCount的方法
    self.headView.count = self.imageArray.count;
    //  调用headView的 setModel的方法
    self.headView.mode = self.model;
    
    [self.view addSubview:headView];
    
    [headView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view);
        
        make.leading.equalTo(self.view);
        
        make.trailing.equalTo(self.view);
        
        make.bottom.equalTo(self.view.mas_centerY);
    }];
    
}


#pragma mark
#pragma mark - 创建AnswerView

- (void)creatAnswerView{
    
    CGFloat answerViewW = self.model.answer.length * (SIZE + MARGIN) - MARGIN;
    CGFloat answerViewH = SIZE + MARGIN;
    
//    CGFloat answerViewX = (self.view.frame.size.width - answerViewW) / 2;
    CGFloat answerViewY = CGRectGetMaxY(self.headView.frame) + 20;
    
    NSLog(@"%f",answerViewW);
    
    AnswerView *answerView = [[AnswerView alloc]init];
    
    //  成员变量
    self.answerView = answerView;
    
    
//    answerView.backgroundColor = [UIColor redColor];
    
    answerView.mode = self.model;
    [self.view addSubview:answerView];
    
    [answerView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.headView.mas_bottom).offset(answerViewY);
        make.centerX.equalTo(self.view);
        make.width.mas_offset(answerViewW);
        make.height.mas_offset(answerViewH);
    }];
    
}
#pragma mark
#pragma mark - 创建OptionsView
- (void)creatOptiosView{
    
    CGFloat optionsViewW = COL * (SIZE + MARGIN) - MARGIN;
    CGFloat optionsViewH = (self.model.options.count / 7) *(SIZE + MARGIN) - MARGIN;
//    CGFloat optionsViewX = (self.view.frame.size.width - optionsViewW) / 2;
    CGFloat optionsViewY = CGRectGetMaxY(self.answerView.frame) + 10;
    
    OptionsView *optionsView = [[OptionsView alloc]init];
    
    self.optionsView = optionsView;
    
    optionsView.count = self.model.options.count;
    
    optionsView.mode = self.model;
    
//    optionsView.backgroundColor = [UIColor greenColor];
    
    
    [self.view addSubview:optionsView];
    
    [optionsView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.answerView.mas_bottom).offset(optionsViewY);
        make.centerX.equalTo(self.view);
        
        make.width.mas_offset(optionsViewW);
        make.height.mas_offset(optionsViewH);
        
    }];
    
    
}



@end
