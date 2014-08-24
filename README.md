Project Euler
=====

I am solving Project Euler one problem at a time, and won't be accepting pull
requests.  Leave a comment or file an issue, I guess; I'm new to github too.

I am not below using Google to find hints (e.g. what class of problem is this?)
or approaches (e.g. what is a faster alternative to brute-force for a step?),
but prefer to avoid wholesale copying in favor of understanding and rewriting.

This code is BSD-licensed as described in the LICENSE file, unless otherwise
noted in an individual file.  Files in the 'files' directory were downloaded
from Project Euler and are presumably under a Creative Commons Licence:
Attribution-NonCommercial-ShareAlike 2.0 UK: England & Wales, as per
https://projecteuler.net/copyright .

C
-----

I am good at C, and it is fast.  I limit myself to using GMP for bignum
support, and the BSD queue and tree macros for non-trivial data structures.

Python
-----

I am also familiar with Python, and it is much faster for prototyping
unfamiliar algorithms.  Here, I avoid the standard library whenever possible,
with the exception of 'math'.

Haskell
-----

I am new to Haskell and apologize in advance for the code quality.  Monads
aren't entirely mysterious to me, but I've found it much easier to code around
them when solving problems.  I haven't figured out how to reason about CAFs or
space/time tradeoffs, and how it relates to point-free style.
