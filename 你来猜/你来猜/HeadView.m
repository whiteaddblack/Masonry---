//
//  HeadView.m
//  你来猜
//
//  Created by zero on 16/12/18.
//  Copyright © 2016年 zero. All rights reserved.
//

#import "HeadView.h"
#import "Masonry.h"
#import "UIButton+MyButton.h"


@interface HeadView()


//  标题标签
@property (nonatomic,weak)UILabel *titleLabel;
//  分数按钮
@property (nonatomic,weak)UIButton *scoreBtn;
//  图片信息label
@property (nonatomic,weak)UILabel *infoLabel;
//  提示按钮
@property (nonatomic,weak)UIButton *tipBtn;
//  帮助按钮
@property (nonatomic,weak)UIButton *helpBtn;

//  看大图按钮
@property (nonatomic,weak)UIButton *bigBtn;
//  下一张的按钮
@property (nonatomic,weak)UIButton *nextBtn;


//  计算当前
@property (nonatomic,assign)int index;

@end

@implementation HeadView



- (instancetype)init{
    
    self = [super init];
    
    if (self) {
        
        [self creatView];
    }
    
    return self;
}





#pragma mark
#pragma mark - 创建容器view中的 子控件

- (void)creatView{
    
#pragma mark
#pragma mark - 标题label
    UILabel *titleLabel = [[UILabel alloc]init];
    //  成员属性
    self.titleLabel = titleLabel;
    
    //  初始值
//    titleLabel.text = @"1/10";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    
    titleLabel.textColor = [UIColor whiteColor];
    
//    titleLabel.backgroundColor = [UIColor redColor];
    
    [self addSubview:titleLabel];
    
    //  约束
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self);
        make.top.equalTo(self.mas_bottom).dividedBy(8);
//        make.top.equalTo(self).offset(-2);
        make.width.mas_equalTo(173);
        make.height.mas_equalTo(25);
        
    }];
    
    
#pragma mark
#pragma mark - 计分器
    UIButton *scoreBtn = [[UIButton alloc]init];
    
    //  成员属性
    self.scoreBtn = scoreBtn;
    
    [scoreBtn setImage:[UIImage imageNamed:@"coin"] forState:UIControlStateNormal];
    
    [scoreBtn setTitle:@"1000" forState:UIControlStateNormal];
    
    scoreBtn.userInteractionEnabled = NO;
    
//    [scoreBtn setBackgroundColor:[UIColor orangeColor]];
    
    [self addSubview:scoreBtn];
    
    [scoreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.trailing.equalTo(self);
        
        make.leading.equalTo(titleLabel.mas_trailing);
        
        make.top.equalTo(titleLabel);
        
        make.height.mas_equalTo(25);
    }];
    
#pragma mark
#pragma mark - 图片信息
    
    UILabel *infoLabel = [UILabel new];
    //  成员变量
    self.infoLabel = infoLabel;
    
    infoLabel.textAlignment = NSTextAlignmentCenter;
    infoLabel.textColor = [UIColor whiteColor];
//    infoLabel.backgroundColor = [UIColor blackColor];
    
    [self addSubview:infoLabel];
    
    [infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.trailing.equalTo(self);
        
        make.leading.equalTo(self);
        
        make.top.equalTo(titleLabel.mas_bottom).offset(15);
        
        make.height.mas_equalTo(25);
    }];
    
    
#pragma mark
#pragma mark -  创建图片按钮
    
    UIButton *imageBtn = [UIButton new];
    
    self.imageBtn = imageBtn;
    
   [imageBtn setImage:[UIImage imageNamed:@"center_img"] forState:UIControlStateNormal];
    
    
    [imageBtn setContentEdgeInsets:UIEdgeInsetsMake(5, 5, 5, 5)];
    
    [self addSubview:imageBtn];
    
    [imageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(infoLabel.mas_bottom).offset(10);
        
        make.centerX.equalTo(self);
        
        make.width.equalTo(self.mas_width).dividedBy(2);
        make.height.equalTo(self.mas_height).dividedBy(2);
    }];
#pragma mark
#pragma mark - 提示按钮
    //addButtonWithNormalImageName:@"btn_left" andHighLightedImageName:@"btn_left_highlighted" andImage:@"icon_tip" andTitle:@"提示" andframe:leftOneFrame
    UIButton *tipBtn = [UIButton getMyButtonWithNormalImageName:@"btn_left"
                                        andHighLightedImageName:@"btn_left_highlighted"
                                                       andImage:@"icon_tip"
                                                       andTitle:@"提示"];
    
    self.tipBtn = tipBtn;
    
//    [tipBtn setBackgroundColor:[UIColor blackColor]];
    [self addSubview:tipBtn];
    
    [tipBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.leading.equalTo(self).offset(5);
        make.top.equalTo(imageBtn);
        
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(35);
        
    }];
    
#pragma mark
#pragma mark - 帮助按钮
    UIButton *helpBtn = [UIButton getMyButtonWithNormalImageName:@"btn_left"
                                         andHighLightedImageName:@"btn_left_highlighted"
                                                        andImage:@"icon_help"
                                                        andTitle:@"帮助"];
    
    self.helpBtn = helpBtn;
    
    [self addSubview:helpBtn];
    
    [helpBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.leading.equalTo(self).offset(5);
        make.bottom.equalTo(imageBtn);
        
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(35);
    }];
    
#pragma mark
#pragma mark - 看大图按钮
    //addButtonWithNormalImageName:@"btn_right" andHighLightedImageName:@"btn_right_highlighted" andImage:nil andTitle:@"下一题" andframe:rightTwoFrame]
    
    UIButton *bigBtn = [UIButton getMyButtonWithNormalImageName:@"btn_right" andHighLightedImageName:@"btn_right_highlighted" andImage:@"icon_img" andTitle:@"大图"];
    
    self.bigBtn = bigBtn;
    
    [self addSubview:bigBtn];
    
//    [bigBtn addTarget:self action:@selector(bigImage) forControlEvents:UIControlEventTouchUpInside];
    
    [bigBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.trailing.equalTo(self.mas_trailing).offset(-5);
        make.top.equalTo(imageBtn);
        
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(35);
    }];
    
#pragma mark
#pragma mark - 下一题
    UIButton *nextBtn = [UIButton getMyButtonWithNormalImageName:@"btn_right" andHighLightedImageName:@"btn_right_highlighted" andImage:nil andTitle:@"下一图"];
    
    self.nextBtn = nextBtn;
    
    [self addSubview:nextBtn];
    
//    [nextBtn addTarget:self action:@selector(nextImage) forControlEvents:UIControlEventTouchUpInside];
    
    
    [nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.trailing.equalTo(self.mas_trailing).offset(-5);
        make.bottom.equalTo(imageBtn);
        
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(35);
    }];
    
    

    
    
}

- (void)setCount:(unsigned long)count{
    
    _count = count;
}
#pragma mark
#pragma mark - 重写 setModel的方法

- (void)setMode:(QuestionModel *)model{
    
    _mode = model;
    
    self.index++;
    
    //  每次model更新的时候 自动更新数据
    [self updateValue];
    
}

#pragma mark
#pragma mark - 更新数据
- (void)updateValue{
    
    NSString *title = [NSString stringWithFormat:@"%d/%lu",self.index,self.count];
    self.titleLabel.text = title;
    
    self.infoLabel.text = self.mode.title;
    
    [self.imageBtn setImage:[UIImage imageNamed:self.mode.icon] forState:UIControlStateNormal];
    
}

@end
