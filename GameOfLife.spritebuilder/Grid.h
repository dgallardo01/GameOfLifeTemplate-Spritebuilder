//
//  Grid.h
//  GameOfLife
//
//  Created by Danny on 6/25/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "CCSprite.h"

@interface Grid : CCSprite

@property (nonatomic, assign) NSInteger totalAlive;
@property (nonatomic, assign) NSInteger generation;

- (void)evolveStep;
- (void)countNeighbors;
- (void)updateCreatures;

@end
