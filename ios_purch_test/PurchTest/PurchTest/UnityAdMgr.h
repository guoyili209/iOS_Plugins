//
//  UnityAds.h
//  PurchTest
//
//  Created by anni on 2022/11/17.
//

#ifndef UnityAds_h
#define UnityAds_h
#import <UnityAds/UnityAds.h>
#import <UIKit/UIKit.h>
@interface UnityAdMgr : NSObject<UnityAdsInitializationDelegate,UnityAdsLoadDelegate,UnityAdsShowDelegate>
-(void)Init;
-(void)Showbanner;
-(void)ShowInterstital:(UIViewController *)vc;
-(void)ShowReward:(UIViewController *)vc;
@property (assign,nonatomic) BOOL testMode;
@end

#endif /* UnityAds_h */
