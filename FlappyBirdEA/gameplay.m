//
//  gameplay.m
//  FlappyBirdEA
//
//  Created by Matt Memmo on 1/5/15.
//  Copyright (c) 2015 MattMemmo. All rights reserved.
//

#import "gameplay.h"

@interface gameplay ()

@end

int birdDirection=9;
int x=0;
int highs=0;
int y=0;
int integerWidth;
int integerHeight;
NSTimer * BirdMove;
BOOL goingUp=NO;
int stopDown=0;

@implementation gameplay
@synthesize bird;
@synthesize background;
@synthesize tube1;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self getScreenWidth];
   
    background.frame=CGRectMake(0, 0, integerWidth, integerHeight);
    
    BirdMove=[NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(birdMoving) userInfo:nil repeats:YES];
    
    
}

-(void)getScreenWidth{
    CGRect screenBound = [[UIScreen mainScreen] bounds];
    CGSize screenSize = screenBound.size;
    CGFloat screenWidth = screenSize.width;
    CGFloat screenHeight = screenSize.height;
    integerWidth = (int) roundf(screenWidth);
    integerHeight = (int) roundf(screenHeight);
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
//This is a big change

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    birdDirection = -15;
    int myFoot=0;
   
    bird.image=[UIImage imageNamed:@"bird1.png"];
  
    goingUp=YES;
    
    
    int rand1= arc4random() % 300;
  tube1.frame=CGRectMake(200, rand1, 25, 400);
    highs++;
    
    [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%d",highs] forKey:@"HighScore"];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}











-(void)birdMoving{
    
    y=y+birdDirection;
    
      bird.frame=CGRectMake(30, y, 50, 50);
    
    
    
    if(goingUp==YES){
        /**/
        stopDown++;
        if(stopDown>4){
            stopDown=0;
         birdDirection = 9;
        goingUp=NO;
       NSLog(@"If Statement worked %d",y);
       
          bird.image=[UIImage imageNamed:@"bird2.png"];
        }
    }
}











@end
