# STA650Lab
Lab materials of STA650/450 Social Network will be posted here.

Website based on the lab materials is available at : https://yunranchen.github.io/intro-network-R/

Lab session: Thursday 4:40 - 5:55 pm, Gray 228.

Office hour: Wednesday 12:00 - 1:00 pm, Old Chem 025.

Homework submission: via slack.

Contact me: via slack.


## Outline

- Basic introduction on network objects. R packages including `igraph`, `statnet`(including `sna`, `network`).

- Collect network data. 
  - Web API requesting (Twitter, Reddit, IMDB, or more).
  - Useful websites (SNAP, or more)
  
  
- Visualization (static and dynamic networks).


- Network analysis using package `amen`.


If you are not familiar with R, see http://www2.stat.duke.edu/~cr173/Sta523_Fa16/ 


## Detailed outline

- Lab 1: `igraph` basics
  - Create simple networks, Specific graphs, Graph models
  - Adjustments on graphs, rewiring graphs
  - Edge, vertex and network attributes
  - Network and node descriptions
  - References: 
    - Tutorial: http://kateto.net/networks-r-igraph
    - Handbook: http://igraph.org/r/
    - Book: https://sites.fas.harvard.edu/~airoldi/pub/books/BookDraft-CsardiNepuszAiroldi2016.pdf  
- Lab 2: `igraph` basics
  - Get network from files (edgelist, matrix, dataframe)
  - Visualization
    - Plotting parameters
    - Layouts
  - Network and node descriptions
  - References: 
    - Tutorial: http://kateto.net/networks-r-igraph
    - Handbook: http://igraph.org/r/
    - Book: https://sites.fas.harvard.edu/~airoldi/pub/books/BookDraft-CsardiNepuszAiroldi2016.pdf
    - Datasets: https://github.com/mathbeveridge/asoiaf
                https://networkofthrones.wordpress.com/data/
                https://www.macalester.edu/~abeverid/thrones.html
- Lab 3: `igraph` basics
   - Paths
      - Paths, distances and diameter
      - Components
      - Transitivity and reciprocity
      - Max-flow and min-cut
   - Communities
      - Pre-defined clusters
      - Different algorithms
   - Visualization
      - Color the paths
      - Plotting clusters
      - Plotting dendrograms
      - Mark groups
  - References: 
    - Tutorial: http://kateto.net/networks-r-igraph
    - Handbook: http://igraph.org/r/
    - Book: https://sites.fas.harvard.edu/~airoldi/pub/books/BookDraft-CsardiNepuszAiroldi2016.pdf
- Lab 4: Algorithm
  - Blitzstein and Diaconis sampling algorithm
    - Reference: https://projecteuclid.org/download/pdf_1/euclid.im/1318514519
  - Using Git in Rstudio
- Lab 5: ERGM (`statnet`)
  - `summary` network statistics
  - `ergm` model fitting and interpretation:
  - `simulate` network simulations based on specified model.
  - `gof`, `mcmc.diagnostics`: Goodness of fit and MCMC diagnostics
  - References:
    - Tutorial: https://statnet.org/trac/raw-attachment/wiki/Sunbelt2016/ergm_tutorial.html
    - Handbook: http://statnet.org/
- Lab 6: Collect network data and API requests
  - Several useful websites: 
    - Awesome website for papers, reviews, datasets and softwares: https://github.com/briatte/awesome-network-analysis
    - Katherine’s webpage: http://kateto.net/2016/05/network-datasets/
    - Data analysis competition: https://www.kaggle.com/datasets https://data.world/search?q=network+dataset
  - twitter API request: `rtweet`
    - Official website: https://rtweet.info/index.html
    - API authorization; `create_token`
    - `search_tweets`
    - `stream_tweets`
    - Other functions see official website
    - Examples: retweet networks, friendship networks
- Lab 7: API requests
  - Build Twitter friendship networks
  - Other available R packages for API request: `rtweet`,`Rfacebook`,`RedditExtractoR`,`imdbapi`,`omdbapi`
  - Direct API request from R. `rjson`, `jsonlite`
- No lab on March 7th (Spring Break).
- Lab 8: Epidemiological modeling of news spreading on Twitter (course project)
  - References:
    - https://github.com/YunranChen/HiggsBoson 
- Lab 9: Visualization 
  - Visualization for static network: 
    - Graph: hairball plot
    - Matrix: `heatmap` in R basic package; `geom_tile` in pkg `ggplot2`
  - Other static networks:
    - Two-mode networks (node-specific attribute)
    - Multiple networks (edge-specific attribute)
    - ... ( `ggtree`, `ggalluvial`, etc.)
  - `ggplot2` version for network visualization: 
    - Comparison between `ggnet2`,`geomnet`,`ggnetwork`
    - Extension to interactive (`plotly`) , dynamic network (`ggnetwork`)
  - Other interactive network visualizations: 
    -  `visNetwork` (good documentation)
    -  `networkD3`
    -  `threejs`
    -  `ggigraph`
  - Visualization for dynamic networks
    - Snapshots for the evolving networks: `ggnetwork` (common)
    - Animation for the evolving networks: `ggplot2` + `gganimate`
    - `ndtv` pkg (good documentation)
  - References:
    - http://kateto.net/netscix2016
    - http://kateto.net/network-visualization
    - http://curleylab.psych.columbia.edu/netviz/
    - https://journal.r-project.org/archive/2017/RJ-2017-023/RJ-2017-023.pdf

- Lab 10: `AMEN` packages (March 28th)
  - Gaussian AME model: `ame`
  - Different relation: `ame(...,model=,...)`
    - ordinal data
    - censored and fixed rank nomination data
    - sampled or missing data
  - symmetric relation: `ame(...,symmetric=TRUE,...)`
  - repeated measures data: longitudal data `ame_rep(Y,Xdyad,Xrow,Xcol)`
  - Tutorial: https://github.com/pdhoff/amen/blob/master/inst/doc/amen.pdf 
    
- No lab session after March 28th.
