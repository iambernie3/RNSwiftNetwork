//
//  CheckNetworkManager.m
//  RNSwiftCheckNetwork
//
//  Created by DNA on 3/21/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import "RCTBridgeModule.h"


@interface RCT_EXTERN_MODULE(CheckNetwork, NSObject)

RCT_EXTERN_METHOD(isConnectedToNetwork: (RCTResponseSenderBlock) callback);


@end