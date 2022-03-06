close all;
clear all;
clc;

%%3.1
x_train_1 = [0.4003 0.3988 0.3998 0.3997];
x_test_1 = [0.4010 0.3995 0.3991];

x_train_2 = [0.2554 0.3139 0.2627 0.3802];
x_test_2 = [0.3287 0.3160 0.2924];

x_train_3 = [0.5632 0.7687 0.0524 0.7586];
x_test_3 = [0.4243 0.5005 0.6769];

X_train = [x_train_1; x_train_2; x_train_3];
X_test = [x_test_1; x_test_2; x_test_3];
y = [1; 2; 3];

input_1 = [x_train_1 x_test_1];
input_2 = [x_train_2 x_test_2];
input_3 = [x_train_3 x_test_3];
inputs = [input_1(1:4) input_2(1:4) input_3(1:4)];
classes = ["class 1" "class 1" "class 1" "class 1"...
           "class 2" "class 2" "class 2" "class 2"...
           "class 3" "class 3" "class 3" "class 3"];
distance = [];
for i = 1:length(inputs)
    dist_euclid = sqrt((inputs(i)-input_1(5))^2);
    distance = [distance dist_euclid];
end

distance
    

mdl = fitcknn(X_train,y,'NumNeighbors',3)
rloss = resubLoss(mdl)

%flwrClass = predict(mdl,X_test)
%%3.2
%Y1 = normpdf([x_train_1 x_test_1],0.4,0.01)
Y11 = normpdf([x_train_1 x_test_1; x_train_2 x_test_2; x_train_3 x_test_3],0.4,0.01)
%Y2 = normpdf([x_train_2 x_test_2],0.3,0.05)
Y22 = normpdf([x_train_1 x_test_1; x_train_2 x_test_2; x_train_3 x_test_3],0.3,0.05)
%Y3 = normpdf([x_train_3 x_test_3],0.5,0.2)
Y33 = normpdf([x_train_1 x_test_1; x_train_2 x_test_2; x_train_3 x_test_3],0.5,0.2)

% res = [Y11(1,:) Y22(1,:) Y33(1,:);
%        Y11(2,:) Y22(2,:) Y33(2,:);
%        Y11(3,:) Y22(3,:) Y33(3,:)]
 res = [Y11(1,:) Y11(2,:) Y11(3,:);
        Y22(1,:) Y22(2,:) Y22(3,:);
        Y33(1,:) Y33(2,:) Y33(3,:)]

[max,index] = max(res)