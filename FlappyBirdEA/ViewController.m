//
//  ViewController.m
//  FlappyBirdEA
//
//  Created by Matt Memmo on 1/5/15.
//  Copyright (c) 2015 MattMemmo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize label1;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *highScore = [[NSUserDefaults standardUserDefaults]
                            stringForKey:@"HighScore"];
  
    
    if(highScore.length>0){
        
        label1.text=highScore;
    }else{
        label1.text=@" No High Score Recorded";
    }

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)button1:(id)sender {
    
    
    label1.text=@"Goodbye";
}
@end
