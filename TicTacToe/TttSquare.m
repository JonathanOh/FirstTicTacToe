//
//  TttSquare.m
//  TicTacToe
//
//  Created by Jonathan Oh on 10/27/15.
//  Copyright (c) 2015 Jonathan Oh. All rights reserved.
//

#import "TttSquare.h"

@implementation TttSquare

- (id)initWithNumberAndValue: (int)squareNum :(int)squareVal
{
    self = [super init];
    if (self) {
        _squareNum = squareNum;
        _squareVal = squareVal;
    }
    return self;
}

@end
