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
@property (strong, nonatomic) NSMutableArray *winnersArray;
@property (weak, nonatomic) IBOutlet UILabel *turnLabel;
@property (nonatomic) BOOL weHaveWinner;

@property (strong, nonatomic) NSArray *squareArray;
@property (strong, nonatomic) TttSquare *squareOne;
@property (strong, nonatomic) TttSquare *squareTwo;
@property (strong, nonatomic) TttSquare *squareThree;
@property (strong, nonatomic) TttSquare *squareFour;
@property (strong, nonatomic) TttSquare *squareFive;
@property (strong, nonatomic) TttSquare *squareSix;
@property (strong, nonatomic) TttSquare *squareSeven;
@property (strong, nonatomic) TttSquare *squareEight;
@property (strong, nonatomic) TttSquare *squareNine;

@property (strong, nonatomic) NSMutableArray *boxArray;
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


//Button handler for box 1
- (IBAction)buttonOne:(id)sender {
    if ([self.squareArray[0] squareVal] == 0) {
        ((TttSquare *)self.squareArray[0]).squareVal = playerTurn;
        self.turnLabel.text = [self turnTextChange:playerTurn];
        self.boxOne.text = [self exoroh:playerTurn];
        
        //Check for winner and show alert if there is
        [self isWinner:playerTurn];
    }
}

//Button handler for box 2
- (IBAction)buttonTwo:(id)sender {
    if ([self.squareArray[1] squareVal] == 0) {
        ((TttSquare *)self.squareArray[1]).squareVal = playerTurn;
        self.turnLabel.text = [self turnTextChange:playerTurn];
        self.boxTwo.text = [self exoroh:playerTurn];
        
        //Check for winner and show alert if there is
        [self isWinner:playerTurn];
    }
}

//Button handler for box 3
- (IBAction)buttonThree:(id)sender {
    if ([self.squareArray[2] squareVal] == 0) {
        ((TttSquare *)self.squareArray[2]).squareVal = playerTurn;
        self.turnLabel.text = [self turnTextChange:playerTurn];
        self.boxThree.text = [self exoroh:playerTurn];
        
        //Check for winner and show alert if there is
        [self isWinner:playerTurn];
    }
}
//Button handler for box 4

- (IBAction)buttonFour:(id)sender {
    if ([self.squareArray[3] squareVal] == 0) {
        ((TttSquare *)self.squareArray[3]).squareVal = playerTurn;
        self.turnLabel.text = [self turnTextChange:playerTurn];
        self.boxFour.text = [self exoroh:playerTurn];
        
        //Check for winner and show alert if there is
        [self isWinner:playerTurn];
    }
}

//Button handler for box 5
- (IBAction)buttonFive:(id)sender {
    if ([self.squareArray[4] squareVal] == 0) {
        ((TttSquare *)self.squareArray[4]).squareVal = playerTurn;
        self.turnLabel.text = [self turnTextChange:playerTurn];
        self.boxFive.text = [self exoroh:playerTurn];
        
        //Check for winner and show alert if there is
        [self isWinner:playerTurn];
    }
}

//Button handler for box 6
- (IBAction)buttonSix:(id)sender {
    if ([self.squareArray[5] squareVal] == 0) {
        ((TttSquare *)self.squareArray[5]).squareVal = playerTurn;
        self.turnLabel.text = [self turnTextChange:playerTurn];
        self.boxSix.text = [self exoroh:playerTurn];
        
        //Check for winner and show alert if there is
        [self isWinner:playerTurn];
    }
}

//Button handler for box 7
- (IBAction)buttonSeven:(id)sender {
    if ([self.squareArray[6] squareVal] == 0) {
        ((TttSquare *)self.squareArray[6]).squareVal = playerTurn;
        self.turnLabel.text = [self turnTextChange:playerTurn];
        self.boxSeven.text = [self exoroh:playerTurn];
        
        //Check for winner and show alert if there is
        [self isWinner:playerTurn];
    }
}

//Button handler for box 8
- (IBAction)buttonEight:(id)sender {
    if ([self.squareArray[7] squareVal] == 0) {
        ((TttSquare *)self.squareArray[7]).squareVal = playerTurn;
        self.turnLabel.text = [self turnTextChange:playerTurn];
        self.boxEight.text = [self exoroh:playerTurn];
        
        //Check for winner and show alert if there is
        [self isWinner:playerTurn];
    }
}

//Button handler for box 9
- (IBAction)buttonNine:(id)sender {
    if ([self.squareArray[8] squareVal] == 0) {
        ((TttSquare *)self.squareArray[8]).squareVal = playerTurn;
        self.turnLabel.text = [self turnTextChange:playerTurn];
        self.boxNine.text = [self exoroh:playerTurn];
        
        //Check for winner and show alert if there is
        [self isWinner:playerTurn];
    }
}

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
    self.squareOne =   [[TttSquare alloc] initWithNumberAndValue:1 :0];
    self.squareTwo =   [[TttSquare alloc] initWithNumberAndValue:2 :0];
    self.squareThree = [[TttSquare alloc] initWithNumberAndValue:3 :0];
    self.squareFour =  [[TttSquare alloc] initWithNumberAndValue:4 :0];
    self.squareFive =  [[TttSquare alloc] initWithNumberAndValue:5 :0];
    self.squareSix =   [[TttSquare alloc] initWithNumberAndValue:6 :0];
    self.squareSeven = [[TttSquare alloc] initWithNumberAndValue:7 :0];
    self.squareEight = [[TttSquare alloc] initWithNumberAndValue:8 :0];
    self.squareNine =  [[TttSquare alloc] initWithNumberAndValue:9 :0];
    
    // Loading all 9 square objects in to an array
    self.squareArray = [[NSArray alloc] initWithObjects: self.squareOne, self.squareTwo, self.squareThree, self.squareFour, self.squareFive, self.squareSix, self.squareSeven, self.squareEight, self.squareNine, nil];
    self.boxArray = [[NSMutableArray alloc] initWithObjects: self.boxOne, self.boxTwo, self.boxThree, self.boxFour, self.boxFive, self.boxSix, self.boxSeven, self.boxEight, self.boxNine, nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
