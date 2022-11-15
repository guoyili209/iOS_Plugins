//
//  Leaderboard.m
//  PurchTest
//
//  Created by anni on 2022/11/15.
//

#import <Foundation/Foundation.h>
#import "Leaderboard.h"
#import <GameKit/GameKit.h>
@interface Leaderboard()<GKGameCenterControllerDelegate>
@end

@implementation Leaderboard

-(void)SubmitScore:(int64_t)nu //submit the score to game centre
{
    NSArray<NSString *> *leaderboardIDs = [@"fuita_crush_high_score" componentsSeparatedByString:@","];
    
    if (@available(iOS 14.0, *)) {
        [GKLeaderboard submitScore:nu context:0 player:[GKLocalPlayer localPlayer] leaderboardIDs:leaderboardIDs completionHandler:^(NSError * _Nullable error) {
            if(error!=nil){
                NSLog(@"error%@",[error localizedDescription]);
            }
            NSLog(@"sumit success");
        }];
    } else {
        // Fallback on earlier versions
        GKScore *score = [[GKScore alloc] initWithLeaderboardIdentifier:@"fuita_crush_high_score"];
        int64_t GameCenterScore = nu;
        score.value = GameCenterScore;
        [GKScore reportScores:@[score] withCompletionHandler:^(NSError *error) {
            if (error != nil) {
                NSLog(@"%@", [error localizedDescription]);
            }
        }];
    }
}


-(void)Authentication //log player into game centre
{
    GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
    
    localPlayer.authenticateHandler = ^(UIViewController *viewController, NSError *error){
        if (viewController != nil) {
            [self.vc presentViewController:viewController animated:YES completion:nil];
        }
        else{
            if ([GKLocalPlayer localPlayer].authenticated) {
                NSLog(@"authentication succcesful");
                self.GameCenterAvaliable = YES;
                [[GKLocalPlayer localPlayer] loadDefaultLeaderboardIdentifierWithCompletionHandler:^(NSString *leaderboardIdentifier, NSError *error) {
                    if (error != nil) {
                        NSLog(@"%@", [error localizedDescription]);
                    }
                    else{
                        leaderboardIdentifier = leaderboardIdentifier;
                    }
                }];
            }
            else{
                NSLog(@"authentication unseuccseful");
                self.GameCenterAvaliable = NO;
            }
        }
    };
}
-(void)ShowGameCenter //show game centre
{
    if(self.GameCenterAvaliable==NO){
        [self Authentication];
        return;
    }
    GKGameCenterViewController *gameCenterViewController = [[GKGameCenterViewController alloc] init];
    if (gameCenterViewController != nil) {
        gameCenterViewController.gameCenterDelegate = self;
        [self.vc presentViewController:gameCenterViewController animated:YES completion:nil];
    }
}
//-(IBAction)ShowGameCenter:(id)sender //show game centre
//{
//    GKLeaderboardViewController *LeaderboardController = [[GKLeaderboardViewController alloc] init];
//    if (LeaderboardController != nil) {
//        LeaderboardController.leaderboardDelegate = self;
//        [self presentViewController:LeaderboardController animated:YES];
//    }
//}

- (void)gameCenterViewControllerDidFinish:(nonnull GKGameCenterViewController *)gameCenterViewController {
    [self.vc dismissViewControllerAnimated:YES completion:nil];
}

@end
