//
//  MIAWPluginExample.m
//  App
//
//  Created by Jeremy Wright on 2023-06-06.
//

#import <Foundation/Foundation.h>
#import <Capacitor/Capacitor.h>

CAP_PLUGIN(MIAWPluginExample, "MIAWPluginExample",
  CAP_PLUGIN_METHOD(startConversation, CAPPluginReturnPromise);
)
