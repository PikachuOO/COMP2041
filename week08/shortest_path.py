#!/usr/bin/env python

# Program to find shortest path using Dijkstra's Algorithm
# Callum Howard 2014 - COMP2041

import sys, fileinput

class Node:
    def __init__(self, weight):
        self.weight = weight
    def getWeight(self):
        return self.weight

# Dijkstra
def findDijkstraPath (graph, source, destination):
    #TODO placeholder function needs implementing
    return path


# read in source and destination from arguments
source = sys.argv[1]
destination = sys.argv[2]


# read in edge weights from standard input and populate data structure
adjSet = dict()
for line in sys.stdin:
    words = line.split()

    #--- note no sanity check for standard input
    nodeA = words[0]
    nodeB = words[1]
    weightAB = words[2]

    # Data Structure: Adjacency List using a Dict of Dicts
    # add connection to node
    adjSet.setdefault(nodeA, dict())
    adjSet[nodeA][nodeB] = weightAB

    # add reverse connection
    adjSet.setdefault(nodeB, dict())
    adjSet[nodeB][nodeA] = weightAB



print adjSet



# calculate shortest route and print result


