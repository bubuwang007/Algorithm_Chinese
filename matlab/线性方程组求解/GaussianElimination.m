%a为系数矩阵，b为常数项
function x = GaussianElimination(a,b)

sizeOfa = size(a);
sizeOfb = size(b);

if sizeOfa(2)~=sizeOfb(1)
    error("系数矩阵维度不符合常数项的要求！")
end
if sizeOfb(2)~=1
    error("常数项应为列向量")
end

for k = 1:sizeOfa(1)-1 
    for i = k+1:sizeOfa(1)
       mik = a(i,k)/a(k,k);
       for j = k:sizeOfa(2)
          a(i,j) = a(i,j)- mik*a(k,j);
       end
       b(i) = b(i) - mik*b(k);
    end
end

x = zeros(sizeOfa(1),1);
x(sizeOfa(1),1) = b(sizeOfa(1))/a(sizeOfa(1),sizeOfa(2));
for i = sizeOfa(1)-1:-1:1
    sum = 0;
    for j = i+1:sizeOfa(1)
        sum = sum + a(i,j)*x(j);
    end
    x(i) = (b(i)-sum)/a(i,i);
end

end