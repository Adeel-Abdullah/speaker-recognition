function T = train(traindir)
% Speaker Recognition: Training Stage
%
% Input:
%       traindir : string name of directory contains all train sound files
%
% Output:
%       T     : the samples arranged into a table ready for testing
%
% Example:
%       >> code = train('C:\data\train\');


for i = 3:length(dir(traindir))
    a = dir(traindir);
    b = dir(strcat(traindir,a(i).name,'\'));
    for j = 3:length(b)
         file = strcat(traindir,a(i).name,'\',b(j).name);
         [s, fs] = audioread(file);
         v = mfcc(s,fs);
         H{i-2} = array2table(v',...
             'VariableNames',{'MFCC1','MFCC2','MFCC3','MFCC4','MFCC5','MFCC6','MFCC7','MFCC8','MFCC9','MFCC10','MFCC11','MFCC12','MFCC13'});
         Label = string(a(i).name);                                        % Create Label column
         Labelvct = repmat(Label, size(H{i-2},1), 1);                      % Create ‘Vector’ Of labels
         H{i-2} = [H{i-2} table(Labelvct, 'VariableNames', {'Label'})];    % Concatenate labels In Table
    end
end
T = vertcat(H{:});