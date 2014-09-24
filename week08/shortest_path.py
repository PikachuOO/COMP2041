#!/usr/bin/env python

# Program to find shortest path using Dijkstra's Algorithm
# Callum Howard 2014 - COMP2041

import sys, fileinput

# returns list with shortest path using Dijkstra
def findDijkstraPath (graph, source, destination):
    #TODO placeholder function needs implementing
    return path


# read in source and destination from arguments
source = sys.argv[1]
destination = sys.argv[2]

# read in edge weights from standard input and populate data structure
adjList = dict()
for line in sys.stdin:
    words = line.split()

    #--- note no sanity check for standard input
    nodeA = words[0]
    nodeB = words[1]
    weightAB = words[2]

    # Data Structure: Adjacency List using a Dict of Dicts

    # add connection to node
    adjList.setdefault(nodeA, dict())
    adjList[nodeA][nodeB] = weightAB

    # add reverse connection
    adjList.setdefault(nodeB, dict())
    adjList[nodeB][nodeA] = weightAB

print adjList

# calculate shortest route and print result
print findDijkstra(adjList)


