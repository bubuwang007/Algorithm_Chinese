% a = [1,2,-2;1,1,1;2,2,1];
% b = [1;1;1];

a = [1,0.4,0.4;0.4,1,0.8;0.4,0.8,1];
b = [1;2;3];

%�����ʼֵ�����
x = zeros(size(b));
x_temp = zeros(size(b));
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
    
    for i = 1:size(a,1)
        x_temp(i) = a(i,1:end)*x_temp+b(i);
    end
    
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
    x = x_temp; 
    count = count +1;
    
end
    fprintf("��������:%d",count);