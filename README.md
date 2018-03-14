# SimpleCal

Some notes

// use to add touch event for label

`code()
-(void)addGestureRecogniser:(UILabel *)touchLabel{
    
    UITapGestureRecognizer *singleTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(selectDay:)];
    [touchLabel addGestureRecognizer:singleTap];
}

-(void)selectDay:(UITapGestureRecognizer *) sender {
    UIView *view = sender.view;
    NSLog(@"%d", view.tag);//By tag, you can find out where you had tapped.
    
}
`
