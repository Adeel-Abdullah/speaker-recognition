function Label = knn(s, fs, T, target, k)
v = mfcc(s, fs);            % Compute MFCC's
x = array2table(v',...
'VariableNames',{'MFCC1','MFCC2','MFCC3','MFCC4','MFCC5','MFCC6','MFCC7','MFCC8','MFCC9','MFCC10','MFCC11','MFCC12','MFCC13'});
varnames = T.Properties.VariableNames;
others = ~strcmp(target,varnames);
varnames = [varnames(others)];
twl=T(:,varnames);
dist =pdist2(x{:,:}, twl{:,:});
[~,idx] = sort(dist, 2, 'ascend');
idx = idx(:,1:k);
T.Label = string(T.Label);
Label = mode(T.Label(idx),2);
Label = mode(Label);  %find the label of majority points
