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

//@property (strong, nonatomic) NSMutableArray *squareArray;

@property (strong, nonatomic) UIAlertView *winnersAlert;

@property (strong, nonatomic) NSMutableArray *winnersArray;
//@property (strong, nonatomic) NSMutableArray *rowOneWin;
//@property (strong, nonatomic) NSMutableArray *rowTwoWin;
//@property (strong, nonatomic) NSMutableArray *rowThreeWin;
//@property (strong, nonatomic) NSMutableArray *colOneWin;
//@property (strong, nonatomic) NSMutableArray *colTwoWin;
//@property (strong, nonatomic) NSMutableArray *colThreeWin;
//@property (strong, nonatomic) NSMutableArray *diagOneWin;
//@property (strong, nonatomic) NSMutableArray *diagTwoWin;

@property (weak, nonatomic) IBOutlet UILabel *turnLabel;

@property (strong, nonatomic) TttSquare *squareOne;
@property (strong, nonatomic) TttSquare *squareTwo;
@property (strong, nonatomic) TttSquare *squareThree;
@property (strong, nonatomic) TttSquare *squareFour;
@property (strong, nonatomic) TttSquare *squareFive;
@property (strong, nonatomic) TttSquare *squareSix;
@property (strong, nonatomic) TttSquare *squareSeven;
@property (strong, nonatomic) TttSquare *squareEight;
@property (strong, nonatomic) TttSquare *squareNine;

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
-(void) isWinner;

@end

@implementation ViewController


-(NSString*) turnTextChange:(int) pTurn {
    if (pTurn == 1) {
        return @"Player 2's Turn";
    } else {
        return @"Player 1's Turn";
    }
}

-(NSString*) exoroh:(int) pTurn {
    if (pTurn == 1) {
        playerTurn = 2;
        //NSLog(@"%i", playerTurn);
        return @"X";
    } else {
        playerTurn = 1;
        return @"O";
    }
}

-(void) isWinner {
    if (self.winnersArray[0] == self.winnersArray[1] && self.winnersArray[0] == self.winnersArray[2]) {
        self.winnersAlert = [[UIAlertView alloc] initWithTitle:@"Winner!" message:[NSString stringWithFormat:@"Player %@ Wins!", self.winnersArray[0]] delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
        [self.winnersAlert show];
    } else if (self.winnersArray[3] == self.winnersArray[4] && self.winnersArray[3] == self.winnersArray[5]) {
        self.winnersAlert = [[UIAlertView alloc] initWithTitle:@"Winner!" message:[NSString stringWithFormat:@"Player %@ Wins!", self.winnersArray[3]] delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
        [self.winnersAlert show];
    } else if (self.winnersArray[6] == self.winnersArray[7] && self.winnersArray[6] == self.winnersArray[8]) {
        self.winnersAlert = [[UIAlertView alloc] initWithTitle:@"Winner!" message:[NSString stringWithFormat:@"Player %@ Wins!", self.winnersArray[6]] delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
        [self.winnersAlert show];
    } else if (self.winnersArray[0] == self.winnersArray[3] && self.winnersArray[0] == self.winnersArray[6]) {
        self.winnersAlert = [[UIAlertView alloc] initWithTitle:@"Winner!" message:[NSString stringWithFormat:@"Player %@ Wins!", self.winnersArray[0]] delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
        [self.winnersAlert show];
    } else if (self.winnersArray[1] == self.winnersArray[4] && self.winnersArray[1] == self.winnersArray[7]) {
        self.winnersAlert = [[UIAlertView alloc] initWithTitle:@"Winner!" message:[NSString stringWithFormat:@"Player %@ Wins!", self.winnersArray[1]] delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
        [self.winnersAlert show];
    } else if (self.winnersArray[2] == self.winnersArray[5] && self.winnersArray[2] == self.winnersArray[8]) {
        self.winnersAlert = [[UIAlertView alloc] initWithTitle:@"Winner!" message:[NSString stringWithFormat:@"Player %@ Wins!", self.winnersArray[2]] delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
        [self.winnersAlert show];
    } else if (self.winnersArray[0] == self.winnersArray[4] && self.winnersArray[0] == self.winnersArray[8]) {
        self.winnersAlert = [[UIAlertView alloc] initWithTitle:@"Winner!" message:[NSString stringWithFormat:@"Player %@ Wins!", self.winnersArray[0]] delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
        [self.winnersAlert show];
    } else if (self.winnersArray[2] == self.winnersArray[4] && self.winnersArray[2] == self.winnersArray[6]) {
        self.winnersAlert = [[UIAlertView alloc] initWithTitle:@"Winner!" message:[NSString stringWithFormat:@"Player %@ Wins!", self.winnersArray[2]] delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
        [self.winnersAlert show];
    }   else {
        NSLog(@"Nothing to do here!");
    }
}


//Button handler for box 1
- (IBAction)buttonOne:(id)sender {
    if (self.squareOne.squareVal == 0) {
        self.squareOne.squareVal = playerTurn;
        self.turnLabel.text = [self turnTextChange:playerTurn];
        
        //Updated winnersArray NEEDS to be removed
        if (playerTurn == 1) {
            self.winnersArray[0] = @"1";
        } else {
            self.winnersArray[0] = @"2";
        }
        
        self.boxOne.text = [self exoroh:playerTurn];
        
        //Check for winner and show alert if there is
        [self isWinner];
     
    } else {
        NSLog(@"Nothing to do!");
    }

}

//Button handler for box 2
- (IBAction)buttonTwo:(id)sender {
    if (self.squareTwo.squareVal == 0) {
        self.squareTwo.squareVal = playerTurn;
        self.turnLabel.text = [self turnTextChange:playerTurn];
        
        //Updated winnersArray NEEDS to be removed
        if (playerTurn == 1) {
            self.winnersArray[1] = @"1";
        } else {
            self.winnersArray[1] = @"2";
        }
        
        self.boxTwo.text = [self exoroh:playerTurn];
        
        //Check for winner and show alert if there is
        [self isWinner];
        
    } else {
        NSLog(@"Nothing to do!");
    }
}

//Button handler for box 3
- (IBAction)buttonThree:(id)sender {
    if (self.squareThree.squareVal == 0) {
        self.squareThree.squareVal = playerTurn;
        self.turnLabel.text = [self turnTextChange:playerTurn];
        
        //Updated winnersArray NEEDS to be removed
        if (playerTurn == 1) {
            self.winnersArray[2] = @"1";
        } else {
            self.winnersArray[2] = @"2";
        }
        
        self.boxThree.text = [self exoroh:playerTurn];
        
        //Check for winner and show alert if there is
        [self isWinner];
        
    } else {
        NSLog(@"Nothing to do!");
    }
}
//Button handler for box 4

- (IBAction)buttonFour:(id)sender {
    if (self.squareFour.squareVal == 0) {
        self.squareFour.squareVal = playerTurn;
        self.turnLabel.text = [self turnTextChange:playerTurn];
        
        //Updated winnersArray NEEDS to be removed
        if (playerTurn == 1) {
            self.winnersArray[3] = @"1";
        } else {
            self.winnersArray[3] = @"2";
        }
        
        self.boxFour.text = [self exoroh:playerTurn];
        
        //Check for winner and show alert if there is
        [self isWinner];
        
    } else {
        NSLog(@"Nothing to do!");
    }
}

//Button handler for box 5
- (IBAction)buttonFive:(id)sender {
    if (self.squareFive.squareVal == 0) {
        self.squareFive.squareVal = playerTurn;
        self.turnLabel.text = [self turnTextChange:playerTurn];
        
        //Updated winnersArray NEEDS to be removed
        if (playerTurn == 1) {
            self.winnersArray[4] = @"1";
        } else {
            self.winnersArray[4] = @"2";
        }
        
        self.boxFive.text = [self exoroh:playerTurn];
        
        //Check for winner and show alert if there is
        [self isWinner];
        
    } else {
        NSLog(@"Nothing to do!");
    }
}

//Button handler for box 6
- (IBAction)buttonSix:(id)sender {
    if (self.squareSix.squareVal == 0) {
        self.squareSix.squareVal = playerTurn;
        self.turnLabel.text = [self turnTextChange:playerTurn];
        
        //Updated winnersArray NEEDS to be removed
        if (playerTurn == 1) {
            self.winnersArray[5] = @"1";
        } else {
            self.winnersArray[5] = @"2";
        }
        
        self.boxSix.text = [self exoroh:playerTurn];
        
        //Check for winner and show alert if there is
        [self isWinner];
    
    } else {
        NSLog(@"Nothing to do!");
    }
}


//Button handler for box 7
- (IBAction)buttonSeven:(id)sender {
    if (self.squareSeven.squareVal == 0) {
        self.squareSeven.squareVal = playerTurn;
        self.turnLabel.text = [self turnTextChange:playerTurn];
        
        //Updated winnersArray NEEDS to be removed
        if (playerTurn == 1) {
            self.winnersArray[6] = @"1";
        } else {
            self.winnersArray[6] = @"2";
        }
        
        self.boxSeven.text = [self exoroh:playerTurn];
        
        //Check for winner and show alert if there is
        [self isWinner];
        
    } else {
        NSLog(@"Nothing to do!");
    }
}

//Button handler for box 8
- (IBAction)buttonEight:(id)sender {
    if (self.squareEight.squareVal == 0) {
        self.squareEight.squareVal = playerTurn;
        self.turnLabel.text = [self turnTextChange:playerTurn];
        
        //Updated winnersArray NEEDS to be removed
        if (playerTurn == 1) {
            self.winnersArray[7] = @"1";
        } else {
            self.winnersArray[7] = @"2";
        }
        
        self.boxEight.text = [self exoroh:playerTurn];
        
        //Check for winner and show alert if there is
        [self isWinner];
        
    } else {
        NSLog(@"Nothing to do!");
    }
}

//Button handler for box 9
- (IBAction)buttonNine:(id)sender {
    if (self.squareNine.squareVal == 0) {
        self.squareNine.squareVal = playerTurn;
        self.turnLabel.text = [self turnTextChange:playerTurn];
        
        //Updated winnersArray NEEDS to be removed
        if (playerTurn == 1) {
            self.winnersArray[8] = @"1";
        } else {
            self.winnersArray[8] = @"2";
        }
        
        self.boxNine.text = [self exoroh:playerTurn];
        
        //Check for winner and show alert if there is
        [self isWinner];
        
    } else {
        NSLog(@"Nothing to do!");
    }
    
}

- (IBAction)resetButton:(id)sender {
    self.boxOne.text = @"";
    self.squareOne.squareVal = 0;
    self.boxTwo.text = @"";
    self.squareTwo.squareVal = 0;
    self.boxThree.text = @"";
    self.squareThree.squareVal = 0;
    self.boxFour.text = @"";
    self.squareFour.squareVal = 0;
    self.boxFive.text = @"";
    self.squareFive.squareVal = 0;
    self.boxSix.text = @"";
    self.squareSix.squareVal = 0;
    self.boxSeven.text = @"";
    self.squareSeven.squareVal = 0;
    self.boxEight.text = @"";
    self.squareEight.squareVal = 0;
    self.boxNine.text = @"";
    self.squareNine.squareVal = 0;
    self.winnersArray[0] = @"01";
    self.winnersArray[1] = @"02";
    self.winnersArray[2] = @"03";
    self.winnersArray[3] = @"04";
    self.winnersArray[4] = @"05";
    self.winnersArray[5] = @"06";
    self.winnersArray[6] = @"07";
    self.winnersArray[7] = @"08";
    self.winnersArray[8] = @"09";
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
    
    self.winnersArray = [[NSMutableArray alloc] initWithObjects: @"01", @"02", @"03", @"04", @"05", @"06", @"07", @"08", nil];
    
    
    // Loading all 9 square objects in to an array
    //NSMutableArray *squareArray = [[NSMutableArray alloc] initWithObjects: self.squareOne, self.squareTwo, self.squareThree, self.squareFour, self.squareFive, self.squareSix, self.squareSeven, self.squareEight, self.squareNine, nil];
    //NSLog(@"%d", [squareArray[0] squareVal]);
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
