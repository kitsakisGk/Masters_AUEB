package org.apache.giraph.examples;

import org.apache.giraph.graph.BasicComputation;
import org.apache.giraph.edge.Edge;
import org.apache.giraph.graph.Vertex;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.DoubleWritable;
import org.apache.log4j.Logger;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * Label Propagation Algorithm for Community Detection
 *
 * Algorithm:
 * 1. Each vertex starts with its own community (vertex ID = community ID)
 * 2. Each vertex sends its community label to all neighbors
 * 3. Each vertex adopts the majority community from neighbors
 * 4. If tie → adopt smallest value
 * 5. If only 1 neighbor → adopt if smaller than current
 * 6. If vertex changes → propagate to neighbors
 * 7. Stop when no changes OR max iterations reached
 */
public class SimpleLabelPropagationComputation extends
    BasicComputation<LongWritable, LongWritable, DoubleWritable, LongWritable> {

  /** Class logger */
  private static final Logger LOG = Logger.getLogger(SimpleLabelPropagationComputation.class);

  /** Maximum number of iterations */
  private static final int MAX_ITERATIONS = 50;

  @Override
  public void compute(
      Vertex<LongWritable, LongWritable, DoubleWritable> vertex,
      Iterable<LongWritable> messages) throws IOException {

    long superstep = getSuperstep();

    // Superstep 0: Initialize - each vertex is its own community
    if (superstep == 0) {
      // Set vertex value to its own ID (initial community)
      vertex.setValue(new LongWritable(vertex.getId().get()));

      // Send initial community label to all neighbors
      sendMessageToAllEdges(vertex, vertex.getValue());

      LOG.info("Vertex " + vertex.getId() + " initialized with community " + vertex.getValue());
    }
    // Supersteps 1 to MAX_ITERATIONS: Update communities based on neighbors
    else if (superstep <= MAX_ITERATIONS) {

      // Count frequency of each community label from neighbors
      Map<Long, Integer> labelCount = new HashMap<>();

      for (LongWritable message : messages) {
        long label = message.get();
        labelCount.put(label, labelCount.getOrDefault(label, 0) + 1);
      }

      // If no messages received (isolated vertex), vote to halt
      if (labelCount.isEmpty()) {
        vertex.voteToHalt();
        return;
      }

      // Find the majority label (or smallest in case of tie)
      long newLabel = findMajorityLabel(labelCount, vertex.getValue().get());

      // Check if community changed
      if (newLabel != vertex.getValue().get()) {
        // Update vertex value to new community
        vertex.setValue(new LongWritable(newLabel));

        // Propagate new community to neighbors
        sendMessageToAllEdges(vertex, vertex.getValue());

        LOG.info("Vertex " + vertex.getId() + " changed community to " + newLabel +
                 " at superstep " + superstep);
      } else {
        // No change, vote to halt
        vertex.voteToHalt();
      }
    }
    // After MAX_ITERATIONS, halt
    else {
      vertex.voteToHalt();
    }
  }

  /**
   * Find the majority label from neighbors.
   * Rules:
   * - If there's a clear majority, return it
   * - If there's a tie, return the smallest value
   * - If only one neighbor, adopt its value if smaller than current
   *
   * @param labelCount Map of label frequencies
   * @param currentLabel Current vertex label
   * @return The new label to adopt
   */
  private long findMajorityLabel(Map<Long, Integer> labelCount, long currentLabel) {

    // Special case: only one neighbor
    if (labelCount.size() == 1) {
      long neighborLabel = labelCount.keySet().iterator().next();
      // Adopt only if smaller than current
      return (neighborLabel < currentLabel) ? neighborLabel : currentLabel;
    }

    // Find maximum frequency
    int maxCount = 0;
    for (int count : labelCount.values()) {
      if (count > maxCount) {
        maxCount = count;
      }
    }

    // Find all labels with maximum frequency
    long bestLabel = Long.MAX_VALUE;
    for (Map.Entry<Long, Integer> entry : labelCount.entrySet()) {
      if (entry.getValue() == maxCount) {
        // In case of tie, pick smallest label
        if (entry.getKey() < bestLabel) {
          bestLabel = entry.getKey();
        }
      }
    }

    return bestLabel;
  }
}
