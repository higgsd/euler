Project Euler
=====

I am solving Project Euler one problem at a time; I started using both C and
Python, but am currently using Haskell exclusively.  You are free to fork, but
I won't be accepting pull requests.

I am not below using Google to find hints (e.g. what class of problem is this?)
or approaches (e.g. what is a faster alternative to brute-force for a step?),
but prefer to avoid wholesale copying in favor of understanding and
reimplementing.

This code is BSD-licensed as described in the LICENSE file, unless otherwise
noted in an individual file.  The contents of the 'files' directory were
downloaded from Project Euler and are presumed to fall under their Creative
Commons Licence: Attribution-NonCommercial-ShareAlike 2.0 UK: England & Wales,
as per https://projecteuler.net/copyright .

C
-----

I am good at C and like to think that I understand it quite well.  For these
problems, I limit myself to using GMP for bignums and the BSD queue/tree macros
for non-trivial data structures.

Python
-----

I am also familiar with Python, and find it much faster for prototyping
unfamiliar algorithms.  For these problems, I avoid the standard library
whenever possible with the exception of 'math'.

Haskell
-----

I am new to Haskell and apologize in advance for the code quality and style.
Monads aren't entirely mysterious to me, but I've found it much easier to code
around them when solving problems.  I haven't figured out how to reason about
CAFs or space/time tradeoffs, and how it relates to point-free style.  I may
have gone a bit far in leveraging Hackage libraries to assist...
