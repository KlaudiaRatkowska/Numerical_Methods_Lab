function zadanie2()
    N = 7;
    d=0.85;
    Edges=[1,1,2,2,2,3,3,3,4,4,5,5,6,6,7;
           4,6,3,4,5,5,6,7,5,6,4,6,4,7,6,];

    B = sparse(Edges(2,:), Edges(1,:), ones(1, size(Edges,2)), N, N);
    L=sum(B)';
    I=speye(N);
    A = spdiags(1./L,0:0,N,N);
    M = sparse(I - d*B*A);
 
    b = zeros(N,1);
    b(:,1) = (1 - d)/N;
    
   whos A B I M b

   spy(B)
   title('Sąsiedztwo stron')
   print -dpng spy_b.png

   r = M\b;

   bar(r)
   title('PageRank')
   xlabel("Strony")
   ylabel('Wartości PR')
   print -dpng bar.png

end