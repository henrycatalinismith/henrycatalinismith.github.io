---
title: Planarity
image: /2010/05/11/planarity@512x412.webp
tags: [blog, gamedev]
layout: layout-post
---

<figure>
 <img
  src="/2010/05/11/planarity@512x412.webp"
  alt="Desktop app screenshot showing a green dot and four red dots and a bunch of black lines connecting them all."
 >
</figure>

My dissertation project at university was to implement this 2D Java puzzle game
called [Planarity](https://en.wikipedia.org/wiki/Planarity) where you win by
dragging the dots around until none of the lines connecting them cross. Here's
100 lines of university student Java for your enjoyment.

```java
package planarity.graphGeneration;
import java.awt.geom.Line2D;
import java.awt.geom.Point2D;
import java.util.Random;
import java.util.Vector;
import planarity.graph.*;

/**
* This class implements the Edge Addition Graph Generation algorithm
* described in the Design section
*
* @author Henry
*/
public class EdgeAdditionGraphGenerator implements GraphGenerator {
  private Graph graph;
  private Vertex[] V;
  private Vector Vprime;
  private Edge[] E;

  public Graph generateGraph(int n) {
    graph = new Graph();
    V = new Vertex[n];
    Vprime = new Vector();
    //System.out.println("start");
    for (int i = 0; i < n; i++) {
      V[i] = new Vertex(graph, 10, 10);
      graph.addVertex(V[i]);
    }
    graph.arrangeAsCircle();
    //System.out.println("here");
    connectTwoRandomVertices();
    for (int x = 0; graph.countEdges() < ((3 * n) – 6) && x < 1000; x++) {
      Vertex p = getRandomVprimeVertex();
      for (int i = 0; i < V.length; i++) {
        Vertex q = V[i];
        if (p.equals(q)) {
          continue;
        }
        if (p.isAdjacentTo(q)) {
          continue;
        }
        graph.addEdge(p, q);
        if (graph.countEdgeIntersections() > 0) {
          graph.removeEdge(p, q);
        } else {
          if (!Vprime.contains(i)) {
            Vprime.add(i);
          }
        }
        break;
      }
    }
    Vertex[] v = graph.getVertices();
    for (int i = 0; i < v.length; i++) {
      if (v[i].getAdjacentEdges().length == 0) {
        graph.removeVertex(v[i]);
      }
    }
    return graph;
  }

  private void connectTwoRandomVertices() {
    Random r = new Random();
    int a, b;
    a = r.nextInt(V.length);
    do {
      // System.out.println("323");
      b = r.nextInt(V.length);
    } while (a == b);
    graph.addEdge(V[a], V[b]);
    Vprime.add(a);
    Vprime.add(b);
  }

  private Vertex getRandomVprimeVertex() {
    Random r = new Random();
    int num = Integer.parseInt(Vprime.elementAt(r.nextInt(Vprime.size())).toString());
    return V[num];
  }

  private boolean canConnect(Vertex p, Vertex q) {
    Edge[] edges = graph.getEdges();
    Line2D pq = new Line2D.Double();
    pq.setLine(p.getCenterX(), p.getCenterY(), q.getCenterX(),
    q.getCenterY());
    for (int i = 0; i < edges.length; i++) {
      Line2D e = (Line2D) edges[i];
      if (!pq.intersectsLine(e)) {
        continue;
      }
      Point2D p1, p2, p3, p4;
      p1 = pq.getP1();
      p2 = pq.getP2();
      p3 = pq.getP1();
      p4 = pq.getP2();
      if (p1.distance(p3) == 0) continue;
      if (p1.distance(p4) == 0) continue;
      if (p2.distance(p3) == 0) continue;
      if (p2.distance(p4) == 0) continue;
      return false;
    }
    return true;
  }
}
```
