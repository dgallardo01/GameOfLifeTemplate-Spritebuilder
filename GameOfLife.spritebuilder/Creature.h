//
//  Creature.h
//  GameOfLife
//
//  Created by Danny on 6/25/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "CCSprite.h"

@interface Creature : CCSprite

//stores the current state of the creature
@property (nonatomic, assign) BOOL isAlive;

//stores the amount of living neighbours
@property (nonatomic, assign) NSInteger livingNeighbors;

- (id)initCreature;

- (void)setIsAlive:(BOOL)newState;

@end
