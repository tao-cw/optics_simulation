 function x=collatz(n)
    % Classic ¡°3n+1¡± Ploblem from number theory
   c=n;
   while n>1
if rem(n,2)==0
         n=n/2;
      else
         n=3*n+1;
      end
      c=[c n];
end
c
