import snap


def has_euler_path(G):
    if G.GetNodes() == 0:
        return False
    if not snap.IsConnected(G):
        return False

    odd_degree_count = 0
    for NI in G.Nodes():
        if NI.GetDeg() % 2 == 1:
            odd_degree_count += 1

    return odd_degree_count == 2


def has_euler_circuit(G):
    if G.GetNodes() == 0:
        return False
    if not snap.IsConnected(G):
        return False

    for NI in G.Nodes():
        if NI.GetDeg() % 2 == 1:
            return False

    return True


def test_euler_path_only():
    print("\nTest 1: Graph with Euler path (but not Euler circuit)")
    G = snap.TUNGraph.New()
    for i in range(4):
        G.AddNode(i)
    G.AddEdge(0, 1)
    G.AddEdge(1, 2)
    G.AddEdge(2, 3)

    print(f"  Nodes: {G.GetNodes()}, Edges: {G.GetEdges()}")
    print(f"  Has Euler path: {has_euler_path(G)}, Has Euler circuit: {has_euler_circuit(G)}")

    assert has_euler_path(G) == True
    assert has_euler_circuit(G) == False
    print("  PASS")
    return G


def test_no_euler_path():
    print("\nTest 2: Graph without Euler path")
    G = snap.GenFull(snap.PUNGraph, 4)

    print(f"  Nodes: {G.GetNodes()}, Edges: {G.GetEdges()}")
    print(f"  Has Euler path: {has_euler_path(G)}, Has Euler circuit: {has_euler_circuit(G)}")

    assert has_euler_path(G) == False
    print("  PASS")
    return G


def test_euler_circuit():
    print("\nTest 3: Graph with Euler circuit")
    G = snap.TUNGraph.New()
    for i in range(4):
        G.AddNode(i)
    G.AddEdge(0, 1)
    G.AddEdge(1, 2)
    G.AddEdge(2, 3)
    G.AddEdge(3, 0)

    print(f"  Nodes: {G.GetNodes()}, Edges: {G.GetEdges()}")
    print(f"  Has Euler path: {has_euler_path(G)}, Has Euler circuit: {has_euler_circuit(G)}")

    assert has_euler_circuit(G) == True
    print("  PASS")
    return G


def test_no_euler_circuit():
    print("\nTest 4: Graph without Euler circuit")
    G = snap.TUNGraph.New()
    for i in range(6):
        G.AddNode(i)
    G.AddEdge(0, 1)
    G.AddEdge(1, 2)
    G.AddEdge(2, 0)
    G.AddEdge(3, 4)
    G.AddEdge(4, 5)
    G.AddEdge(5, 3)

    print(f"  Nodes: {G.GetNodes()}, Edges: {G.GetEdges()}")
    print(f"  Is connected: {snap.IsConnected(G)}")
    print(f"  Has Euler path: {has_euler_path(G)}, Has Euler circuit: {has_euler_circuit(G)}")

    assert has_euler_circuit(G) == False
    print("  PASS")
    return G


if __name__ == "__main__":
    print("EULER PATHS AND CIRCUITS - TEST SUITE")
    test_euler_path_only()
    test_no_euler_path()
    test_euler_circuit()
    test_no_euler_circuit()
    print("\nALL TESTS PASSED")
