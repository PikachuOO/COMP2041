// nextSmallest.c
// find next smallest item in a BST
//
// Callum Howard, 2014

#include <stdio.h>
#include <stdlib.h>

typedef int item;

int BSTreeNS (TreeLink root, item target);


int main (int argc, char *argv[]) {
    BSTreeNS();

    return EXIT_SUCCESS;
}

int BSTreeNS (TreeLink root, item target) {
    // base case for leaf nodes
    if (root->left == NULL || root->right == NULL) {
        return root->value;
    }

    // check if target is found
    if ( BSTreeNS(root->left ) == target ||
         BSTreeNS(root->right) == target ) {
        printf("Next smallest is: %d", root->value);
    }

    // continue prefix traversal
    return root->value;
}
