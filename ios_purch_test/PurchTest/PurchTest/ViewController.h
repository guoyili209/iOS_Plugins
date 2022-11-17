//
//  ViewController.h
//  PurchTest
//
//  Created by anni on 2022/11/4.
//

#import <UIKit/UIKit.h>
#import "Leaderboard.h"
#import "UnityAdMgr.h"

@interface ViewController : UIViewController

@property UnityAdMgr *admgr;
@property Leaderboard *leaderboard;
@property BOOL areAdsRemoved;
-(IBAction)restore;
-(IBAction)tapsGameGift;
-(IBAction)ShowInterstial;
-(IBAction)ShowLeaderboard;

@end

