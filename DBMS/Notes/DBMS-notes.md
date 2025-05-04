# UNIT - 3

> 2 April, 2024

- ER Diagram
- Normalization

## 1. Normalization

- 1NF
- 2NF
- 3NF
- 3.5NF -> BCNF

### Functional Dependencies 

- FD which forms the basis of normalisation, depicts the relationhsip that exists amongst the attributes of a relation.
- FDs can be Valid FD or an Invalid FD

- For a relation, $R(XY)$ The FD: $X \rightarrow Y $ is said to be *valid* if same values of X are deriving same values of Y for all the cases wherever that value is appearing in X column.

- images have to be same, pre-image can be different.

    $\because \forall x_i \rightarrow y_i$

    $\therefore Valid FD$

- If all values of X are unique then by default $X \rightarrow Y $ is a valid FD. ie if on LHS all values are unique than all FDs are valid FDs.

- If for any one duplicate value of $x$ we are getting different value of $y$, then it is an invalid FD. $X \not\implies y$

- Y is dependent on X, Y can be determined using X
- There is one to one mapping between X and Y
- An FD is valid if for every value of X we have same value 
- X: Determinant
- Y: Dependent

    $x_1 \rightarrow y_1 $

    $x_2 \rightarrow y_2 $

    $x_3 \rightarrow y_3 $

- **Trivial V\S Non-Trivial FD**
- When Y is a $\subset$ of X then $X \rightarrow Y$ is a trivial FD.
- if $X \cap Y = \phi$, then $X \rightarrow Y $ is a Non-Trivial FD.

> **Note:**
>
>If there are $N$ attributes then
>
> $No. of FD's Possible = 2^{2n}$

#### Properties of FD via Inference Rules

These are the assertions which are used to derive additional FDs using an initial set of FDs.

> Note: First 3 are called **Armstrong Properties**

- **Reflexive Rule:** If $X \rightarrow Y$ then $Y \subset X$\
    e.g. $abc \rightarrow ab$

- **Augmentation Rule:** If $X \rightarrow Y$ then $XZ \rightarrow YZ$\
    e.g. $id \rightarrow name \implies (id,marks) \rightarrow (name, marks)$

- **Transitive Rule:** If $X \rightarrow Y$ and $Y \rightarrow Z$ then $X \rightarrow Z$\
    e.g. $id \rightarrow name and name \rightarrow lname  \implies id \rightarrow lname$

- **Union Rule:** If $X \rightarrow Y$ and $X \rightarrow Z$ then $X \rightarrow YZ$


- **Decompostion Rule:** If $X \rightarrow YZ$ then $X \rightarrow Y$ and $X \rightarrow Z$\
Proof:\
$X \rightarrow YZ$\
$YZ \rightarrow Y$\
$X \rightarrow Z$ (Transitive Rule)

> Question: Consider relation R(A,B,C,D) with FD as\
$AB \rightarrow C$\
$C \rightarrow D$\
Can $BC \rightarrow D$?

> Solution:\
$\because BC \rightarrow C$
and $C \rightarrow D$\
$\implies BC \rightarrow D$