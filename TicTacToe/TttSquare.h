//
//  TttSquare.h
//  TicTacToe
//
//  Created by Jonathan Oh on 10/27/15.
//  Copyright (c) 2015 Jonathan Oh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TttSquare : NSObject

@property int squareNum;
@property (nonatomic, assign) int squareVal;

- (id)initWithNumberAndValue: (int)squareNum :(int)squareVal;

@end
