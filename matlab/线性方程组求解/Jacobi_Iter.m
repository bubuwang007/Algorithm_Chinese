%a为系数矩阵，b为常数项
function x = Jacobi_Iter(a,b)

%定义初始值与误差
x = zeros(size(b));
error_ = 1;

%确定迭代格式，求解B0与f
for i = 1:size(a,1)
   for j = 1:size(a,1)
      if i ~= j
          a(i,j) = -a(i,j)/a(i,i);         
      end
   end
   b(i) = b(i)/a(i,i);
   a(i,i) = 0;
end

%迭代求解
count = 0;
count_temp = 0;
while error_ > 1e-9
    
    x_temp = a*x+b;
    error_temp = max(abs(x_temp-x));
    
    if abs(error_temp)-abs(error_) > 0
        count_temp = count_temp+1;
        if count_temp > 100
            error("不收敛");
        end
    else
        count_temp = 0;
    end

    error_ = error_temp;
    count = count+1;
    x = x_temp; 
    
end
    fprintf("迭代次数:%d\n",count);
end