//
//  main.m
//  NOCList-ObjC
//
//  Created by Karen Rodriguez on 5/10/20.
//  Copyright © 2020 Hector Ledesma. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSIAgent.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");

        LSIAgent *agent1 = [[LSIAgent alloc] initWithCoverName:@"Ethan Hunt" realName:@"Tom Cruise" accessLevel:8 compromised:FALSE];
        LSIAgent *agent2 = [[LSIAgent alloc] initWithCoverName:@"Jim Phelps" realName:@"Jon Voight" accessLevel:9 compromised:TRUE];
        LSIAgent *agent3 = [[LSIAgent alloc] initWithCoverName:@"Claire Phelps" realName:@"Emmanuelle Beart" accessLevel:5 compromised:FALSE];
        LSIAgent *agent4 = [[LSIAgent alloc] initWithCoverName:@"Eugene Kittridge" realName:@"Henry Czerny" accessLevel:10 compromised:TRUE];
        LSIAgent *agent5 = [[LSIAgent alloc] initWithCoverName:@"Franz Krieger" realName:@"Jean Reno" accessLevel:4 compromised:FALSE];
        LSIAgent *agent6 = [[LSIAgent alloc] initWithCoverName:@"Luther Stickell" realName:@"Ving Rhames" accessLevel:4 compromised:FALSE];
        LSIAgent *agent7 = [[LSIAgent alloc] initWithCoverName:@"Sarah Davies" realName:@"Kristin Scott Thomas" accessLevel:5 compromised:TRUE];
        LSIAgent *agent8 = [[LSIAgent alloc] initWithCoverName:@"Max RotGrab" realName:@"Vanessa Redgrave" accessLevel:4 compromised:FALSE];
        LSIAgent *agent9 = [[LSIAgent alloc] initWithCoverName:@"Hannah Williams" realName:@"Ingeborga Dapkūnaitė" accessLevel:5 compromised:TRUE];
        LSIAgent *agent10 = [[LSIAgent alloc] initWithCoverName:@"Jack Harmon" realName:@"Emilio Estevez" accessLevel:6 compromised:TRUE];
        LSIAgent *agent11 = [[LSIAgent alloc] initWithCoverName:@"Frank Barnes" realName:@"Dale Dye" accessLevel:9 compromised:FALSE];

        NSArray *nocList = @[agent1, agent2, agent3, agent4, agent5, agent6, agent7, agent8, agent9, agent10, agent11];


        // MARK:- Check for compromised agents.

        int compAgents = 0;

        for (LSIAgent *agent in nocList) {
            if (agent.compromised.boolValue) { // So gotta use boolValue?
                compAgents++; // AYY WE GOT ++ BACK BABYYYY
            }
        }

        NSLog(@"Compromised agents: %d", compAgents);

        // MARK:- Check for high access agents.

        for (LSIAgent *agent in nocList) {
            if (agent.accessLevel.intValue >= 8) {
                NSString *first = @"Agent: ";
                NSString *second = @"access leve: ";
                NSString *warning = @" :::WARNING COMPROMISED:::";
                NSString *noWarning = @"";
                NSString *printOut = [NSString stringWithFormat:@"%@ %@, %@ %d %@" , first, agent.realName, second, agent.accessLevel.intValue, agent.compromised.boolValue ? warning : noWarning];
                NSLog(@"%@", printOut);
            }
        }

        // MARK:- Check for Low, Mid and High level agents.

        // Counters
        int low = 0;
        int mid = 0;
        int high = 0;

        for (LSIAgent *agent in nocList) {
            if (agent.accessLevel.intValue <= 4) {
                // Low level agents
                low++;
            } else if (agent.accessLevel.intValue <= 7) {
                // Mid level agents
                mid++;
            } else {
                // High level agents
                high++;
            }
        }

        NSLog(@"%d low level agents, %d mid level agents, and %d high level agents.", low, mid, high);
    }
    return 0;
}
