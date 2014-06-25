//
//  Creature.m
//  GameOfLife
//
//  Created by Danny on 6/25/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Creature.h"

@implementation Creature

- (instancetype)initCreature{
    //since we made Create inherit from CCSprite, 'super below refers to CCSprite
    self = [super initWithImageNamed:@"GameOfLifeAssets/Assets/bubble.png"];
    
    if(self){
        self.isAlive = NO;
    }
    return self;
}

- (void)setIsAlive:(BOOL)newState{
    
    self.isAlive = newState;
    
    self.visible = self.isAlive;
}

@end
