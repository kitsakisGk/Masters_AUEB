import snap
import time
import matplotlib.pyplot as plt


def analyze_graph(n_nodes, k_neighbors=10):
    print(f"\nGraph: {n_nodes} nodes, k={k_neighbors}")

    G = snap.GenSmallWorld(n_nodes, k_neighbors, 0.3)
    print(f"  Generated: {G.GetEdges()} edges")

    max_deg = 0
    max_node = 0
    for NI in G.Nodes():
        if NI.GetDeg() > max_deg:
            max_deg = NI.GetDeg()
            max_node = NI.GetId()
    print(f"  Highest degree: Node {max_node}, Degree {max_deg}")

    PRankH = snap.TIntFltH()
    snap.GetPageRank(G, PRankH)
    HubH = snap.TIntFltH()
    AuthH = snap.TIntFltH()
    snap.GetHits(G, HubH, AuthH)

    max_hub = 0
    max_hub_node = 0
    for item in HubH:
        if HubH[item] > max_hub:
            max_hub = HubH[item]
            max_hub_node = item

    max_auth = 0
    max_auth_node = 0
    for item in AuthH:
        if AuthH[item] > max_auth:
            max_auth = AuthH[item]
            max_auth_node = item

    print(f"  Highest hub: Node {max_hub_node}, Score {max_hub:.6f}")
    print(f"  Highest authority: Node {max_auth_node}, Score {max_auth:.6f}")

    print("  Running Clauset-Newman-Moore...", end=" ")
    start = time.time()
    try:
        CmtyV = snap.TCnComV()
        modularity = snap.CommunityCNM(G, CmtyV)
        cnm_time = time.time() - start
        print(f"{cnm_time:.2f}s ({len(CmtyV)} communities)")
    except:
        cnm_time = time.time() - start
        print(f"{cnm_time:.2f}s (error)")

    print("  Running Girvan-Newman...", end=" ")
    start = time.time()
    try:
        CmtyV2 = snap.TCnComV()
        modularity = snap.CommunityGirvanNewman(G, CmtyV2)
        gn_time = time.time() - start
        print(f"{gn_time:.2f}s ({len(CmtyV2)} communities)")
    except:
        gn_time = time.time() - start
        print(f"{gn_time:.2f}s (error)")

    return {'n': n_nodes, 'gn': gn_time, 'cnm': cnm_time, 'graph': G, 'pr': PRankH, 'hub': HubH, 'auth': AuthH}


def analyze_pagerank(result, top_n=30):
    print(f"\nTop {top_n} PageRank nodes analysis")

    G = result['graph']
    PRankH = result['pr']
    HubH = result['hub']
    AuthH = result['auth']

    pr_list = [(node, PRankH[node]) for node in PRankH]
    pr_list.sort(key=lambda x: x[1], reverse=True)
    top_nodes = pr_list[:top_n]
    node_ids = [n for n, _ in top_nodes]

    BtwH = snap.TIntFltH()
    EdgeBtwH = snap.TIntPrFltH()
    snap.GetBetweennessCentr(G, BtwH, EdgeBtwH, 1.0)

    # For closeness, we calculate it manually for each node
    ClsH = snap.TIntFltH()
    for node in node_ids:
        NIdToDistH = snap.TIntH()
        snap.GetShortPath(G, node, NIdToDistH)
        if len(NIdToDistH) > 1:
            total_dist = sum(NIdToDistH[n] for n in NIdToDistH if n != node)
            closeness = (len(NIdToDistH) - 1) / total_dist if total_dist > 0 else 0
            ClsH[node] = closeness
        else:
            ClsH[node] = 0

    data = {
        'pr': [PRankH[n] for n in node_ids],
        'btw': [BtwH[n] if n in BtwH else 0 for n in node_ids],
        'cls': [ClsH[n] if n in ClsH else 0 for n in node_ids],
        'hub': [HubH[n] for n in node_ids],
        'auth': [AuthH[n] for n in node_ids]
    }

    x = range(top_n)
    fig, (ax1, ax2) = plt.subplots(2, 1, figsize=(12, 8))

    ax1.plot(x, data['btw'], 'o-', label='Betweenness', linewidth=2)
    ax1.plot(x, data['cls'], 's-', label='Closeness', linewidth=2)
    ax1.plot(x, data['pr'], '^-', label='PageRank', linewidth=2)
    ax1.set_xlabel('Node Rank (by PageRank)')
    ax1.set_ylabel('Score')
    ax1.set_title(f'Betweenness, Closeness, PageRank (n={G.GetNodes()})')
    ax1.legend()
    ax1.grid(True, alpha=0.3)

    ax2.plot(x, data['pr'], '^-', label='PageRank', linewidth=2)
    ax2.plot(x, data['auth'], 'd-', label='Authority', linewidth=2)
    ax2.plot(x, data['hub'], 'p-', label='Hub', linewidth=2)
    ax2.set_xlabel('Node Rank (by PageRank)')
    ax2.set_ylabel('Score')
    ax2.set_title(f'PageRank, Authority, Hub (n={G.GetNodes()})')
    ax2.legend()
    ax2.grid(True, alpha=0.3)

    plt.tight_layout()
    filename = f'centrality_{G.GetNodes()}.png'
    plt.savefig(filename, dpi=300)
    print(f"  Saved: {filename}")
    plt.close()


def main():
    print("PROJECT 2-2: CENTRALITY & COMMUNITY DETECTION\n")

    sizes = [50, 100, 500, 1000, 2000]
    results = []

    for n in sizes:
        result = analyze_graph(n)
        results.append(result)
        if result['gn'] > 600 or result['cnm'] > 600:
            print(f"  Stopped (>10 min limit)")
            break

    print("\n" + "-" * 50)
    print(f"{'Nodes':<10} {'GN Time':<15} {'CNM Time'}")
    print("-" * 50)
    for r in results:
        print(f"{r['n']:<10} {r['gn']:<15.2f} {r['cnm']:.2f}")

    print("\nRecommendations:")
    print("  50 employees: Both algorithms work, CNM is faster")
    print("  18,000 employees: Clauset-Newman-Moore only")
    print("  1 billion users: Clauset-Newman-Moore only")

    if results:
        analyze_pagerank(results[-1])

    print("\nDONE")


if __name__ == "__main__":
    main()
