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


= Introduction
#counter("Int")
TBD

== Caesar cipher 
Let the set of letters be $S = {A, B, C, ..., Z}$. 
This cipher is uses a bijective function $sigma : [1, 26] -> [1, 26] \
c |-> c + k (mod 27)
$ for some constant key k\
For example set k = 12, the word \
"APPLE" is $S_1 S_16 S_16 S_12 S_5$ -> $S_(sigma(1)) S_(sigma(16)) S_(sigma(16)) S_(sigma(12)) S_(sigma(5))$ -> "MCCYQ".
However, this cipher is easily broken when the trick is known as there are only 26 possible keys (k). 

== Affine Cipher 
Let the set of letters be $S = {A, B, C, ..., Z}$. 
This cipher is uses a bijective function $sigma : [1, 26] -> [1, 26] \
c |-> a c + k (mod 27)
$ for some constants a and k where gcd(a, 27) = 1. (this ensures bijectivity) \ 
For example set a = 5 and k = 8, the word \
"APPLE" is $S_1 S_16 S_16 S_12 S_5$ -> $S_(sigma(1)) S_(sigma(16)) S_(sigma(16)) S_(sigma(12)) S_(sigma(5))$ -> "MGGNF". \
This cipher is slightly more secure than the Caesar cipher as there are more possible keys (a, k) but it is still easily broken when the trick is known as there are only 12 possible values for a and 27 possible values for k, giving a total of 324 possible keys.

= Group Properties

A *group* is a set $G$ together with a binary operation $*$ such that:

1. (*Closure*) For all $a, b \in G$, the result $a * b \in G$.
2. (*Associativity*) For all $a, b, c \in G$, $(a * b) * c = a * (b * c)$.
3. (*Identity element*) There exists an element $e \in G$ such that $a * e = e * a = a$ for all $a \in G$.
4. (*Inverse element*) For every $a \in G$, there exists an element $a^{-1} \in G$ such that $a * a^{-1} = a^{-1} * a = e$.

An important example in cryptography is the set of permutations of a finite set. The set of all permutations on $n$ elements forms a group under composition, called the symmetric group $S_n$.

These permutations can be composed and inverted, meaning that encryption and decryption operations form a group under composition. This algebraic structure helps explain why certain ciphers are easy or difficult to break.


#let theorem = thmbox("FLT", "Theorem", fill: rgb("#eeffee"))

#theorem("FLT")[
  In a right-angled triangle, the square of the hypotenuse is equal to the sum of the squares of the other two sides.
] <FLT>

As seen in @FLT, the relationship holds...

= Discrete Logarithm Problem(DLP)
tbd

= Diffie Hellman//Maybe need change it to canvas example

Diffle-Hellman(DH) protocol allows two parties(Alice and Bob) to establish a shared secret over an insecure channel. The security of the protocol relies on the difficulty of the discrete logarithm problem(DLP).

Secret values are *bolded* for better visualisation.

*Setup*

- Prime modulus: $p = 23$
- Generator: $g = 5$

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


#align(center)[
  #box(
    stroke: 1pt + black,
  )[
    #image("DiffieHellman.png", width: 80%, )
  ]
]

= Euclidean Algorithm
tbd along with extend

= Fermat Little Theorem(FLT)

*Theorem: * If $p$ is a prime and $a$ is an integer not divisible by $p$, then 

$ a^(p-1) equiv 1 " "(mod p) $.
Or similiarly:

$ a^(p) equiv a " "(mod p) $.

We can proof via more generalised Euler's theorem $a^phi(n) equiv 1 " "(mod n)$ or formal proof of FLT using bionmial distrubution. We will choose the latter, which is more intuitive and easier to understand. (To proof Euler's theorem, please refer to appendix)

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

== Security
The current best algorithm to attack RSA is to factor intgers. By using General Number Field Sieve, the time complexity is sub-exponential in the size of $n$ or $f(x)=e^((c+o(1))(ln n)^(1/3)(ln ln n)^(2/3)), "where "c = 1.923$. 

Taking $o(1) = 20$ When $n = 2^256 $, $f(n) approx n^2.08$. At $n=2^2048, f(n) approx n^0.651$, roughly $10^375$ computational years. 

However, with Shor's algorithm, the time complexity is polynomial in the size of $n$, at roughly $O((log n)^3)$. With 100k qubits, it is estimated that RSA-2048 can be broken in a few hours. 

== Weiner's attack

== some stupid lattice attacks

= Appendix

== Bijection Proof 

=== Bijection Proof for Affine Cipher
and all the others

== Euler's Theorem
