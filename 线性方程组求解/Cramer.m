%使用克拉默法则求解线性方程组
%coMatrix为系数矩阵，需要一个方阵；constantTerm为常数项，需要一个列向量，行数等于方阵的行数
%计算效率极低，时间复杂度O（n·n！）
function y = Cramer(coMatrix,constantTerm)

%校验参数
mSize1 = size(coMatrix);
mSize2 = size(constantTerm);
A = det(coMatrix);%求系数矩阵行列式的值
if mSize1(1) ~= mSize1(2)
    error('系数矩阵不是方阵');
end
if mSize2(1) ~= mSize1(1)
    error('常数项与系数矩阵行数不同');
end
if A == 0
    error('方程有无穷多解');
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




