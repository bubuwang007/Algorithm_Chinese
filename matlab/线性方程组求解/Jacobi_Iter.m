%aΪϵ������bΪ������
function x = Jacobi_Iter(a,b)

%�����ʼֵ�����
x = zeros(size(b));
error_ = 1;

%ȷ��������ʽ�����B0��f
for i = 1:size(a,1)
   for j = 1:size(a,1)
      if i ~= j
          a(i,j) = -a(i,j)/a(i,i);         
      end
   end
   b(i) = b(i)/a(i,i);
   a(i,i) = 0;
end

%�������
count = 0;
count_temp = 0;
while error_ > 1e-9
    
    x_temp = a*x+b;
    error_temp = max(abs(x_temp-x));
    
    if abs(error_temp)-abs(error_) > 0
        count_temp = count_temp+1;
        if count_temp > 100
            error("������");
        end
    else
        count_temp = 0;
    end

    error_ = error_temp;
    count = count+1;
    x = x_temp; 
    
end
    fprintf("��������:%d\n",count);
end