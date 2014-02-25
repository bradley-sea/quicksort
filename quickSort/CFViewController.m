//
//  CFViewController.m
//  quickSort
//
//  Created by Brad on 2/24/14.
//  Copyright (c) 2014 Brad. All rights reserved.
//

#import "CFViewController.h"
#import "Node.h"

@interface CFViewController ()

@end

@implementation CFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSMutableArray *tempArray = [NSMutableArray new];
    
    Node *node6 = [Node new];
    node6.data = 6;
    Node *node3 = [Node new];
    node3.data = 3;
    Node *node7 = [Node new];
    node7.data = 7;
    Node *node8 = [Node new];
    node8.data = 8;
    Node *node2 = [Node new];
    node2.data = 2;
    Node *node4 = [Node new];
    node4.data = 4;
    Node *node5 = [Node new];
    node5.data = 5;
    Node *node1 = [Node new];
    node1.data = 1;
    Node *node10 = [Node new];
    node10.data = 10;
    
    tempArray = [NSMutableArray arrayWithObjects:node6,node3,node7,node8,node2,node4,node5,node1,node10, nil];
    
    NSMutableArray *sortedArray =[self quickSortArray:tempArray];
    
    
    
	
}

-(NSMutableArray *)quickSortArray:(NSMutableArray *)unsortedArray
{
    
    if (unsortedArray.count <= 1)
    {
        return unsortedArray;
    }
    Node *pivot;
    if (unsortedArray.count % 2)
    {
        pivot = unsortedArray[(unsortedArray.count + 1) / 2];
    }
    else
    {
        pivot= unsortedArray[unsortedArray.count / 2];
    }
    
    [unsortedArray removeObject:pivot];
    
    NSMutableArray *less = [NSMutableArray new];
    NSMutableArray *greater = [NSMutableArray new];
    
    for (Node *node in unsortedArray)
    {
        if (node.data <= pivot.data)
        {
            [less addObject:node];
        }
        else
        {
            [greater addObject:node];
        }
    }
    
    NSMutableArray *array = [NSMutableArray new];
    array = [array arrayByAddingObjectsFromArray:[self quickSortArray:less]];
    array = [array arrayByAddingObjectsFromArray:@[pivot]];
    array = [array arrayByAddingObjectsFromArray:[self quickSortArray:greater]];
    
    return array;
}

@end
