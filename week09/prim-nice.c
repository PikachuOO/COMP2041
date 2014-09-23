MSTree primFindMST(Graph g) {

    // MST initially empty
    ESet mst = newESet(); 

    // edges at "fringe"
    ESet fringe = newESet(); 

    // start vertex
    VSet vset = newVset; 
    vset = VSetInclude(vset,0);
    Vertex curr, s, t;  
    Edge e;  
    float w;  
    int i;

    // fringe = edgesAt(0);
    for (i = 0; i < g->nV; i++) {
        w = g->edges[0][i];
        if (w > 0.0) {
            fringe = ESetInclude( fringe,mkEdge(0,i,w) );
        }
    }

    while (VSetCard(vset) < g->nV) {
        int n;  
        float min = 0;
        Edge *es = ESetAll(fringe,&n);

        if (n == 0) break;

        // find e in fringe with minimum cost
        for (i = 1; i < n; i++) {
            if (es[i].w < es[min].w) {
                min = i;
            }
        }

        e = es[min];  free(es);
        fringe = ESetExclude(fringe, e)

            // (s,curr,w) = e
            s = e.s; curr = e.t; w = e.w;
        vSet = VSetInclude(vset, curr)
            mst = ESetInclude(mst, e)

            // foreach (e in edgesAt(curr)) {
            for (i = 0; i < g->nV; i++) {
                e = g->edges[curr][i];

                if (e.w == 0.0) continue;  // danger

                // (s,t,w) = e  // s == curr
                t = e.t; w = e.w;

                if ( !VSetMember(vset,t) ) {
                    fringe = ESetInclude(fringe,e);
                }
            }
    }
    }

    // If MSTree were defined as ESet, then the
    // conversion to a Graph would be as follows ...

    // Convert ESet "mste" into a Graph
    MSTree mste = primFindMST(g);
    Graph mstg = newGraph(g->nV);
    Edge *es = ESetAll(mste, &n);

    for (i = 0; i < n; i++) {
        GraphInsertEdge(mstg, es[i]);
    }

    free(es);
    // "mstg" is now a graph with all edges from "mste"
