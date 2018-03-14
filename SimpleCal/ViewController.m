//
//  ViewController.m
//  SimpleCal
//
//  Created by nick pixureddev on 3/13/18.
//  Copyright © 2018 nick pixureddev. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    nameOfMonth = @[@"January", @"February", @"March", @"April", @"May", @"June", @"July", @"August", @"September", @"October", @"November", @"December"];
    
    [self.prevView.layer setBorderWidth:3.0];
    [self.prevView.layer setBorderColor:[[UIColor colorWithRed:66/255.0 green:185/255.0 blue:244/255.0 alpha:0.8]  CGColor]];
    [self.prevView.layer setCornerRadius:10];
    self.prevView.clipsToBounds = YES;
    
    [self.nextView.layer setBorderWidth:3.0];
    [self.nextView.layer setBorderColor:[[UIColor colorWithRed:66/255.0 green:185/255.0 blue:244/255.0 alpha:0.8]  CGColor]];
    [self.nextView.layer setCornerRadius:10];
    self.nextView.clipsToBounds = YES;
    
    cal = [NSCalendar currentCalendar];
    dateComponents = [cal components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:[NSDate date]];
    
    self.leftSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    self.rightSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    
    self.leftSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
    self.rightSwipe.direction = UISwipeGestureRecognizerDirectionRight;
    
    [self.view addGestureRecognizer:self.leftSwipe];
    [self.view addGestureRecognizer:self.rightSwipe];
    
    [self getCalInfo];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getCalInfo {
    
    NSDate* date = [cal dateFromComponents:dateComponents];
    
    NSRange currentRange = [cal rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    NSDateComponents *weekdayComponents = [cal components:NSCalendarUnitWeekday fromDate:date];
    
    today = [dateComponents day];
    month = [dateComponents month];
    year = [dateComponents year];
    
    monthRange = currentRange.length;
    monthBegin = 7 - (today - [weekdayComponents weekday]) % 7 + 1;
    
    if (monthBegin > 7) {
        monthBegin -= 7;
    }
    
    self.calTitle.text = [NSString stringWithFormat:@"%@ %ld %ld",nameOfMonth[month], (long)today, (long)year];
    
    [self origDayLabel];
}

-(void)origDayLabel {
    
    for (int i = 1; i < 43; i++) {
        
        UILabel *dayLabel = (UILabel *)[self.view viewWithTag:i];
        
        if (i >= monthBegin && i < monthRange + monthBegin) {
            
            dayLabel.text = [NSString stringWithFormat:@"%ld", (i - monthBegin + 1)];
            //dayLabel.backgroundColor = [UIColor whiteColor];
            dayLabel.textColor = [UIColor colorWithRed:87/255.0 green:201/255.0 blue:223/255.0 alpha:1];
        } else {
            //UILabel *dayLabel = (UILabel *)[self.view viewWithTag:i];
            dayLabel.text = @"";
            //dayLabel.backgroundColor = [UIColor whiteColor];
        }
        
        if (i - monthBegin + 1 == today) {
            dayLabel.textColor = [UIColor blackColor];
            dayLabel.textColor = [UIColor colorWithRed:255/255.0 green:144/255.0 blue:139/255.0 alpha:1];
        }
        
    }
}

-(void)handleSwipe:(UISwipeGestureRecognizer *) sender {
    
    if (sender.direction == UISwipeGestureRecognizerDirectionRight) {
        [self prevMonthHelper];
    } else if (sender.direction == UISwipeGestureRecognizerDirectionLeft) {
        [self nextMonthHelper];
    }
}

- (IBAction)nextMonth:(id)sender {
    [self nextMonthHelper];
}

- (IBAction)prevMonth:(id)sender {
    [self prevMonthHelper];
}

-(void)nextMonthHelper {
    if (month == 11) {
        month = -1;
        
        [dateComponents setYear:year + 1];
    }
    
    [dateComponents setMonth:month + 1];
    [dateComponents setDay:1];
    
    [self getCalInfo];
}

-(void)prevMonthHelper {
    if (month == 0) {
        month = 11;
        
        [dateComponents setYear:year - 1];
    }
    
    [dateComponents setMonth:month -1];
    [dateComponents setDay:1];
    
    [self getCalInfo];
}

@end
