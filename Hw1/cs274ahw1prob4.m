n_lst = [100 1000 10000 100000];
mean_lst = [];
var_lst  = [];
for i = 1:4
    Y_lst = [];
    for j = 1:1000
        Y_new = sum(rand(1,n_lst(i)))/n_lst(i);
        Y_lst = [Y_lst Y_new];
    end
    mean_lst = [mean_lst mean(Y_lst)];
    var_lst = [var_lst std(Y_lst)];
    subplot(2,2,i);
    hist(Y_lst,30);
    xlabel(num2str(n_lst(i)))
end

mean_lst 
var_lst 

abs(.5-mean_lst)
abs(var_lst - (1/12)./n_lst.^2)