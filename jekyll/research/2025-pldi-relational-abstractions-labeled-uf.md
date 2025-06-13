---
layout: paper-summary
title:  "PLDI 2025"
date: 2025-06-15
nav_order: 2025-06-15
lang: en
---

## Context

In program analysis, various abstractions are used to store known facts about the
program being studied. Two popular choices are *non-relational abstractions*,
which store numeric information on variables (like intervals $$x \in [0:5]$$), or *relational
abstraction*, which store relations between variables (like $$3x + 2y \leqslant -5z$$).
The former is fast (complexity in $$\mathcal O(|\mathbb X|)$$ where $$|\mathbb X|$$ is the number of variables)
but imprecise, whereas the latter is very precise but cost-prohibitive
(polyhedra has $$\mathcal O(2^{|\mathbb X|})$$ complexity).

In the middle of this spectrum lie *weakly-relational abstractions*. They only
store relations between pairs of variables. For example, octagons
store relations $$\pm x \pm y \leqslant c$$ for some constant $$c$$. These abstractions are faster than
polyhedra, but still expensive, in large part due to having to compute
a transitive closure to find all known relations, which costs $$\mathcal O(|\mathbb X|^3)$$.

Our goal is to find **a new family of relational abstract domains that are cheaper than the weakly-relational domains**.
For this, a central question is **can we compute the expensive transitive closure much more cheaply?** The answer is yes, if we assume that the relation obtained on each path between
two variables is always the same. This allows eliminating the vast majority of relations, **we only need to
store a spanning tree** and can still recover any arbitrary relation in amortized almost-constant time, using a variation
of the efficient [union-find](https://en.wikipedia.org/wiki/Disjoint-set_data_structure) data structure, that we call the **labeled union-find**.

## The labeled union-find data structure

<figure>
<img class="transparent"
  src="{{ 'imgs/publications/2025-pldi-labeled-uf-simple.svg' | relative_url }}"
  alt="Labeled union-find example"
  style="width:500px;" />
<figcaption>
Fig. Example of a labeled union-find data structure composed a single
tree rooted at <code>r</code>. This also shows an example of path compression:
shortening the path from <code>z</code> to the root.
</figcaption>
</figure>

Similarly to the classical union-find, the labeled union-find
is a rooted forest, i.e. a set of trees where each node points to its parent.
The extension adds labels $$\mathbb L$$ to the parent edges,
representing relations. In the figure above, these relations are
affine constraints between two variables (of the form $$y = a*x + b$$).
From this labeled union-find, it is easy to infer the relation
between any two variables (if there is one, i.e. when they are in the same tree) by composing or reversing
relations. For instance, from $$z = y - 1$$ and $$y = 2 * r$$, we can
deduce that $$z = 2*r - 1$$. While computing this, we can shrink the
distance between the element $$z$$ and the root of the tree $$r$$, doing the
analog of path compression in the union-find structure.

Computing the relation between some variables may also require
inverting relations; for instance, the relation between $$y$$ and $$x$$ is
the composition of $$y = 2*r$$ and the inverse of $$x = 3*r+2$$,
i.e. $$\displaystyle r = \frac x 3 - \frac 2 3$$, yielding $$\displaystyle y = \frac 2 3 x - \frac 4 3$$. In general, the
labels thus have an associative composition operation, and an inverse
operation. Formally, labels must have a [**group
structure**](https://en.wikipedia.org/wiki/Group_(mathematics)).  This
requirement also derives fairly naturally from our previous assumption
(same relation on each path).

{%- comment %}
$$
\begin{array}{lcl}
  \begin{array}{rcl}
    \mathbb N & : & \text{nodes} \\
    \mathbb L & : & \text{labels}
  \end{array}
  & \quad &
    \begin{array}{rcl}
    \mathtt{find} & : & \mathbb N \to \mathbb N \times \mathbb L \\
    \mathtt{add\_relation} & : & \mathbb N \to \mathbb N \to \mathbb L \to \mathtt{unit} \\
    \mathtt{get\_relation} & : & \mathbb N \to \mathbb N \to \text{Option}\langle\mathbb L\rangle
  \end{array}
\end{array}
$$
{%- endcomment %}

<figure>
<span class="katex-display"><span class="katex"><span class="katex-mathml"><math xmlns="http://www.w3.org/1998/Math/MathML" display="block"><semantics><mtable rowspacing="0.16em" columnalign="left center left" columnspacing="1em"><mtr><mtd><mstyle scriptlevel="0" displaystyle="false"><mtable rowspacing="0.16em" columnalign="right center left" columnspacing="1em"><mtr><mtd><mstyle scriptlevel="0" displaystyle="false"><mi mathvariant="double-struck">N</mi></mstyle></mtd><mtd><mstyle scriptlevel="0" displaystyle="false"><mo lspace="0em" rspace="0em">:</mo></mstyle></mtd><mtd><mstyle scriptlevel="0" displaystyle="false"><mtext>nodes</mtext></mstyle></mtd></mtr><mtr><mtd><mstyle scriptlevel="0" displaystyle="false"><mi mathvariant="double-struck">L</mi></mstyle></mtd><mtd><mstyle scriptlevel="0" displaystyle="false"><mo lspace="0em" rspace="0em">:</mo></mstyle></mtd><mtd><mstyle scriptlevel="0" displaystyle="false"><mtext>labels</mtext></mstyle></mtd></mtr></mtable></mstyle></mtd><mtd><mstyle scriptlevel="0" displaystyle="false"><mspace width="1em"/></mstyle></mtd><mtd><mstyle scriptlevel="0" displaystyle="false"><mtable rowspacing="0.16em" columnalign="right center left" columnspacing="1em"><mtr><mtd><mstyle scriptlevel="0" displaystyle="false"><mrow><mi mathvariant="monospace">f</mi><mi mathvariant="monospace">i</mi><mi mathvariant="monospace">n</mi><mi mathvariant="monospace">d</mi></mrow></mstyle></mtd><mtd><mstyle scriptlevel="0" displaystyle="false"><mo lspace="0em" rspace="0em">:</mo></mstyle></mtd><mtd><mstyle scriptlevel="0" displaystyle="false"><mrow><mi mathvariant="double-struck">N</mi><mo>→</mo><mi mathvariant="double-struck">N</mi><mo>×</mo><mi mathvariant="double-struck">L</mi></mrow></mstyle></mtd></mtr><mtr><mtd><mstyle scriptlevel="0" displaystyle="false"><mrow><mi mathvariant="monospace">a</mi><mi mathvariant="monospace">d</mi><mi mathvariant="monospace">d</mi><mi mathvariant="monospace">_</mi><mi mathvariant="monospace">r</mi><mi mathvariant="monospace">e</mi><mi mathvariant="monospace">l</mi><mi mathvariant="monospace">a</mi><mi mathvariant="monospace">t</mi><mi mathvariant="monospace">i</mi><mi mathvariant="monospace">o</mi><mi mathvariant="monospace">n</mi></mrow></mstyle></mtd><mtd><mstyle scriptlevel="0" displaystyle="false"><mo lspace="0em" rspace="0em">:</mo></mstyle></mtd><mtd><mstyle scriptlevel="0" displaystyle="false"><mrow><mi mathvariant="double-struck">N</mi><mo>→</mo><mi mathvariant="double-struck">N</mi><mo>→</mo><mi mathvariant="double-struck">L</mi><mo>→</mo><mrow><mi mathvariant="monospace">u</mi><mi mathvariant="monospace">n</mi><mi mathvariant="monospace">i</mi><mi mathvariant="monospace">t</mi></mrow></mrow></mstyle></mtd></mtr><mtr><mtd><mstyle scriptlevel="0" displaystyle="false"><mrow><mi mathvariant="monospace">g</mi><mi mathvariant="monospace">e</mi><mi mathvariant="monospace">t</mi><mi mathvariant="monospace">_</mi><mi mathvariant="monospace">r</mi><mi mathvariant="monospace">e</mi><mi mathvariant="monospace">l</mi><mi mathvariant="monospace">a</mi><mi mathvariant="monospace">t</mi><mi mathvariant="monospace">i</mi><mi mathvariant="monospace">o</mi><mi mathvariant="monospace">n</mi></mrow></mstyle></mtd><mtd><mstyle scriptlevel="0" displaystyle="false"><mo lspace="0em" rspace="0em">:</mo></mstyle></mtd><mtd><mstyle scriptlevel="0" displaystyle="false"><mrow><mi mathvariant="double-struck">N</mi><mo>→</mo><mi mathvariant="double-struck">N</mi><mo>→</mo><mtext>Option</mtext><mo stretchy="false">⟨</mo><mi mathvariant="double-struck">L</mi><mo stretchy="false">⟩</mo></mrow></mstyle></mtd></mtr></mtable></mstyle></mtd></mtr></mtable><annotation encoding="application/x-tex">\begin{array}{lcl}
  \begin{array}{rcl}
    \mathbb N &amp; : &amp; \text{nodes} \\
    \mathbb L &amp; : &amp; \text{labels}
  \end{array}
  &amp; \quad &amp;
    \begin{array}{rcl}
    \mathtt{find} &amp; : &amp; \mathbb N \to \mathbb N \times \mathbb L \\
    \mathtt{add\_relation} &amp; : &amp; \mathbb N \to \mathbb N \to \mathbb L \to \mathtt{unit} \\
    \mathtt{get\_relation} &amp; : &amp; \mathbb N \to \mathbb N \to \text{Option}\langle\mathbb L\rangle
  \end{array}
\end{array}</annotation></semantics></math></span><span class="katex-html" aria-hidden="true"><span class="base"><span class="strut" style="height:3.6em;vertical-align:-1.55em;"></span><span class="mord"><span class="mtable"><span class="arraycolsep" style="width:0.5em;"></span><span class="col-align-l"><span class="vlist-t vlist-t2"><span class="vlist-r"><span class="vlist" style="height:2.05em;"><span style="top:-4.05em;"><span class="pstrut" style="height:4.05em;"></span><span class="mord"><span class="mord"><span class="mtable"><span class="arraycolsep" style="width:0.5em;"></span><span class="col-align-r"><span class="vlist-t vlist-t2"><span class="vlist-r"><span class="vlist" style="height:1.45em;"><span style="top:-3.61em;"><span class="pstrut" style="height:3em;"></span><span class="mord"><span class="mord mathbb">N</span></span></span><span style="top:-2.41em;"><span class="pstrut" style="height:3em;"></span><span class="mord"><span class="mord mathbb">L</span></span></span></span><span class="vlist-s">​</span></span><span class="vlist-r"><span class="vlist" style="height:0.95em;"><span></span></span></span></span></span><span class="arraycolsep" style="width:0.5em;"></span><span class="arraycolsep" style="width:0.5em;"></span><span class="col-align-c"><span class="vlist-t vlist-t2"><span class="vlist-r"><span class="vlist" style="height:1.45em;"><span style="top:-3.61em;"><span class="pstrut" style="height:3em;"></span><span class="mord"><span class="mrel">:</span></span></span><span style="top:-2.41em;"><span class="pstrut" style="height:3em;"></span><span class="mord"><span class="mrel">:</span></span></span></span><span class="vlist-s">​</span></span><span class="vlist-r"><span class="vlist" style="height:0.95em;"><span></span></span></span></span></span><span class="arraycolsep" style="width:0.5em;"></span><span class="arraycolsep" style="width:0.5em;"></span><span class="col-align-l"><span class="vlist-t vlist-t2"><span class="vlist-r"><span class="vlist" style="height:1.45em;"><span style="top:-3.61em;"><span class="pstrut" style="height:3em;"></span><span class="mord"><span class="mord text"><span class="mord">nodes</span></span></span></span><span style="top:-2.41em;"><span class="pstrut" style="height:3em;"></span><span class="mord"><span class="mord text"><span class="mord">labels</span></span></span></span></span><span class="vlist-s">​</span></span><span class="vlist-r"><span class="vlist" style="height:0.95em;"><span></span></span></span></span></span><span class="arraycolsep" style="width:0.5em;"></span></span></span></span></span></span><span class="vlist-s">​</span></span><span class="vlist-r"><span class="vlist" style="height:1.55em;"><span></span></span></span></span></span><span class="arraycolsep" style="width:0.5em;"></span><span class="arraycolsep" style="width:0.5em;"></span><span class="col-align-c"><span class="vlist-t vlist-t2"><span class="vlist-r"><span class="vlist" style="height:2.05em;"><span style="top:-4.05em;"><span class="pstrut" style="height:4.05em;"></span><span class="mord"><span class="mspace" style="margin-right:1em;"></span></span></span></span><span class="vlist-s">​</span></span><span class="vlist-r"><span class="vlist" style="height:1.55em;"><span></span></span></span></span></span><span class="arraycolsep" style="width:0.5em;"></span><span class="arraycolsep" style="width:0.5em;"></span><span class="col-align-l"><span class="vlist-t vlist-t2"><span class="vlist-r"><span class="vlist" style="height:2.05em;"><span style="top:-4.05em;"><span class="pstrut" style="height:4.05em;"></span><span class="mord"><span class="mord"><span class="mtable"><span class="arraycolsep" style="width:0.5em;"></span><span class="col-align-r"><span class="vlist-t vlist-t2"><span class="vlist-r"><span class="vlist" style="height:2.05em;"><span style="top:-4.21em;"><span class="pstrut" style="height:3em;"></span><span class="mord"><span class="mord"><span class="mord mathtt">find</span></span></span></span><span style="top:-3.01em;"><span class="pstrut" style="height:3em;"></span><span class="mord"><span class="mord"><span class="mord mathtt">add_relation</span></span></span></span><span style="top:-1.81em;"><span class="pstrut" style="height:3em;"></span><span class="mord"><span class="mord"><span class="mord mathtt">get_relation</span></span></span></span></span><span class="vlist-s">​</span></span><span class="vlist-r"><span class="vlist" style="height:1.55em;"><span></span></span></span></span></span><span class="arraycolsep" style="width:0.5em;"></span><span class="arraycolsep" style="width:0.5em;"></span><span class="col-align-c"><span class="vlist-t vlist-t2"><span class="vlist-r"><span class="vlist" style="height:2.05em;"><span style="top:-4.21em;"><span class="pstrut" style="height:3em;"></span><span class="mord"><span class="mrel">:</span></span></span><span style="top:-3.01em;"><span class="pstrut" style="height:3em;"></span><span class="mord"><span class="mrel">:</span></span></span><span style="top:-1.81em;"><span class="pstrut" style="height:3em;"></span><span class="mord"><span class="mrel">:</span></span></span></span><span class="vlist-s">​</span></span><span class="vlist-r"><span class="vlist" style="height:1.55em;"><span></span></span></span></span></span><span class="arraycolsep" style="width:0.5em;"></span><span class="arraycolsep" style="width:0.5em;"></span><span class="col-align-l"><span class="vlist-t vlist-t2"><span class="vlist-r"><span class="vlist" style="height:2.05em;"><span style="top:-4.21em;"><span class="pstrut" style="height:3em;"></span><span class="mord"><span class="mord mathbb">N</span><span class="mspace" style="margin-right:0.2778em;"></span><span class="mrel">→</span><span class="mspace" style="margin-right:0.2778em;"></span><span class="mord mathbb">N</span><span class="mspace" style="margin-right:0.2222em;"></span><span class="mbin">×</span><span class="mspace" style="margin-right:0.2222em;"></span><span class="mord mathbb">L</span></span></span><span style="top:-3.01em;"><span class="pstrut" style="height:3em;"></span><span class="mord"><span class="mord mathbb">N</span><span class="mspace" style="margin-right:0.2778em;"></span><span class="mrel">→</span><span class="mspace" style="margin-right:0.2778em;"></span><span class="mord mathbb">N</span><span class="mspace" style="margin-right:0.2778em;"></span><span class="mrel">→</span><span class="mspace" style="margin-right:0.2778em;"></span><span class="mord mathbb">L</span><span class="mspace" style="margin-right:0.2778em;"></span><span class="mrel">→</span><span class="mspace" style="margin-right:0.2778em;"></span><span class="mord"><span class="mord mathtt">unit</span></span></span></span><span style="top:-1.81em;"><span class="pstrut" style="height:3em;"></span><span class="mord"><span class="mord mathbb">N</span><span class="mspace" style="margin-right:0.2778em;"></span><span class="mrel">→</span><span class="mspace" style="margin-right:0.2778em;"></span><span class="mord mathbb">N</span><span class="mspace" style="margin-right:0.2778em;"></span><span class="mrel">→</span><span class="mspace" style="margin-right:0.2778em;"></span><span class="mord text"><span class="mord">Option</span></span><span class="mopen">⟨</span><span class="mord mathbb">L</span><span class="mclose">⟩</span></span></span></span><span class="vlist-s">​</span></span><span class="vlist-r"><span class="vlist" style="height:1.55em;"><span></span></span></span></span></span><span class="arraycolsep" style="width:0.5em;"></span></span></span></span></span></span><span class="vlist-s">​</span></span><span class="vlist-r"><span class="vlist" style="height:1.55em;"><span></span></span></span></span></span><span class="arraycolsep" style="width:0.5em;"></span></span></span></span></span></span></span>
<img class="transparent"
  src="{{ 'imgs/publications/2025-pldi-labeled-uf.svg' | relative_url }}"
  alt="Labeled union-find operations"
  style="width:700px;" />
<figcaption>
Fig. Main operations of labeled union-find. Compared to classical union-find,
<code>find</code> is modified to also return the relation from the current node to the
representative; the <code>union</code> operation has been renamed <code>add_relation</code>, and the
<code>get_relation</code> operation is new.
</figcaption>
</figure>

## The labeled union-find relational abstraction

When using labeled union-find to represent abstract relations between variables,
the soundness of operations places strong requirements on the relations that
can be used. We show that these relations **must correspond to injective functions**
between equivalence classes. The following examples relations are suitable:

- Constant offset: relations of the form $$y = x + b$$ for some constant $$b$$
- Two Value per Equality (TVPE): $$ax + by + c = 0$$, with $$a,b,c \in \mathbb Z^3$$, $$\mathbb Q^3$$ or $$\mathbb R^3$$
- Modular TVPE: $$y = ax + b\mathop{\texttt{mod}} 2^{64}$$ between 64-bit vectors with $$a$$ odd.
- Xor and rotation: $$y = (x \mathop{\mathtt{xor}} c) \mathop{\mathtt{rot}} n$$ between fixed-size bitvector, which can encode many shifts
- Linear transformations $$Y = A * X + B$$ where $$Y$$ and $$X$$ are vectors, and $$A$$ is an invertible matrix.

However, we cannot use relations like bounded difference $$y - x \in [a:b]$$, as
they are not injective. Doing so inevitably leads to precision loss.

## Application

We have implemented labeled union-find domains both in [Codex](https://codex.top),
a sound static analyzer based on abstract interpretation, and in [Colibri2](https://colibri.frama-c.com/index.html), a constraint solver.

Codex already performs [sophisticated constraint propagation]({{ '/research/2024-pldi-compiling-with-abstract-interpretation.html.' | append: page.lang | relative_url }}) *
using relations between the values computed by the program. However, the new
domain can find new relations. For example, it can relate simultaneously incremented loop counters:
```c
int i = 0, j = 4;
while(i < 10) { i += 1; j += 3; }
```
Without labeled union-find, Codex learns that at the end of the loop, $$\mathtt{i} = 10$$,
$$\mathtt{j} \in [4:+\infty]$$ and $$\mathtt{j} \equiv 1 \mathop{\mathtt{mod}} 3$$. However,
with labeled union find and the TVPE relation, $$\mathtt{j} = 3\mathtt{i} + 4$$ is inferred.
Thus, at the end of the loop, Codex knows $$\mathtt{j} = 34$$.

In Colibri2, we were able to increase propagations when using constant difference
alongside the interval domain. For example, instance, if $$f(x) = 2a+x+3b$$
for some $$a,b$$, and if we know that $$f(4) < 10$$, then we can learn that
$$f(9)^2 \leqslant 225$$ is unsatifsiable. This sort of reasoning seems easy, but
in practice, a decision procedure for non linear-arithmetic is difficult to implement and costly.
Using labeled union-find (to relate $$f(4)$$ and $$f(9)$$) enables solving some
easy cases such as these.

## Combining with other abstractions

Labeled union-find groups variables into related class, which each point to the
same representative. This can often be used to simplify other abstractions,
especially whenever information on any element can be deduced from information
on the representative.

For example, when combining the constant offset labeled union-find with the interval abstraction, we
only need to store intervals on representative elements, not on all variables, since these can be
recovered. If we know that $$y \xrightarrow{+2} x$$ and $$x \in [0:2]$$ then we do not need to store
$$y \in [2:4]$$. This reduces storage cost and propagation time, since all related variables are
updated at once any time new information is learned.

<figure>
<img class="transparent"
  src="{{ 'imgs/publications/2025-pldi-factorization.svg' | relative_url }}"
  alt="Using labeled union-find with a non-relational domain"
  style="width:1200px;" />
<figcaption>
Fig. Using labeled union-find to factorize a non-relational abstraction.
Left: without LUF, we store an interval value on all nodes of this term graph.
Right: using LUF, we can group related nodes together and only store an interval value
on the representative. We can recompute the values of other nodes as needed without precision loss.
</figcaption>
</figure>

Labeled union-find can also help relational abstraction similarly, shrinking their size and thus their
computation cost. Furthermore, it can be modified to detect any entailed equalities and notify other
abstractions of these facts.

## Going further

- Read the [paper]({{ '/files/publications/2025-pldi-relational-abstractions-labeled-uf-with-appendices.pdf' | relative_url }}).
- You can also read the [WIP workshop paper]({{ '/files/publications/2024-nsad-labeled-union-find.pdf' | relative_url }}). It is only 4 pages long and less technical.
- To be presented at the [Programming Language Design and Implementation (PLDI) 2025 conference](https://pldi25.sigplan.org/).
- Download the [**software artifact**](https://zenodo.org/records/15261356) from
  Zenodo to explore the code and see the performance results.
