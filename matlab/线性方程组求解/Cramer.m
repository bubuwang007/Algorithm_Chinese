%ʹ�ÿ���Ĭ����������Է�����
%coMatrixΪϵ��������Ҫһ������constantTermΪ�������Ҫһ�����������������ڷ��������
%����Ч�ʼ��ͣ�ʱ�临�Ӷ�O��n��n����
function y = Cramer(coMatrix,constantTerm)

%У�����
mSize1 = size(coMatrix);
mSize2 = size(constantTerm);
A = det(coMatrix);%��ϵ����������ʽ��ֵ
if mSize1(1) ~= mSize1(2)
    error('ϵ�������Ƿ���');
end
if mSize2(1) ~= mSize1(1)
    error('��������ϵ������������ͬ');
end
if A == 0
    error('������������');
end

y = zeros(mSize2(1),1);
for i = 1:mSize1(1)
    temp = coMatrix(:,:);
    for j = 1:mSize1(2)
        temp(j,i) = constantTerm(j);
    end
    y(i)= det(temp)/A;
end

end




