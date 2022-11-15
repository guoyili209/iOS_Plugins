//
//  Leaderboard.h
//  PurchTest
//
//  Created by anni on 2022/11/15.
//

#ifndef Leaderboard_h
#define Leaderboard_h
#import <Foundation/Foundation.h>
#import "ViewController.h"

@interface Leaderboard : NSObject
-(void)SubmitScore:(int64_t)score;
-(void)Authentication;
-(void)ShowGameCenter;
@property NSString *leaderboard_id;
@property BOOL GameCenterAvaliable;
@property ViewController *vc;

@end

#endif /* Leaderboard_h */
