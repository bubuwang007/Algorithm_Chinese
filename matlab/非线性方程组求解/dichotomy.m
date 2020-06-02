%���ö��ַ���ⷽ�̵ĸ�
%a,bΪ�������䣬aСb��Ҫ��f(a)*f(b)<0
%fΪ������e1Ϊ��С��������ֵС��e1����Ϊ0��e2Ϊ�������
function root = dichotomy(a,b,f,e1,e2)

if f(a)*f(b) > 0
    error('���̸����ܲ�����');
end

%����a��b�Ƿ�Ϊ���̵ĸ�
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