%采用二分法求解方程的根
%a,b为根的区间，a小b大，要求f(a)*f(b)<0
%f为函数；e1为最小数，绝对值小于e1则视为0；e2为容许误差
function root = dichotomy(a,b,f,e1,e2)

if f(a)*f(b) > 0
    error('方程根可能不存在');
end

%检验a或b是否为方程的根
if f(a)*f(b) == 0
    if f(a) == 0
        root = a;
        return
    else
        root = b;
        return
    end
end

while(b-a > e2)

    x = 0.5*(a+b);

    if abs(f(x)) < e1
        root = x;
        return
    end

    if f(a)*f(x)<0
        b = x;
    else
        a = x;
    end
    
end

root = x;

end