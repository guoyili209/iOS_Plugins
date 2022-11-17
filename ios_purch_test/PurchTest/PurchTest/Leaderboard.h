//
//  Leaderboard.h
//  PurchTest
//
//  Created by anni on 2022/11/17.
//

#ifndef Leaderboard_h
#define Leaderboard_h


@interface Leaderboard : NSObject
-(void)SubmitScore:(int64_t)nu ;
-(void)ShowGameCenter;
@property BOOL GameCenterAvaliable;
@property BOOL bShowGameCenter;
@property BOOL bSubmitScore;
@end

#endif /* Leaderboard_h */
