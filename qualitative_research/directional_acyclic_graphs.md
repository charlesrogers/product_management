# Directional Acyclic Graphs
The general idea is to basically diagram all the forces that affect why something is the way it is.
Typically that is done by identifying the forces, and then the forces affecting those sub-forces until it is no longer that relevant.
There are some tricky elements about removing extraneous information:

## How to Create a DAG
- 


## Additional Resources:
+ https://journals.sagepub.com/doi/pdf/10.1177/2515245917745629
+ https://en.wikipedia.org/wiki/Directed_acyclic_graph
+ https://cran.r-project.org/web/packages/ggdag/vignettes/intro-to-dags.html


```mermaid
graph TD;
    A-->B;
    A-->C;
    B-->D;
    C-->D;
```
