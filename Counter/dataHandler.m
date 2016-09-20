//
//  DataHandler.m
//  Counter
//
//  Created by Daniel Sadka on 04.07.2016.
//  Copyright © 2016 Daniel Sadka. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataHandler : NSObject

@property () NSInteger units;
@property () NSInteger decimals;
@property () NSInteger hundrets;
@property () NSInteger counter;

-() init;
-(Boolean) checkUnits;
-(Boolean) checkDecimals;
-(Boolean) checkIfFirstTen;
-(void) reset;

@end

@implementation DataHandler

-() init{
    if(self = [super init]){
        self.units = 0;
        self.decimals = 0;
        self.hundrets = 0;
        self.counter = 0;
        }
    return self;
}

-(Boolean) checkUnits{
    if(self.units == 10){
        self.units = 0;
        self.decimals++;
        return true;
    }
    return false;
}

-(Boolean) checkDecimals{
    if(self.decimals == 10){
        self.decimals = 0;
        self.hundrets++;
        return true;
    }
    return false;
}

-(Boolean) checkIfFirstTen{
    if(self.decimals == 0 && self.counter <= 10){
        return true;
    }
    return false;
}

-(void) reset{
    self.units = 0;
    self.counter = 0;
    self.decimals = 0;
    self.hundrets = 0;
}

@end

