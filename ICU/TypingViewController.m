//
//  TypingViewController.m
//  ICU
//
//  Created by Chen Liu on 4/18/15.
//  Copyright (c) 2015 Xixiang Chen. All rights reserved.
//

#import "TypingViewController.h"

@interface TypingViewController (){
    UIView *numView;
    UIView *view;
    int index;
}
@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;
@property (weak, nonatomic) IBOutlet UINavigationItem *navItem;
@property (weak, nonatomic) IBOutlet UITextView *textArea;

@end

@implementation TypingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [_segment addTarget:self action:@selector(selected:) forControlEvents:UIControlEventValueChanged];
    numView=[[UIView alloc] initWithFrame:CGRectMake(0, 416, 1024, 352)];
    view=[[UIView alloc] initWithFrame:CGRectMake(0, 416, 1024, 352)];
    _textArea.font=[UIFont fontWithName:@"Helvetica Neue" size:100];
    _textArea.delegate=self;
    [self createKeyboard];
    index=0;
    for(id t in [self.view subviews]) {
        [t resignFirstResponder];
    }
    
    [_textArea becomeFirstResponder];
}

-(BOOL) textViewShouldBeginEditing:(UITextView *)textView
{
    switch (_segment.selectedSegmentIndex) {
        case 1: return YES;
        case 2: return NO;
        case 3 :return NO;
        default: return YES;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) selected:(id)sender{
    switch (_segment.selectedSegmentIndex) {
        case 1://A-G
            if (index==2 || index==0) {
                _textArea.font=[UIFont fontWithName:@"GALLAUDET" size:100];
            }
            if (index==2 || index==3) {
                [self dismissKeyboad];
            }
            index=1;
            [_textArea becomeFirstResponder];
            break;
        case 2://G-A
            if (index == 0 || index==1) {
                [self showKeyboard];
            }
            if (index == 1 || index==3) {
                _textArea.font=[UIFont systemFontOfSize:80];
            }
            [_textArea resignFirstResponder];
            index=2;
            break;
        case 3://G-G
            if (index == 0 || index==1) {
                [self showKeyboard];
            }
            if (index==2 || index==0) {
                _textArea.font=[UIFont fontWithName:@"GALLAUDET" size:100];
            }
            [_textArea resignFirstResponder];
            index=3;
            break;
        default://A-A
            if (index == 1 || index==3) {
                _textArea.font=[UIFont systemFontOfSize:80];
            }
            if (index==2 || index==3) {
                [self dismissKeyboad];
            }
            index=0;
            [_textArea becomeFirstResponder];
            break;
    }
}

- (void)showKeyboard{
    [self.view addSubview:view];
}

- (void)dismissKeyboad{
    [view removeFromSuperview];
}

- (void)createKeyboard{
    UIButton *button_0=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button_0.frame=CGRectMake(8.5, 10, 77, 71);
    [button_0 setBackgroundImage:[UIImage imageNamed:@"sign language/0.PNG"] forState:UIControlStateNormal];
    [numView addSubview:button_0];
    
    UIButton *button_1=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button_1.frame=CGRectMake(101.5, 10, 77, 71);
    [button_1 setBackgroundImage:[UIImage imageNamed:@"sign language/1.PNG"] forState:UIControlStateNormal];
    
    [numView addSubview:button_1];

    UIButton *button_2=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button_2.frame=CGRectMake(194.5, 10, 77, 71);
    [button_2 setBackgroundImage:[UIImage imageNamed:@"sign language/2.PNG"] forState:UIControlStateNormal];
    [numView addSubview:button_2];
    
    UIButton *button_3=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button_3.frame=CGRectMake(287.5, 10, 77, 71);
    [button_3 setBackgroundImage:[UIImage imageNamed:@"sign language/3.PNG"] forState:UIControlStateNormal];
    [numView addSubview:button_3];

    UIButton *button_4=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button_4.frame=CGRectMake(380.5, 10, 77, 71);
    [button_4 setBackgroundImage:[UIImage imageNamed:@"sign language/4.PNG"] forState:UIControlStateNormal];
    [numView addSubview:button_4];
    
    UIButton *button_5=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button_5.frame=CGRectMake(473.5, 10, 77, 71);
    [button_5 setBackgroundImage:[UIImage imageNamed:@"sign language/5.PNG"] forState:UIControlStateNormal];
    [numView addSubview:button_5];
    
    UIButton *button_6=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button_6.frame=CGRectMake(566.5, 10, 77, 71);
    [button_6 setBackgroundImage:[UIImage imageNamed:@"sign language/6.PNG"] forState:UIControlStateNormal];
    [numView addSubview:button_6];
    
    UIButton *button_7=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button_7.frame=CGRectMake(659.5, 10, 77, 71);
    [button_7 setBackgroundImage:[UIImage imageNamed:@"sign language/7.PNG"] forState:UIControlStateNormal];
    [numView addSubview:button_7];
    
    UIButton *button_8=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button_8.frame=CGRectMake(752.5, 10, 77, 71);
    [button_8 setBackgroundImage:[UIImage imageNamed:@"sign language/8.PNG"] forState:UIControlStateNormal];
    [numView addSubview:button_8];
    
    UIButton *button_9=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button_9.frame=CGRectMake(845.5, 10, 77, 71);
    [button_9 setBackgroundImage:[UIImage imageNamed:@"sign language/9.PNG"] forState:UIControlStateNormal];
    [numView addSubview:button_9];
    
    UIButton *del=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    del.frame=CGRectMake(938.5, 10, 77, 71);
    [del setBackgroundImage:[UIImage imageNamed:@"sign language/del.PNG"] forState:UIControlStateNormal];
    [numView addSubview:del];
    
    UIButton *del2=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    del2.frame=CGRectMake(938.5, 10, 77, 71);
    [del2 setBackgroundImage:[UIImage imageNamed:@"sign language/del.PNG"] forState:UIControlStateNormal];
    [view addSubview:del2];
    
    UIButton *button_q=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button_q.frame=CGRectMake(8.5, 10, 77, 71);
    [button_q setBackgroundImage:[UIImage imageNamed:@"sign language/q.PNG"] forState:UIControlStateNormal];
    [view addSubview:button_q];
    
    UIButton *button_w=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button_w.frame=CGRectMake(101.5, 10, 77, 71);
    [button_w setBackgroundImage:[UIImage imageNamed:@"sign language/w.PNG"] forState:UIControlStateNormal];
    [view addSubview:button_w];
    
    UIButton *button_e=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button_e.frame=CGRectMake(194.5, 10, 77, 71);
    [button_e setBackgroundImage:[UIImage imageNamed:@"sign language/e.PNG"] forState:UIControlStateNormal];
    [view addSubview:button_e];
    
    UIButton *button_r=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button_r.frame=CGRectMake(287.5, 10, 77, 71);
    [button_r setBackgroundImage:[UIImage imageNamed:@"sign language/r.PNG"] forState:UIControlStateNormal];
    [view addSubview:button_r];
    
    UIButton *button_t=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button_t.frame=CGRectMake(380.5, 10, 77, 71);
    [button_t setBackgroundImage:[UIImage imageNamed:@"sign language/t.PNG"] forState:UIControlStateNormal];
    [view addSubview:button_t];
    
    UIButton *button_y=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button_y.frame=CGRectMake(473.5, 10, 77, 71);
    [button_y setBackgroundImage:[UIImage imageNamed:@"sign language/y.PNG"] forState:UIControlStateNormal];
    [view addSubview:button_y];
    
    UIButton *button_u=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button_u.frame=CGRectMake(566.5, 10, 77, 71);
    [button_u setBackgroundImage:[UIImage imageNamed:@"sign language/u.PNG"] forState:UIControlStateNormal];
    [view addSubview:button_u];
    
    UIButton *button_i=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button_i.frame=CGRectMake(659.5, 10, 77, 71);
    [button_i setBackgroundImage:[UIImage imageNamed:@"sign language/i.PNG"] forState:UIControlStateNormal];
    [view addSubview:button_i];
    
    UIButton *button_o=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button_o.frame=CGRectMake(752.5, 10, 77, 71);
    [button_o setBackgroundImage:[UIImage imageNamed:@"sign language/o.PNG"] forState:UIControlStateNormal];
    [view addSubview:button_o];
    
    UIButton *button_p=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button_p.frame=CGRectMake(845.5, 10, 77, 71);
    [button_p setBackgroundImage:[UIImage imageNamed:@"sign language/p.PNG"] forState:UIControlStateNormal];
    [view addSubview:button_p];
    
    UIButton *button_a=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button_a.frame=CGRectMake(63, 97, 77, 71);
    [button_a setBackgroundImage:[UIImage imageNamed:@"sign language/a.PNG"] forState:UIControlStateNormal];
    [view addSubview:button_a];
    
    UIButton *button_s=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button_s.frame=CGRectMake(156, 97, 77, 71);
    [button_s setBackgroundImage:[UIImage imageNamed:@"sign language/s.PNG"] forState:UIControlStateNormal];
    [view addSubview:button_s];
    
    UIButton *button_d=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button_d.frame=CGRectMake(249, 97, 77, 71);
    [button_d setBackgroundImage:[UIImage imageNamed:@"sign language/d.PNG"] forState:UIControlStateNormal];
    [view addSubview:button_d];
    
    UIButton *button_f=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button_f.frame=CGRectMake(342, 97, 77, 71);
    [button_f setBackgroundImage:[UIImage imageNamed:@"sign language/f.PNG"] forState:UIControlStateNormal];
    [view addSubview:button_f];
    
    UIButton *button_g=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button_g.frame=CGRectMake(435, 97, 77, 71);
    [button_g setBackgroundImage:[UIImage imageNamed:@"sign language/g.PNG"] forState:UIControlStateNormal];
    [view addSubview:button_g];
    
    UIButton *button_h=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button_h.frame=CGRectMake(528, 97, 77, 71);
    [button_h setBackgroundImage:[UIImage imageNamed:@"sign language/h.PNG"] forState:UIControlStateNormal];
    [view addSubview:button_h];
    
    UIButton *button_j=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button_j.frame=CGRectMake(621, 97, 77, 71);
    [button_j setBackgroundImage:[UIImage imageNamed:@"sign language/j.PNG"] forState:UIControlStateNormal];
    [view addSubview:button_j];
    
    UIButton *button_k=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button_k.frame=CGRectMake(714, 97, 77, 71);
    [button_k setBackgroundImage:[UIImage imageNamed:@"sign language/k.PNG"] forState:UIControlStateNormal];
    [view addSubview:button_k];
    
    UIButton *button_l=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button_l.frame=CGRectMake(807, 97, 77, 71);
    [button_l setBackgroundImage:[UIImage imageNamed:@"sign language/l.PNG"] forState:UIControlStateNormal];
    [view addSubview:button_l];

    UIButton *enter=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    enter.frame=CGRectMake(900, 97, 113.5, 71);
    [enter setBackgroundImage:[UIImage imageNamed:@"sign language/enter.PNG"] forState:UIControlStateNormal];
    [view addSubview:enter];
    
    UIButton *button_at=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button_at.frame=CGRectMake(8.5, 184, 77, 71);
    [button_at setTitle:@"@" forState:UIControlStateNormal];
    [button_at setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    button_at.titleLabel.font=[UIFont systemFontOfSize:40];
    [view addSubview:button_at];
    
    UIButton *button_z=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button_z.frame=CGRectMake(101.5, 184, 77, 71);
    [button_z setBackgroundImage:[UIImage imageNamed:@"sign language/z.PNG"] forState:UIControlStateNormal];
    [view addSubview:button_z];
    
    UIButton *button_x=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button_x.frame=CGRectMake(194.5, 184, 77, 71);
    [button_x setBackgroundImage:[UIImage imageNamed:@"sign language/x.PNG"] forState:UIControlStateNormal];
    [view addSubview:button_x];
    
    UIButton *button_c=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button_c.frame=CGRectMake(287.5, 184, 77, 71);
    [button_c setBackgroundImage:[UIImage imageNamed:@"sign language/c.PNG"] forState:UIControlStateNormal];
    [view addSubview:button_c];
    
    UIButton *button_v=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button_v.frame=CGRectMake(380.5, 184, 77, 71);
    [button_v setBackgroundImage:[UIImage imageNamed:@"sign language/v.PNG"] forState:UIControlStateNormal];
    [view addSubview:button_v];
    
    UIButton *button_b=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button_b.frame=CGRectMake(473.5, 184, 77, 71);
    [button_b setBackgroundImage:[UIImage imageNamed:@"sign language/b.PNG"] forState:UIControlStateNormal];
    [view addSubview:button_b];
    
    UIButton *button_n=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button_n.frame=CGRectMake(566.5, 184, 77, 71);
    [button_n setBackgroundImage:[UIImage imageNamed:@"sign language/n.PNG"] forState:UIControlStateNormal];
    [view addSubview:button_n];
    
    UIButton *button_m=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button_m.frame=CGRectMake(659.5, 184, 77, 71);
    [button_m setBackgroundImage:[UIImage imageNamed:@"sign language/m.PNG"] forState:UIControlStateNormal];
    [view addSubview:button_m];
    
    UIButton *button_comma=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button_comma.frame=CGRectMake(752.5, 184, 77, 71);
    [button_comma setTitle:@"," forState:UIControlStateNormal];
    [button_comma setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    button_comma.titleLabel.font=[UIFont systemFontOfSize:40];
    [view addSubview:button_comma];
    
    UIButton *button_point=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button_point.frame=CGRectMake(845.5, 184, 77, 71);
    [button_point setTitle:@"." forState:UIControlStateNormal];
    [button_point setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    button_point.titleLabel.font=[UIFont systemFontOfSize:40];
    [view addSubview:button_point];
    
    UIButton *ques=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    ques.frame=CGRectMake(938.5, 184, 77, 71);
    [ques setTitle:@"?" forState:UIControlStateNormal];
    ques.titleLabel.font=[UIFont systemFontOfSize:40];
    [ques setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    [view addSubview:ques];
    
    UIButton *button_abc=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button_abc.frame=CGRectMake(8.5, 271, 170, 71);
    [button_abc setBackgroundImage:[UIImage imageNamed:@"sign language/abc.PNG"] forState:UIControlStateNormal];
    [button_abc addTarget:self action:@selector(changeAbcBtns) forControlEvents:UIControlEventTouchUpInside];
    [numView addSubview:button_abc];
    
    UIButton *button_123=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button_123.frame=CGRectMake(8.5, 271, 170, 71);
    [button_123 setBackgroundImage:[UIImage imageNamed:@"sign language/123.PNG"] forState:UIControlStateNormal];
    [button_123 addTarget:self action:@selector(changeNumBtns) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button_123];
    
    UIButton *button_space=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button_space.frame=CGRectMake(194.5, 271, 635, 71);
    [button_space setBackgroundImage:[UIImage imageNamed:@"sign language/space.PNG"] forState:UIControlStateNormal];
    [view addSubview:button_space];
    
    UIButton *button_space2=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button_space2.frame=CGRectMake(194.5, 271, 635, 71);
    [button_space2 setBackgroundImage:[UIImage imageNamed:@"sign language/space.PNG"] forState:UIControlStateNormal];
    [numView addSubview:button_space2];

    
    UIButton *button_abc2=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button_abc2.frame=CGRectMake(845.5, 271, 170, 71);
    [button_abc2 setBackgroundImage:[UIImage imageNamed:@"sign language/abc.PNG"] forState:UIControlStateNormal];
     [button_abc2 addTarget:self action:@selector(changeAbcBtns) forControlEvents:UIControlEventTouchUpInside];
    [numView addSubview:button_abc2];
    
    UIButton *button_123r=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button_123r.frame=CGRectMake(845.5, 271, 170, 71);
    [button_123r setBackgroundImage:[UIImage imageNamed:@"sign language/123.PNG"] forState:UIControlStateNormal];
    [button_123r addTarget:self action:@selector(changeNumBtns) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button_123r];
    
    [button_0 addTarget:self action:@selector(typing0) forControlEvents:UIControlEventTouchUpInside];
    [button_1 addTarget:self action:@selector(typing1) forControlEvents:UIControlEventTouchUpInside];
    [button_2 addTarget:self action:@selector(typing2) forControlEvents:UIControlEventTouchUpInside];
    [button_3 addTarget:self action:@selector(typing3) forControlEvents:UIControlEventTouchUpInside];
    [button_4 addTarget:self action:@selector(typing4) forControlEvents:UIControlEventTouchUpInside];
    [button_5 addTarget:self action:@selector(typing5) forControlEvents:UIControlEventTouchUpInside];
    [button_6 addTarget:self action:@selector(typing6) forControlEvents:UIControlEventTouchUpInside];
    [button_7 addTarget:self action:@selector(typing7) forControlEvents:UIControlEventTouchUpInside];
    [button_8 addTarget:self action:@selector(typing8) forControlEvents:UIControlEventTouchUpInside];
    [button_9 addTarget:self action:@selector(typing9) forControlEvents:UIControlEventTouchUpInside];
    
    [del addTarget:self action:@selector(deleteChar) forControlEvents:UIControlEventTouchUpInside];
    [del2 addTarget:self action:@selector(deleteChar) forControlEvents:UIControlEventTouchUpInside];
    
    [button_a addTarget:self action:@selector(typingA) forControlEvents:UIControlEventTouchUpInside];
    [button_b addTarget:self action:@selector(typingB) forControlEvents:UIControlEventTouchUpInside];
    [button_c addTarget:self action:@selector(typingC) forControlEvents:UIControlEventTouchUpInside];
    [button_d addTarget:self action:@selector(typingD) forControlEvents:UIControlEventTouchUpInside];
    [button_e addTarget:self action:@selector(typingE) forControlEvents:UIControlEventTouchUpInside];
    [button_f addTarget:self action:@selector(typingF) forControlEvents:UIControlEventTouchUpInside];
    [button_g addTarget:self action:@selector(typingG) forControlEvents:UIControlEventTouchUpInside];
    [button_h addTarget:self action:@selector(typingH) forControlEvents:UIControlEventTouchUpInside];
    [button_i addTarget:self action:@selector(typingI) forControlEvents:UIControlEventTouchUpInside];
    [button_j addTarget:self action:@selector(typingJ) forControlEvents:UIControlEventTouchUpInside];
    [button_k addTarget:self action:@selector(typingK) forControlEvents:UIControlEventTouchUpInside];
    [button_l addTarget:self action:@selector(typingL) forControlEvents:UIControlEventTouchUpInside];
    [button_m addTarget:self action:@selector(typingM) forControlEvents:UIControlEventTouchUpInside];
    [button_n addTarget:self action:@selector(typingN) forControlEvents:UIControlEventTouchUpInside];
    [button_o addTarget:self action:@selector(typingO) forControlEvents:UIControlEventTouchUpInside];
    [button_p addTarget:self action:@selector(typingP) forControlEvents:UIControlEventTouchUpInside];
    [button_q addTarget:self action:@selector(typingQ) forControlEvents:UIControlEventTouchUpInside];
    [button_r addTarget:self action:@selector(typingR) forControlEvents:UIControlEventTouchUpInside];
    [button_s addTarget:self action:@selector(typingS) forControlEvents:UIControlEventTouchUpInside];
    [button_t addTarget:self action:@selector(typingT) forControlEvents:UIControlEventTouchUpInside];
    [button_u addTarget:self action:@selector(typingU) forControlEvents:UIControlEventTouchUpInside];
    [button_v addTarget:self action:@selector(typingV) forControlEvents:UIControlEventTouchUpInside];
    [button_w addTarget:self action:@selector(typingW) forControlEvents:UIControlEventTouchUpInside];
    [button_x addTarget:self action:@selector(typingX) forControlEvents:UIControlEventTouchUpInside];
    [button_y addTarget:self action:@selector(typingY) forControlEvents:UIControlEventTouchUpInside];
    [button_z addTarget:self action:@selector(typingZ) forControlEvents:UIControlEventTouchUpInside];
    
    [button_at addTarget:self action:@selector(typingAT) forControlEvents:UIControlEventTouchUpInside];
    [button_comma addTarget:self action:@selector(typingComma) forControlEvents:UIControlEventTouchUpInside];
    [ques addTarget:self action:@selector(typingQues) forControlEvents:UIControlEventTouchUpInside];
    [enter addTarget:self action:@selector(typingEnter) forControlEvents:UIControlEventTouchUpInside];
    [button_space addTarget:self action:@selector(typingSpace) forControlEvents:UIControlEventTouchUpInside];
    [button_space2 addTarget:self action:@selector(typingSpace) forControlEvents:UIControlEventTouchUpInside];
    [button_point addTarget:self action:@selector(typingPoint) forControlEvents:UIControlEventTouchUpInside];
}


-(void) dismissNumButtons{
    [numView removeFromSuperview];
}


-(void) showNumButtons{
    [self.view addSubview:numView];
}

-(void) changeNumBtns{
    [self dismissKeyboad];
    [self showNumButtons];
}

-(void) changeAbcBtns{
    [self dismissNumButtons];
    [self showKeyboard];

}
-(void) typingPoint{
    NSMutableString *str=[[NSMutableString alloc] init];
    [str appendString:_textArea.text];
    [str appendString:@"."];
    _textArea.text=str;
}

-(void) typingSpace{
    NSMutableString *str=[[NSMutableString alloc] init];
    [str appendString:_textArea.text];
    [str appendString:@" "];
    _textArea.text=str;
}

-(void) typingAT{
    NSMutableString *str=[[NSMutableString alloc] init];
    [str appendString:_textArea.text];
    [str appendString:@"@"];
    _textArea.text=str;
}

-(void) typingQues{
    NSMutableString *str=[[NSMutableString alloc] init];
    [str appendString:_textArea.text];
    [str appendString:@"?"];
    _textArea.text=str;
}

-(void) typingComma{
    NSMutableString *str=[[NSMutableString alloc] init];
    [str appendString:_textArea.text];
    [str appendString:@","];
    _textArea.text=str;
}

-(void) typingEnter{
    NSMutableString *str=[[NSMutableString alloc] init];
    [str appendString:_textArea.text];
    [str appendString:@"\n"];
    _textArea.text=str;
}


-(void) typing0{
    NSMutableString *str=[[NSMutableString alloc] init];
    [str appendString:_textArea.text];
    [str appendString:@"0"];
    _textArea.text=str;
}

-(void) typing1{
    NSMutableString *str=[[NSMutableString alloc] init];
    [str appendString:_textArea.text];
    [str appendString:@"1"];
    _textArea.text=str;
}

-(void) typing2{
    NSMutableString *str=[[NSMutableString alloc] init];
    [str appendString:_textArea.text];
    [str appendString:@"2"];
    _textArea.text=str;
}

-(void) typing3{
    NSMutableString *str=[[NSMutableString alloc] init];
    [str appendString:_textArea.text];
    [str appendString:@"3"];
    _textArea.text=str;
}

-(void) typing4{
    NSMutableString *str=[[NSMutableString alloc] init];
    [str appendString:_textArea.text];
    [str appendString:@"4"];
    _textArea.text=str;
}

-(void) typing5{
    NSMutableString *str=[[NSMutableString alloc] init];
    [str appendString:_textArea.text];
    [str appendString:@"5"];
    _textArea.text=str;
}
-(void) typing6{
    NSMutableString *str=[[NSMutableString alloc] init];
    [str appendString:_textArea.text];
    [str appendString:@"6"];
    _textArea.text=str;
}
-(void) typing7{
    NSMutableString *str=[[NSMutableString alloc] init];
    [str appendString:_textArea.text];
    [str appendString:@"7"];
    _textArea.text=str;
}
-(void) typing8{
    NSMutableString *str=[[NSMutableString alloc] init];
    [str appendString:_textArea.text];
    [str appendString:@"8"];
    _textArea.text=str;
}

-(void) typing9{
    NSMutableString *str=[[NSMutableString alloc] init];
    [str appendString:_textArea.text];
    [str appendString:@"9"];
    _textArea.text=str;
}

-(void) typingA{
    NSMutableString *str=[[NSMutableString alloc] init];
    [str appendString:_textArea.text];
    [str appendString:@"a"];
    _textArea.text=str;
}

-(void) typingB{
    NSMutableString *str=[[NSMutableString alloc] init];
    [str appendString:_textArea.text];
    [str appendString:@"b"];
    _textArea.text=str;
}

-(void) typingC{
    NSMutableString *str=[[NSMutableString alloc] init];
    [str appendString:_textArea.text];
    [str appendString:@"c"];
    _textArea.text=str;
}

-(void) typingD{
    NSMutableString *str=[[NSMutableString alloc] init];
    [str appendString:_textArea.text];
    [str appendString:@"d"];
    _textArea.text=str;
}

-(void) typingE{
    NSMutableString *str=[[NSMutableString alloc] init];
    [str appendString:_textArea.text];
    [str appendString:@"e"];
    _textArea.text=str;
}

-(void) typingF{
    NSMutableString *str=[[NSMutableString alloc] init];
    [str appendString:_textArea.text];
    [str appendString:@"f"];
    _textArea.text=str;
}

-(void) typingG{
    NSMutableString *str=[[NSMutableString alloc] init];
    [str appendString:_textArea.text];
    [str appendString:@"g"];
    _textArea.text=str;
}

-(void) typingH{
    NSMutableString *str=[[NSMutableString alloc] init];
    [str appendString:_textArea.text];
    [str appendString:@"h"];
    _textArea.text=str;
}

-(void) typingI{
    NSMutableString *str=[[NSMutableString alloc] init];
    [str appendString:_textArea.text];
    [str appendString:@"i"];
    _textArea.text=str;
}

-(void) typingJ{
    NSMutableString *str=[[NSMutableString alloc] init];
    [str appendString:_textArea.text];
    [str appendString:@"j"];
    _textArea.text=str;
}

-(void) typingK{
    NSMutableString *str=[[NSMutableString alloc] init];
    [str appendString:_textArea.text];
    [str appendString:@"k"];
    _textArea.text=str;
}

-(void) typingL{
    NSMutableString *str=[[NSMutableString alloc] init];
    [str appendString:_textArea.text];
    [str appendString:@"l"];
    _textArea.text=str;
}

-(void) typingM{
    NSMutableString *str=[[NSMutableString alloc] init];
    [str appendString:_textArea.text];
    [str appendString:@"m"];
    _textArea.text=str;
}

-(void) typingN{
    NSMutableString *str=[[NSMutableString alloc] init];
    [str appendString:_textArea.text];
    [str appendString:@"n"];
    _textArea.text=str;
}

-(void) typingO{
    NSMutableString *str=[[NSMutableString alloc] init];
    [str appendString:_textArea.text];
    [str appendString:@"o"];
    _textArea.text=str;
}

-(void) typingP{
    NSMutableString *str=[[NSMutableString alloc] init];
    [str appendString:_textArea.text];
    [str appendString:@"p"];
    _textArea.text=str;
}

-(void) typingQ{
    NSMutableString *str=[[NSMutableString alloc] init];
    [str appendString:_textArea.text];
    [str appendString:@"q"];
    _textArea.text=str;
}

-(void) typingR{
    NSMutableString *str=[[NSMutableString alloc] init];
    [str appendString:_textArea.text];
    [str appendString:@"r"];
    _textArea.text=str;
}

-(void) typingS{
    NSMutableString *str=[[NSMutableString alloc] init];
    [str appendString:_textArea.text];
    [str appendString:@"s"];
    _textArea.text=str;
}

-(void) typingT{
    NSMutableString *str=[[NSMutableString alloc] init];
    [str appendString:_textArea.text];
    [str appendString:@"t"];
    _textArea.text=str;
}

-(void) typingU{
    NSMutableString *str=[[NSMutableString alloc] init];
    [str appendString:_textArea.text];
    [str appendString:@"u"];
    _textArea.text=str;
}

-(void) typingV{
    NSMutableString *str=[[NSMutableString alloc] init];
    [str appendString:_textArea.text];
    [str appendString:@"v"];
    _textArea.text=str;
}

-(void) typingW{
    NSMutableString *str=[[NSMutableString alloc] init];
    [str appendString:_textArea.text];
    [str appendString:@"w"];
    _textArea.text=str;
}

-(void) typingX{
    NSMutableString *str=[[NSMutableString alloc] init];
    [str appendString:_textArea.text];
    [str appendString:@"x"];
    _textArea.text=str;
}

-(void) typingY{
    NSMutableString *str=[[NSMutableString alloc] init];
    [str appendString:_textArea.text];
    [str appendString:@"y"];
    _textArea.text=str;
}

-(void) typingZ{
    NSMutableString *str=[[NSMutableString alloc] init];
    [str appendString:_textArea.text];
    [str appendString:@"z"];
    _textArea.text=str;
}

-(void) deleteChar{
    if (_textArea.text.length == 0) {
        return;
    }
    _textArea.text=[_textArea.text substringWithRange:NSMakeRange(0, _textArea.text.length-1)];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
