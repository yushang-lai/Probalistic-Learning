par_lst = [0.9 0.7 0.5 0.3 0.1];
r_lst   = [0.9 0 -0.9];

theta1 = 1;
theta2 = 1;
format long;
for i =1:3
    subplot(2,3,i)
    r = r_lst(i);
    covar  = [theta1^2 r*theta1*theta2; r*theta1*theta2 theta2^2];
    icovar = inv(covar);
    pmax   = (1/2/pi/(det(covar)^.5));
    c_lst  = par_lst*pmax; 


    zfun = @(x1,x2) (1/2/pi/(det(covar)^.5))*exp((-.5)*[x1 x2]*icovar*[x1 x2]');
    zhandle = fcontour(zfun);
    zhandle.LevelList = par_lst*pmax;
    colorbar
    title(['r=' num2str(r)])
    disp(c_lst)
end
disp(['         yellow    ','     light green    ','      deep green      ', '    light blue     ','     deep blue      '])