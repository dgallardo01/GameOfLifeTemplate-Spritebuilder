//
//  Grid.m
//  GameOfLife
//
//  Created by Danny on 6/25/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Grid.h"
#import "Creature.h"

// these are the variable that cannot be changed
static const NSInteger GRID_ROWS = 8;
static const NSInteger GRID_COLUMNS = 10;

@implementation Grid{
    NSMutableArray *_gridArray;
    float _cellWidth;
    float _cellHeight;
}

- (void)onEnter{
    [super onEnter];
    
    [self setupGrid];
    
    //accept touches on the grid
    self.userInteractionEnabled = YES;
}

- (void)setupGrid{
    //divide the grid's size by the number of columns/rows to figure out the right width
    _cellWidth = self.contentSize.width / GRID_COLUMNS;
    _cellHeight = self.contentSize.height / GRID_ROWS;
    
    float x = 0;
    float y = 0;
    
    //initialize the array as a blank NSMutableArray
    _gridArray = [NSMutableArray new];
    
    //initialize Creatures
    for (NSInteger i=0; i<GRID_ROWS; i++) {
        //this is how you create two dimensional arrays in Objective-C.  You put arrays into arrays
        _gridArray[i] = [NSMutableArray new];
        x =0;
        
        for (NSInteger j=0; j < GRID_COLUMNS; j++) {
            Creature *creature = [[Creature alloc] initCreature];
            creature.anchorPoint = ccp(0, 0);
            creature.position = ccp(x, y);
            [self addChild:creature];
            
            //this is shotrhand to access an array inside an array
            _gridArray[i][j] = creature;
            
            x+= _cellWidth;
        }
        
        y += _cellHeight;
    }
}

- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
    //get the x,y coordinates of the touch
    CGPoint touchLocation = [touch locationInNode:self];
    
    //get the Creature at that location
    Creature *creature = [self creatureForTouchPosition:touchLocation];
    
    //invert it's state -kill it if it's alive, bring it back to life if its dead
    creature.isAlive = !creature.isAlive;
}

- (Creature *)creatureForTouchPosition:(CGPoint)touchPosition{
    //get the row and climn that was touched, return the Creature inside the corresponding cell
    NSInteger row = touchPosition.y / _cellHeight;
    NSInteger column = touchPosition.x / _cellWidth;
    
    return _gridArray[row][column];
}
@end
