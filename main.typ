#import "@preview/ctheorems:1.1.3": *
#show: thmrules
#import "conf.typ": conf

#set document(title: [
  Notes For MLA Cryptography Workshop
])
#show: conf.with(
  authors: (
    (
      name: "Kuan Yue Han 25J13",
    ),
    (
      name: "Zhang Hengwei 25J17",
    ),
  ),
  abstract: "Mathematical Cryptography",
)


//Setting for formating
#set heading(numbering: "1.")
#set enum(
  indent: 1em,      // Moves the entire list (including the number) to the right
  body-indent: 1em,  // Increases the space between the number and the text
  spacing: 1em // This adds the extra vertical gap between items
)

// Worksheet helpers (no underlines; just space/boxes)
#let blankcell(height: 1.4em) = block(height: height)[ ]

#let smallbox(width: 100%, height: 4.8em) = box(
  width: width,
  height: height,
  stroke: 0.6pt + black,
  inset: 0.4em,
)[ ]


= Basic Ciphers

== Caesar cipher 
Let the set of letters be $S = {A, B, C, ..., Z}$. 
This cipher is uses a bijective function $sigma : [1, 26] -> [1, 26] \
c |-> c + k (mod 27)
$ for some constant key k\
For example set k = 2, the word \
"BRANSON" is $S_2 S_18 S_1 S_19 S_15 S_4$ -> $S_(sigma(2)) S_(sigma(18)) S_(sigma(19)) S_(sigma(15)) S_(sigma(4))$ -> "EUDQVRQ".
However, this cipher is easily broken when the trick is known as there are only 26 possible keys (k). 

=== Worksheet Example (Caesar)
*Task:* Encrypt the plaintext *"MEET AT NOON"* using key $k = 7$.

*Letter ↔ number guide (A=1, B=2, ..., Z=26):*

#align(center)[
  #table(
    columns: (1.2fr,) + (0.4fr,) * 26,
    stroke: 0.6pt + black,
    inset: 3pt,
    [Letter:], [A], [B], [C], [D], [E], [F], [G], [H], [I], [J], [K], [L], [M],[N], [O], [P], [Q], [R], [S], [T], [U], [V], [W], [X], [Y], [Z],
    [Digit:], [1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12], [13],[14], [15], [16], [17], [18], [19], [20], [21], [22], [23], [24], [25], [26],
    [Cipher:], [H], [I], [J], [K], [#blankcell()],[#blankcell()], [#blankcell()], [#blankcell()], [#blankcell()], [#blankcell()], [#blankcell()], [#blankcell()], [#blankcell()], [#blankcell()],
    [#blankcell()], [#blankcell()], [#blankcell()], [#blankcell()], [#blankcell()], [#blankcell()],[#blankcell()], [#blankcell()], [#blankcell()], [#blankcell()], [#blankcell()], [#blankcell()],
  )
]


*Fill in the table for* *MEET AT NOON*:

#align(center)[
  #table(
    columns: (2.6fr,) + (1fr,) * 12,
    stroke: 0.6pt + black,
    inset: 4pt,
    [Plaintext:], [M], [E], [E], [T], [#align(center)[—]], [A], [T], [#align(center)[—]], [N], [O], [O], [N],

    [Digit:], [#blankcell()], [#blankcell()], [#blankcell()], [#blankcell()], [#blankcell()], [#blankcell()],
    [#blankcell()], [#blankcell()], [#blankcell()], [#blankcell()], [#blankcell()], [#blankcell()],

    [Ciphertext:], [#blankcell()], [#blankcell()], [#blankcell()], [#blankcell()], [#blankcell()], [#blankcell()],
    [#blankcell()], [#blankcell()], [#blankcell()], [#blankcell()], [#blankcell()], [#blankcell()],

  )
]


== Affine Cipher 
Let the set of letters be $S = {A, B, C, ..., Z}$. 
This cipher is uses a bijective function $sigma : [1, 26] -> [1, 26] \
c |-> a c + k (mod 27)
$ for some constants a and k where gcd(a, 27) = 1. (this ensures bijectivity) \ 
For example set a = 5 and k = 8, the word \
"WACKY" is $S_22 S_0 S_2 S_10 S_24$ -> $S_(sigma(22)) S_(sigma(0)) S_(sigma(2)) S_(sigma(10)) S_(sigma(24))$ -> "VGNKB". \
This cipher is slightly more secure than the Caesar cipher as there are more possible keys (a, k) but it is still easily broken when the trick is known as there are only 12 possible values for a and 27 possible values for k, giving a total of 324 possible keys.

=== Worksheet Example (Affine)
Use the same parameters as the example above: $a = 5$, $k = 8$.

Fill in the affine mapping table (A=1, ..., Z=26) with $"modulo" 26$:

#align(center)[
  #table(
    columns: (1.1fr,) + (.4fr,) * 26,
    stroke: 0.6pt + black,
    inset: 3pt,
    [Letter:], [A], [B], [C], [D], [E], [F], [G], [H], [I], [J], [K], [L], [M],[N], [O], [P], [Q], [R], [S], [T], [U], [V], [W], [X], [Y], [Z],
    [x:], [1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12], [13],[14], [15], [16], [17], [18], [19], [20], [21], [22], [23], [24], [25], [26],
    [$5x + 8$:], [13], [18], [23], [2], [7], [#blankcell()], [#blankcell()],
    [#blankcell()], [#blankcell()], [#blankcell()], [#blankcell()], [#blankcell()], [#blankcell()],[#blankcell()], [#blankcell()], [#blankcell()], [#blankcell()], [#blankcell()], [#blankcell()], [#blankcell()],
    [#blankcell()], [#blankcell()], [#blankcell()], [#blankcell()], [#blankcell()], [#blankcell()],
    [Result:], [#blankcell()], [#blankcell()], [#blankcell()], [#blankcell()], [#blankcell()], [#blankcell()], [#blankcell()],
    [#blankcell()], [#blankcell()], [#blankcell()], [#blankcell()], [#blankcell()], [#blankcell()],[#blankcell()], [#blankcell()], [#blankcell()], [#blankcell()], [#blankcell()], [#blankcell()], [#blankcell()],
    [#blankcell()], [#blankcell()], [#blankcell()], [#blankcell()], [#blankcell()], [#blankcell()],
  )
]



*Now do a word:* Encrypt the plaintext *"MATH"* using the same $a, k$.

#align(center)[
  #table(
    columns: (1fr,) * 4,
    stroke: 0.6pt + black,
    inset: 4pt,
    [M], [A], [T], [H],
    [#blankcell()], [#blankcell()], [#blankcell()], [#blankcell()],
  )
]

*Ciphertext:* #h(14em)

= Group Properties

A *group* is a set $G$ together with a binary operation $*$ such that:

1. (*Closure*) For all $a, b in G$, the result $a * b in G$.
2. (*Associativity*) For all $a, b, c in G$, $(a * b) * c = a * (b * c)$.
3. (*Identity element*) There exists an element $e in G$ such that $a * e = e * a = a$ for all $a in G$.
4. (*Inverse element*) For every $a in G$, there exists an element $a^{-1} in G$ such that $a * a^{-1} = a^{-1} * a = e$.

An important example in cryptography is the set of permutations of a finite set. The set of all permutations on $n$ elements forms a group under composition, called the symmetric group $S_n$.

These permutations can be composed and inverted, meaning that encryption and decryption operations form a group under composition. This algebraic structure helps explain why certain ciphers are easy or difficult to break.

= Extended Euclidean Algorithm (and the Euclidean Algorithm)
The Euclidean Algorithm is used to find the greatest common divisor of two numbers.
Notice that the greatest common divisor of two numbers is one when the numbers do not share any common factors other than one (hence are *coprime*). 
This goes both ways, hence we say that two numbers are *coprime* if and only if their greatest common divisor is one. \

First notice that $gcd(a, b)$ is the greatest common divisor of $a$ and $b$.  
Let

$
g = gcd(a, b)
$

Then we can write $a = g a'$ and $b = g b'$ for some integers $a'$ and $b'$.  
If $g | a$ and $g | b$, then $g | a - k b$ for any integer $k$.  
In other words,

$
gcd(a, b) = gcd(a, b mod a)
$

when $b mod a$ is taken to be the remainder when $b$ is divided by $a$.  

The algorithm will eventually terminate when it reaches $gcd(a_k, 0)$.  
In this case, $g = a_k$. \

It can be shown that it takes at most $2 log(a) + 1$ steps to terminate, and the average number of steps is approximately

$
(12 ln(2)) / (pi^2) ln(a).
$


= Discrete Logarithm Problem(DLP)
The DLP is the problem of finding an integer $k$ such that $g^k equiv h " "(mod p)$, given $g$, $h$, and a prime $p$.
If one can find such a solution, then there must be infinitely many solutions. As given in the FLT, assume k is a solution
$
g^k equiv h " "(mod p) \ 
g^(k + m(p-1)) equiv g^k g^(m(p-1)) equiv g^k equiv h " "(mod p)
$
Thus, the Discrete Logarithm Problem is only defined module $p-1$. 
It is widely accepted that the DLP is hard to solve.
Classical algorithms like the Baby-step Giant-step algorithm and Pollard's rho algorithm still take roughly $O(sqrt(p))$ time to solve the DLP. 

= Diffie Hellman//Maybe need change it to canvas example
#align(center)[
  #box(
    stroke: 1pt + black,
  )[
    #image("DiffieHellman.png", width: 80%, )
  ]
]



Diffle-Hellman(DH) protocol allows two parties(Alice and Bob) to establish a shared secret over an insecure channel. The security of the protocol relies on the difficulty of the discrete logarithm problem(DLP).

Secret values are *bolded* for better visualisation.

*Setup*

- Prime modulus: $p = 23$
- Generator: $g = 5$
This generator has to generate a large subgroup of the multiplicative group of integers modulo $p$ to ensure security. In this case, 5 is a primitive root modulo 23, meaning it generates the entire group of nonzero elements modulo 23.

== Alice
//Idk if possible but make eqn at centre, mod p towards the side of centre idk how

Alice chooses a secret:
*$ a = 4 $*

She computes:

$ A equiv g^bold(a) " "(mod p) $
$ A equiv 5^bold(4) equiv 4 " "(mod 23) $

She sends $A$ to Bob.

== Bob

Bob chooses a secret:
*$ b = 3 $*

He computes:

$ B equiv g^bold(b) " "(mod p) $
$ B equiv 5^bold(3) equiv 10 " "(mod 23) $

He sends $B$ to Alice.

== Shared Secret Calculation

Alice computes:
$ bold(s) equiv B^bold(a) " "(mod p) $
$ bold(s) equiv 10^bold(4) equiv bold(18) " "(mod 23) $

Bob computes:
$ bold(s) equiv A^bold(b) " "(mod p) $
$ bold(s) equiv 4^3 equiv bold(18) " "(mod 23) $

== Result

Both obtain the same shared secret:
*$ s = 18 $*

It can be showed that the shared secret equivilant as:
$ A equiv g^bold(a) " "(mod p) $
$ B equiv g^bold(b) " "(mod p) $

$ A^b equiv (g^bold(a))^bold(b) equiv g^(bold(a b)) " "(mod p) $

$ B^a equiv (g^bold(b))^bold(a) equiv g^(bold(b a)) " "(mod p) $

Since *$a b = b a$*:

$ A^bold(b) equiv B^bold(a) " "(mod p) $

More explicitly:

$ (g^a)^b = (g^b )^a " "(mod p) $

== Worksheet Example (Diffie--Hellman)
*Given:* $p = 29$, $g = 2$, Alice secret $a = 11$, Bob secret $b = 7$.

Compute each step (leave your final value in the blank):

- Alice public value:
  $A equiv g^a$ (mod 29)

  $A equiv g^a equiv 2^11 equiv #underline("              ") (mod 29)$
  
  So $A = #underline("           " )$.

- Bob public value:
  $B equiv g^b$ (mod 29)

  $B equiv g^b equiv 2^7 equiv #underline("              ") (mod 29)$
  
  So $B = #underline("           " )$.

- Shared secret (Alice):
  $s equiv B^a$ (mod 29)

  $s equiv B^a equiv #underline("              ") (mod 29)$
  
  So $s = #underline("           " )$.

- Shared secret (Bob):
  $s equiv A^b$ (mod 29)

  $s equiv A^b equiv #underline("              ") (mod 29)$
  
  So $s = #underline("           " )$.

Double check Alice's secret is equivlant to Bob's secret key!







= RSA
RSA(Rivest-Shamir-Adleman) is a widely used public-key cryptosystem that relies on the difficulty of factoring large integers. It allows for secure communication and digital signatures.

== Key Generation

A user generates an RSA keys as follows:

1. Choose two distinct large prime numbers $p$ and $q$. (This are kept secret)
2. Compute $n = p * q$. (This is part of the public key)
3. Compute $ phi(n) = (p-1)(q-1)$. (This is kept secret)
4. Choose an integer $e$ such that $1 < e < phi(n)$ and $gcd(e, phi(n)) = 1$. The integer $e$ is the public exponent and is part of the public key. A common choice for $e$ is 65537 = 2^16 + 1 to prevent small private exponents attack.
5. Compute private exponent $d$ such that $d equiv e^(-1) mod phi(n)$, $d$ is the private exponent and should be kept secret.

To summerise, $(n, e)$ is the public values and $(p, q, d)$ is the private values.

== Encryption
To encrypt a message $M$ (where $0 <= M < n$), the sender computes the ciphertext $C$ using the recipient's public key $(n, e)$ as follows:
$ C equiv M^e mod n $

== Decryption
To decrypt the ciphertext $C$, the recipient uses their private key $d$ to compute the original message $M$ as follows:
$ M equiv C^d mod n $

This works because by Euler's theorem $a^phi(n) equiv 1 " "(mod n)$:
$ C^d equiv (M^e)^d equiv M^(e d) equiv M^(1 + k phi(n)) equiv M mod n $

== Worksheet Example (RSA)
*Given:* $p = 5$, $q = 11$, $e = 3$, message $M = 12$.

Fill in the blanks:

- $n = p q =$ #h(10em)
- $phi(n) = (p-1)(q-1) =$ #h(10em)
- Find $d equiv e^(-1)$ : $d =$ #h(5em) (mod $phi(n)$)

- Encrypt:
  $C equiv M^e equiv 12^3$ = #h(5em) (mod $n$)
  
  So $C =$ #h(8em)

- Decrypt:
  $M' equiv C^d$ (mod $n$) = #h(5em) (mod $n$)
  
  So $M' =$ #h(8em)

== Security
The current best algorithm to attack RSA is to factor integers. By using General Number Field Sieve, the time complexity is sub-exponential in the size of $n$ or $f(x)=e^((c+o(1))(ln n)^(1/3)(ln ln n)^(2/3)), "where "c = 1.923$. 

Taking $o(1) = 20$ When $n = 2^256 $, $f(n) approx n^2.08$. At $n=2^2048, f(n) approx n^0.651$, roughly $10^375$ computational years. 

However, with Shor's algorithm, the time complexity is polynomial in the size of $n$, at roughly $O((log n)^3)$. With 100k qubits, it is estimated that RSA-2048 can be broken in a few hours. 

== Wiener's attack

#let theorem = thmbox("Wiener", "Theorem", fill: rgb("#ffffff"))


#theorem("Wiener")[
Given a public key $(e, n)$ where $n = p q$, if 
$ d < 1/3 n^(1/4) $
along with Legendre theorem on continued fractions, where $abs(x-a/b)<1/(2b^2)$, then $a/b$ is one of the convergents fraction of $x-a/b$. Then $d$ can be found using continued fractions quickly.
]
//End therom

*Proof:*

Wiener's attack relies on the fact that if $d$ is small, then the fraction $e/n$ can be approximated by a rational number with a small denominator, which corresponds to the private exponent $d$. This proof is challenging to follow, do ask questions if needed.

=== Definition
To start off, let $G = gcd(p, q)$ and let the Carmichael function be $lambda(n) = phi(n)/gcd(p, q) = lcm(p,q)$, then

$ e d = 1 + k lambda(n) $

=== Useful Lemmas
*Lemma 1:* $N- phi(n)< 3sqrt(n)$

*Proof*: Assuming standard RSA encryptions, $p < q < 2q$. Using $N=p q$ and $p < sqrt(n)$, we have $q < 2p = 2sqrt(n)$ and thus $p + q - 1 < sqrt(n) + 2sqrt(n) - 1 = 2sqrt(n) - 1 < 3sqrt(n)$. 

Since $phi(n) = (p-1)(q-1)= p q -p -q+1$, $N-phi(N) = p-q+1<3sqrt(n)$

*Lemma 2:* $k < d$

*Proof*: $k lambda(n) = e d - 1 < e d$. Since using standard RSA encryption, $e < lambda(n)$, then $k lambda(n) < e d < d lambda(n)$. Cancelling $lambda(n)$, we obtain $k < d$.

*Lemma 3*: $1/(2d) >1/N^(1/4)$

*Proof*: $d < 1/3N^(1/4)$, $2d< 3d<N^(1/4)$, $1/(2d)>N^(1/4)$.

=== Proof

$ e d = 1 + k lambda(n) $
$ e /phi(n) - k/ (G d) = 1/(d phi(n)) $

Remember, our goal is to make an expression of $abs(x-a/b) < 1/(2b^2)$ with known values. Thus, we approximate $phi(n)$ with n.

$ abs(e/n - k/(G d)) = abs((e d G -k N)/(N G d) ) $

Since  $k phi(n) = G (k lambda(n)) = e d G$:
$ 
  abs((e d G - k N) / (N G d)) &= abs((e d G - k phi(n) - k N + k phi(n)) / (N G d)) \
  &= abs((1 - k(N - phi(n))) / (N G d))  \
  &< abs((1 - k(3 sqrt(n))) / (N G d))&"(Lemma 1)"\
  &< abs((3k sqrt(n)) / (N G d)) \
  &<=(3k)/(d sqrt(n)) \
  &<(3d)/(d sqrt(n))&"(Lemma 2)"\
  &=(3(1/3N^(1/4)))/(d sqrt(n)) \
  &=1/(d N^(1/4))\
  &<1/(2d^2)&"(Lemma 3)"
$
Therefore,
$ abs(e/n - k/(G d))< 1/(2d^2) $
which satisfy the condition since $e/n$ is known.

== lattice attacks
TBD

#counter(heading).update(0)
#set page(paper: "a4")

#align(center)[
  #block(inset: (top: 2em, bottom: 1em))[
    #text(size: 1.5em, weight: "bold")[Appendix] \
    #text(size: 1.2em, weight: "bold")[Supplemental Information]
  ]
]
= Bijection Proofs

== Bijection Proof for Caesar or Affine Cipher

#let theorem = thmbox("Affine", "Theorem", fill: rgb("#eeffee"))

#theorem("Affine")[

Let $E(x) = a x + b " "(mod n)$ be the substitution function for the affine cipher, where $n$ is prime so that for all $a$, $gcd(a, n) = 1$. Then, E is a bijection from the set of integers modulo $n$ to itself.
] <Affine>

*Proof:*

Let $i, j in {1, 2, dots, n-1}$ be distinct intgers, i.e. $i != j$. Without loss of generality (WLOG), let $i>j$. If $E(i) equiv E(j) mod n$, we have:

$ a i + b equiv a j + b " "(mod n) $
$ a (i - j) equiv 0 " "(mod n) $
$ a (i - j) = k n  $ 

Since $gcd(a, n) = 1$, by euclid lemma, $n | (i - j)$. However, since $0 < i - j < n$, i is not divisible by $n$. This is a contradiction and thus $i = j$.

Via pigeonhole principle, since there are $n$ possible outputs and $n$ possible inputs, and no two input maps to the same output, each input must map to a unique output. Hence, $E$ is a bijection.

This also proves caesar cipher is a bijection as it is a special case of affine cipher where $a = 1$.



= Proof of Fermat's Little Theorem(FLT)

We can proof via more generalised Euler's theorem $a^phi(n) equiv 1 " "(mod n)$ or formal proof of FLT using bionmial distrubution. We will choose the latter, which is more intuitive and easier to understand. (To proof Euler's theorem, it's further down in the appendix)
#let theorem = thmbox("FLT", "Theorem", fill: rgb("#eeffee"))

#theorem("FLT")[
If $p$ is a prime and $a$ is an integer not divisible by $p$, then 

$ a^(p-1) equiv 1 " "(mod p) $
Or similiarly:

$ a^(p) equiv a " "(mod p) $
] <FLT>

*Proof: * 

Consider the expansion of $(1 + a)^p$ using the binomial theorem:


Let $p$ be a prime number and $a$ an integer.

We start with the binomial expansion:
$
(1 + a)^p = sum_(k=0)^p binom(p, k) 1^(p-k) a^k= sum_(k=0)^p binom(p, k) a^k
$

Expanding the sum, we have:
$
(1 + a)^p
= binom(p, 0) a^0
+ binom(p, 1) a^1
+ binom(p, 2) a^2
+ dots
+ binom(p, p-1) a^{p-1}
+ binom(p, p) a^p
$

Since:
$
binom(p, 0) = 1, quad binom(p, p) = 1
$

So:
$
(1 + a)^p
= 1 + a^p + sum_(k=1)^{p-1} binom(p, k) a^k
$

Now observe that for $1 <= k <= p-1$:
$
binom(p, k) = frac(p!,k!(p-k)!)
$

Since $p$ is prime, $p$ divides $p!$ but does not divide $k!$ or $(p-k)!$.
Hence:
$
p | binom(p, k)
$

Therefore, for all $1 <= k <= p-1$:
$
binom(p, k) equiv 0 mod p
$

So all middle terms vanish modulo $p$:
$
sum_(k=1)^{p-1} binom(p, k) a^k equiv 0 mod p
$


Thus, the inductive step is shown:
$
(a + 1)^p equiv a^p + 1 mod p
$

Via induction, $1^p equiv (0^p + 1) mod p =>a=0 "is true"$ and given the inductive step:

$
a^p equiv a mod p
$

By the principle of mathematical induction, we have proved Fermat's Little Theorem.

= Euler's Theorem
#let theorem = thmbox("Euler", "Theorem", fill: rgb("#eeffee"))

#theorem("Euler")[
If $a, n in ZZ$ such that $gcd(a, n) = 1$. Then:

$ a^(phi(n)) equiv 1 " "(mod n) $


] <Euler>

*Proof:*
Consider the set of integers $S = {r_1, r_2, dots, r_(phi(n))}$ which represent the reduced residue system modulo $n$. These are the integers in the range $[1, n]$ that are coprime to $n$.

Since $gcd(a, n) = 1$, we can multiply each element in $S$ by $a$ to form a new set:
$ S' = {a r_1, a r_2, dots, a r_(phi(n))} $

We claim that $S'$ is also a reduced residue system modulo $n$ ,which is similiar to bijection proof for affine cipher. 
// 1. Each $a r_i$ is coprime to $n$ because both $a$ and $r_i$ are coprime to $n$.
// 2. No two elements in $S'$ are congruent modulo $n$. If $a r_i equiv a r_j thin (mod n)$, then $r_i equiv r_j thin (mod n)$ because $a$ is invertible modulo $n$. Since $r_i$ and $r_j$ are distinct elements of $S$, this is impossible unless $i = j$.
Therefore, the set $S'$ is simply a permutation of $S$ modulo $n$. Multiplying the elements of both sets together gives:
$ product_(i=1)^(phi(n)) a r_i equiv product_(i=1)^(phi(n)) r_i mod n $

Factoring out $a$ from the product on the left:
$ a^(phi(n)) (r_1 r_2 dots r_(phi(n))) equiv (r_1 r_2 dots r_(phi(n))) mod n $

Let $P = product_(i=1)^(phi(n)) r_i$. Since each $r_i$ is coprime to $n$, their product $P$ is also coprime to $n$. This means $P$ has a multiplicative inverse modulo $n$. Multiplying both sides by $P^(-1)$ yields:
$ a^(phi(n)) equiv 1 mod n $ 