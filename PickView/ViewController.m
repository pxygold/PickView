//
//  ViewController.m
//  PickView
//
//  Created by lanqs on 15/5/26.
//  Copyright (c) 2015年 puyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>{
    UILabel *_label;
}
@property (weak, nonatomic) IBOutlet UIPickerView *PickerView;
- (void)initializeUserInterface;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initializeUserInterface];
    
}
-(void)initializeUserInterface{
    self.view.backgroundColor = [UIColor whiteColor];
#pragma mark - UIPickerView
//    设置数据源
    self.PickerView.dataSource = self;
//    设置代理
    self.PickerView.delegate = self;
//    刷新所有组,相当雨表格视图的reloadData
    [self.PickerView reloadAllComponents];
#pragma mark - UIStepper
    UIStepper *stepper = [[UIStepper alloc]init];
    stepper.bounds = CGRectMake(0, 0, 100, 30);
    stepper.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMaxY(self.PickerView.frame));
//    设置最小值
    stepper.minimumValue = 10;
//    设置最大值
    stepper.maximumValue = 100;
//    设置默认值
    stepper.value = 50;
    [stepper addTarget:self action:@selector(stepperEvent:) forControlEvents:UIControlEventValueChanged];
    _label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0,CGRectGetWidth(self.view.bounds)/2, CGRectGetHeight(self.view.bounds)/2)];
    _label.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMinY(stepper.frame)-40);
    
    //    label.backgroundColor = [UIColor redColor];
    _label.textAlignment = 1;
   
    
    [self.view addSubview:_label];
    

    
    
    
    [self.view addSubview:stepper];
}
- (void)stepperEvent:(UIStepper *)sender{
//    输出当前的值
    NSLog(@"%lf",sender.value);
     _label.text = [NSString stringWithFormat:@"%lf",sender.value];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - <UIPickerViewDataSource>
//配置多少组
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
//配置每组多少行
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return 5;
}
#pragma mark - <UIPickerViewDelegate>
//配置每行内容
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [NSString stringWithFormat:@"第%ld组,第%ld行",row,component];
}
//配置每行高度
-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 80;
}
//配置每行宽度
-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    return CGRectGetWidth(self.view.bounds)/2;
}
//配置每行视图
-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0,CGRectGetWidth(self.view.bounds)/2, CGRectGetHeight(self.view.bounds)/2)];
    
//    label.backgroundColor = [UIColor redColor];
    label.textAlignment = 1;
    label.text = @"SB";
    return label;
}
//处理选中事件
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSLog(@"点了第%ld组,点击第%ld",row,component);
}

@end
