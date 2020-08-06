clear
clc

a = [1 1 1;0 4 -1;2 -2 1];
b = [6;5;1];

a = [1 5 3;2 4 3;1 2 3];
b = [33;33;24];

a = [1,2,-2;1,1,1;2,2,1];
b = [1;1;1];

sizeOfa = size(a);
sizeOfb = size(b);

for k = 1:sizeOfa(1)-1 
    for i = k+1:sizeOfa(1)
       mik = a(i,k)/a(k,k);
       for j = k:sizeOfa(2)
          a(i,j) = a(i,j)- mik*a(k,j);
       end
       b(i) = b(i) - mik*b(k);
    end
end
