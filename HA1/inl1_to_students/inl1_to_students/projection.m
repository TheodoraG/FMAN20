function [up, r] = projection(u,e1,e2,e3,e4)
    %input arguments - image, the four bases
    %output arguments - projection, the norm
    %compute the coordinates x1, x2, x3, x4
    prod1 = u.*e1;
    x1 = sum(prod1(:)); %scalar product
    prod2 = u.*e2;
    x2 = sum(prod2(:)); %scalar product
    prod3 = u.*e3;
    x3 = sum(prod3(:)); %scalar product
    prod4 = u.*e4;
    x4 = sum(prod4(:)); %scalar product
    %compute the orthogonal projection
    up = x1*e1 + x2*e2 + x3*e3 + x4*e4;
    %compute the norm
    %r = norm(abs(u - up),2);
    prod_r = (u-up).*(u-up);
    r = sqrt(sum(prod_r(:)));
    %r = sqrt(sum((u-up).*(u-up),'all'));
end

