//
//  Bridge.h
//  PurchTest
//
//  Created by anni on 2022/11/17.
//

#ifndef Bridge_h
#define Bridge_h
#import "ViewController.h"

@interface Bridge:NSObject
@property ViewController *vc;
+ (Bridge*)Ins;
@end


#endif /* Bridge_h */
