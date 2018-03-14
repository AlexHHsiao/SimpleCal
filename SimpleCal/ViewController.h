//
//  ViewController.h
//  SimpleCal
//
//  Created by nick pixureddev on 3/13/18.
//  Copyright © 2018 nick pixureddev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {    
    NSInteger selectedDay;
    NSInteger today;
    NSInteger month;
    NSInteger year;
    NSInteger monthRange;
    NSInteger monthBegin;
    
    NSArray *nameOfMonth;
    
    NSCalendar* cal;
    NSDateComponents *dateComponents;
}

@property (nonatomic, strong) UISwipeGestureRecognizer * leftSwipe;
@property (nonatomic, strong) UISwipeGestureRecognizer * rightSwipe;

@property (weak, nonatomic) IBOutlet UILabel *calTitle;
@property (weak, nonatomic) IBOutlet UIButton *prevView;
@property (weak, nonatomic) IBOutlet UIButton *nextView;

- (IBAction)nextMonth:(id)sender;
- (IBAction)prevMonth:(id)sender;

@end

