//
//  UnityAdMgr.m
//  PurchTest
//
//  Created by anni on 2022/11/17.
//

#import <Foundation/Foundation.h>
#import "UnityAdMgr.h"

@implementation UnityAdMgr
-(void)Init{
    [UnityAds
     initialize:@"5019392"
     testMode:self.testMode
     initializationDelegate:self];
}
-(void)Showbanner{
    
}
-(void)ShowInterstital:(UIViewController *)vc{
    [UnityAds show:vc placementId:@"Interstitial_iOS" showDelegate:self];
}
-(void)ShowReward:(UIViewController *)vc{
    [UnityAds show:vc placementId:@"Rewarded_iOS" showDelegate:self];
}

- (void)initializationComplete {
    NSLog(@" - UnityAdsInitializationDelegate initializationComplete" );
    // Pre-load an ad when initialization succeeds, so it is ready to show:
    [UnityAds load:@"Interstitial_iOS" loadDelegate:self];
    
}

- (void)initializationFailed:(UnityAdsInitializationError)error withMessage:(nonnull NSString *)message {
    NSLog(@" - UnityAdsInitializationDelegate initializationFailed with message: %@", message );
}

- (void)unityAdsAdFailedToLoad:(nonnull NSString *)placementId withError:(UnityAdsLoadError)error withMessage:(nonnull NSString *)message {
    NSLog(@" - UnityAdsLoadDelegate unityAdsAdFailedToLoad %@", placementId);
}

- (void)unityAdsAdLoaded:(nonnull NSString *)placementId {
    NSLog(@" - UnityAdsLoadDelegate unityAdsAdLoaded %@", placementId);
}

- (void)unityAdsShowClick:(nonnull NSString *)placementId {
    NSLog(@" - UnityAdsShowDelegate unityAdsShowClick %@", placementId);
}

- (void)unityAdsShowComplete:(nonnull NSString *)placementId withFinishState:(UnityAdsShowCompletionState)state {
    NSLog(@" - UnityAdsShowDelegate unityAdsShowComplete %@ %ld", placementId, state);
    if ([placementId isEqualToString:@"Rewarded_iOS"] && state == kUnityShowCompletionStateCompleted) {
        // Reward the user.
    }
}

- (void)unityAdsShowFailed:(nonnull NSString *)placementId withError:(UnityAdsShowError)error withMessage:(nonnull NSString *)message {
    NSLog(@" - UnityAdsShowDelegate unityAdsShowFailed %@ %ld", message, error);
}

- (void)unityAdsShowStart:(nonnull NSString *)placementId {
    NSLog(@" - UnityAdsShowDelegate unityAdsShowStart %@", placementId);
}

@end
