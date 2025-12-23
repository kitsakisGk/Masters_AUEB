package org.apache.giraph.examples;

import org.apache.giraph.conf.GiraphConfiguration;
import org.apache.giraph.io.formats.IdWithValueTextOutputFormat;
import org.apache.giraph.io.formats.JsonLongDoubleFloatDoubleVertexInputFormat;
import org.apache.giraph.utils.InternalVertexRunner;
import org.apache.hadoop.io.DoubleWritable;
import org.apache.hadoop.io.LongWritable;

/**
 * Runner for local execution of Giraph jobs
 *
 * This allows you to test Giraph algorithms locally without Hadoop
 * Change the computation class and input graph to test different algorithms
 */
public class GiraphAppRunner {

  /**
   * Main method to run Giraph job locally
   */
  public static void main(String[] args) throws Exception {

    // Choose which example to run:
    // 1 = SimpleShortestPathsComputation
    // 2 = SimpleLabelPropagationComputation
    int example = 2;  // CHANGE THIS TO 2 FOR LABEL PROPAGATION

    if (example == 1) {
      runShortestPaths();
    } else if (example == 2) {
      runLabelPropagation();
    } else {
      System.out.println("Invalid example number. Choose 1 or 2.");
    }
  }

  /**
   * Run SimpleShortestPathsComputation (Example from Problem 1)
   */
  private static void runShortestPaths() throws Exception {
    System.out.println("Running SimpleShortestPathsComputation...");

    // Input graph (tiny_graph.txt format)
    String[] graph = new String[] {
      "[0,0,[[1,1],[3,3]]]",
      "[1,0,[[0,1],[2,2],[3,1]]]",
      "[2,0,[[1,2],[4,4]]]",
      "[3,0,[[0,3],[1,1],[4,4]]]",
      "[4,0,[[3,4],[2,4]]]"
    };

    GiraphConfiguration conf = new GiraphConfiguration();
    conf.setComputationClass(SimpleShortestPathsComputation.class);
    conf.setVertexInputFormatClass(JsonLongDoubleFloatDoubleVertexInputFormat.class);
    conf.setVertexOutputFormatClass(IdWithValueTextOutputFormat.class);

    Iterable<String> results = InternalVertexRunner.run(conf, graph);

    System.out.println("\n=== RESULTS: Shortest Paths ===");
    for (String result : results) {
      System.out.println(result);
    }
  }

  /**
   * Run SimpleLabelPropagationComputation (Problem 2)
   */
  private static void runLabelPropagation() throws Exception {
    System.out.println("Running SimpleLabelPropagationComputation...");

    // Input graph for Label Propagation
    // Format: [vertex_id, initial_value, [[neighbor1, edge_weight], [neighbor2, edge_weight], ...]]
    // For label propagation, edge weights don't matter (use 1.0)

    // Small test graph with clear communities:
    // Community 1: nodes 0, 1, 2 (fully connected)
    // Community 2: nodes 3, 4, 5 (fully connected)
    // Bridge: edge between 2 and 3
    String[] graph = new String[] {
      // Community 1
      "[0,0,[[1,1],[2,1]]]",
      "[1,0,[[0,1],[2,1]]]",
      "[2,0,[[0,1],[1,1],[3,1]]]",  // Bridge to community 2

      // Community 2
      "[3,0,[[2,1],[4,1],[5,1]]]",  // Bridge from community 1
      "[4,0,[[3,1],[5,1]]]",
      "[5,0,[[3,1],[4,1]]]"
    };

    GiraphConfiguration conf = new GiraphConfiguration();
    conf.setComputationClass(SimpleLabelPropagationComputation.class);
    conf.setVertexInputFormatClass(JsonLongDoubleFloatDoubleVertexInputFormat.class);
    conf.setVertexOutputFormatClass(IdWithValueTextOutputFormat.class);

    Iterable<String> results = InternalVertexRunner.run(conf, graph);

    System.out.println("\n=== RESULTS: Community Detection (Label Propagation) ===");
    System.out.println("Format: [vertex_id] [community_label]");
    System.out.println("Vertices with same community_label belong to same community\n");

    for (String result : results) {
      System.out.println(result);
    }

    System.out.println("\n=== Expected Result ===");
    System.out.println("Nodes 0, 1, 2 should have the same community label (likely 0)");
    System.out.println("Nodes 3, 4, 5 might have the same community label");
    System.out.println("OR node 2 and 3 might form a bridge community");
  }

  /**
   * Alternative larger graph for testing
   * Uncomment this graph in runLabelPropagation() to test with more nodes
   */
  @SuppressWarnings("unused")
  private static String[] getLargerGraph() {
    return new String[] {
      // Community 1: Star graph (0 is center)
      "[0,0,[[1,1],[2,1],[3,1],[4,1]]]",
      "[1,0,[[0,1]]]",
      "[2,0,[[0,1]]]",
      "[3,0,[[0,1]]]",
      "[4,0,[[0,1]]]",

      // Community 2: Ring (5,6,7,8)
      "[5,0,[[6,1],[8,1]]]",
      "[6,0,[[5,1],[7,1]]]",
      "[7,0,[[6,1],[8,1]]]",
      "[8,0,[[7,1],[5,1]]]",

      // Bridge between communities
      "[9,0,[[4,1],[5,1]]]"
    };
  }
}
