#!/usr/bin/env python

# Program to find shortest path using Dijkstra's Algorithm
# Callum Howard 2014 - COMP2041

import sys, fileinput

# returns list with shortest path using Dijkstra
def findDijkstraPath (Graph, source, destination):
            
    # declare
    visited = dict()  # boolean value for each node
    distance = dict() # minimum sum distance from source to node
    parent = dict()   # parent from minimum path back to source
    queue = []        # priority queue implemented with heap on list

    # initialise
    for node in Graph.keys():
        visited[node] = False
        distance[node] = float("inf")

    distance[source] = 0
    heappush(queue, (0, source))

    # main loop
    while queue:
        current = heappop(queue)[1]
        visited[current] = True

        for connected in Graph[current].keys():
            if not visited[connected]:
                totalDist = distance[current] + Graph[current][connected]
                heappush(queue, (totalDist, connected))

                # if a shorter distance is found
                if totalDist < distance[connected]:
                    # replace it as the new shortest distance
                    distance[connected] = totalDist
                    parent[connected] = current

    # trace parent from source to find path
    trace = destination
    while trace != source:
        # push on to path list
        path.insert(0, trace)
        trace = parent[trace]

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


