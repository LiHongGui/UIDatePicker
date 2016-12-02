//
//  ViewController.m
//  UIDatePicker
//
//  Created by lihonggui on 2016/11/24.
//  Copyright © 2016年 lihonggui. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UITextField *dateText;
@property(nonatomic,strong) UIDatePicker *date;
@property(nonatomic,strong) UIToolbar *toolBar;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    datePicker = _datePicker;
    datePicker.datePickerMode = UIDatePickerModeDateAndTime;
    
    //文本框默认显示是英文键盘,设置显示时间键盘
    _dateText.inputView = self.date;
    //自定义显示键盘视图
    _dateText.inputAccessoryView = self.toolBar;
}

#pragma mark
#pragma mark -  懒加载
-(UIDatePicker *)date
{
    if (_date ==nil) {
        _date = [[UIDatePicker alloc]init];
//        _date.frame = CGRectMake(0, 0, 0, 44);
        _date.locale = [NSLocale localeWithLocaleIdentifier:@"zh-Hans"];
    }
    return _date;
}

-(UIToolbar *)toolBar
{
    if (_toolBar ==nil) {
        _toolBar = [[UIToolbar alloc]init];
        _toolBar.frame = CGRectMake(0, 0, 0, 44);
        

        UIBarButtonItem *cancel = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancelClick)];
        
        UIBarButtonItem *flexible = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
        UIBarButtonItem *sure = [[UIBarButtonItem alloc]initWithTitle:@"确认" style:UIBarButtonItemStyleDone target:self action:@selector(sureClick)];
        _toolBar.items = @[cancel,flexible,sure];
    }
    return _toolBar;
}
/*
 隐藏时间键盘
 */
-(void)cancelClick
{
    [_dateText resignFirstResponder];
}
/*
 时间显示在文本框中
 */
-(void)sureClick
{
    //获取时间
    NSDate *date = _date.date;
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"yyyy年MM月dd日HH时mm";
    NSString *dateString = [formatter stringFromDate:date];
//    NSString *dateString = [formatter dateFromString:date];
    NSLog(@"%@",date);
    _dateText.text = dateString;
    [self.view endEditing:YES];
}
@end
