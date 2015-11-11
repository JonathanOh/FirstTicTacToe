//
//  ViewController.m
//  TicTacToe
//
//  Created by Jonathan Oh on 10/25/15.
//  Copyright (c) 2015 Jonathan Oh. All rights reserved.
//

#import "ViewController.h"
#import "TttSquare.h"


int playerTurn = 1;

@interface ViewController ()

@property (strong, nonatomic) UIAlertView *winnersAlert;

@property (nonatomic) BOOL weHaveWinner;

@property (strong, nonatomic) NSArray *squareArray;
@property (strong, nonatomic) NSMutableArray *boxArray;
@property (strong, nonatomic) NSMutableArray *winnersArray;

@property (weak, nonatomic) IBOutlet UILabel *turnLabel;
@property (weak, nonatomic) IBOutlet UILabel *boxOne;
@property (weak, nonatomic) IBOutlet UILabel *boxTwo;
@property (weak, nonatomic) IBOutlet UILabel *boxThree;
@property (weak, nonatomic) IBOutlet UILabel *boxFour;
@property (weak, nonatomic) IBOutlet UILabel *boxFive;
@property (weak, nonatomic) IBOutlet UILabel *boxSix;
@property (weak, nonatomic) IBOutlet UILabel *boxSeven;
@property (weak, nonatomic) IBOutlet UILabel *boxEight;
@property (weak, nonatomic) IBOutlet UILabel *boxNine;

-(NSString*) exoroh:(int) pTurn;
-(NSString*) turnTextChange:(int) pTurn;
-(void) isWinner:(int)pTurn;

@end

@implementation ViewController


-(NSString*) turnTextChange:(int) pTurn {
    if (pTurn == 1) {
        return @"Player 2's Turn";
    } else {
        return @"Player 1's Turn";
    }
}

-(NSString*) exoroh:(int) pTurn{
    if (pTurn == 1) {
        return @"X";
    } else {
        return @"O";
    }
}

-(void) isWinner:(int) pTurn {
    self.weHaveWinner = NO;
    if ([self.squareArray[0] squareVal] != 0 && [self.squareArray[0] squareVal] == [self.squareArray[1] squareVal] && [self.squareArray[0] squareVal] == [self.squareArray[2] squareVal]) {
        self.weHaveWinner = YES;
    } else if ([self.squareArray[3] squareVal] != 0 && [self.squareArray[3] squareVal] == [self.squareArray[4] squareVal] && [self.squareArray[3] squareVal] == [self.squareArray[5] squareVal]) {
        self.weHaveWinner = YES;
    } else if ([self.squareArray[6] squareVal] != 0 && [self.squareArray[6] squareVal] == [self.squareArray[7] squareVal] && [self.squareArray[6] squareVal] == [self.squareArray[8] squareVal]) {
        self.weHaveWinner = YES;
    } else if ([self.squareArray[0] squareVal] != 0 && [self.squareArray[0] squareVal] == [self.squareArray[3] squareVal] && [self.squareArray[0] squareVal] == [self.squareArray[6] squareVal]) {
        self.weHaveWinner = YES;
    } else if ([self.squareArray[1] squareVal] != 0 && [self.squareArray[1] squareVal] == [self.squareArray[4] squareVal] && [self.squareArray[1] squareVal] == [self.squareArray[7] squareVal]) {
        self.weHaveWinner = YES;
    } else if ([self.squareArray[2] squareVal] != 0 && [self.squareArray[2] squareVal] == [self.squareArray[5] squareVal] && [self.squareArray[2] squareVal] == [self.squareArray[8] squareVal]) {
        self.weHaveWinner = YES;
    } else if ([self.squareArray[0] squareVal] != 0 && [self.squareArray[0] squareVal] == [self.squareArray[4] squareVal] && [self.squareArray[0] squareVal] == [self.squareArray[8] squareVal]) {
        self.weHaveWinner = YES;
    } else if ([self.squareArray[2] squareVal] != 0 && [self.squareArray[2] squareVal] == [self.squareArray[4] squareVal] && [self.squareArray[2] squareVal] == [self.squareArray[6] squareVal]) {
        self.weHaveWinner = YES;
    } else {
        playerTurn = (pTurn == 1) ? 2 : 1;
    }
    if (self.weHaveWinner) {
        self.winnersAlert = [[UIAlertView alloc] initWithTitle:@"Winner!" message:[NSString stringWithFormat:@"Player %i Wins!", pTurn] delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
        [self.winnersAlert show];
    }
}

// Handles all 9 ttt button logic
- (IBAction)tttButtons:(id)sender {
    if ([self.squareArray[[sender tag]-1] squareVal] == 0) {
        ((TttSquare *)self.squareArray[[sender tag]-1]).squareVal = playerTurn;
        self.turnLabel.text = [self turnTextChange:playerTurn];
        ((UILabel *)self.boxArray[[sender tag]-1]).text = [self exoroh:playerTurn];
        
        //Check for winner and show alert if there is
        [self isWinner:playerTurn];
    }
}

// Resets the board
- (IBAction)resetButton:(id)sender {
    for (TttSquare *square in self.squareArray) {
        square.squareVal = 0;
    }
    
    for (UILabel *label in self.boxArray) {
        label.text = @"";
    }
    
    self.weHaveWinner = NO;
    self.turnLabel.text = @"Player 1's Turn";
    playerTurn = 1;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Initializing my square objects with a Square Number Value and a Player Value that repesents if X, O, or Nothing resides there
    self.squareArray = [NSArray array];
    for (int i = 1; i < 10; i++) {
        self.squareArray = [self.squareArray arrayByAddingObject:[[TttSquare alloc] initWithNumberAndValue:i :0]];
    }
    
    // Loading all 9 square objects in to an array
    self.boxArray = [[NSMutableArray alloc] initWithObjects: self.boxOne, self.boxTwo, self.boxThree, self.boxFour, self.boxFive, self.boxSix, self.boxSeven, self.boxEight, self.boxNine, nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
