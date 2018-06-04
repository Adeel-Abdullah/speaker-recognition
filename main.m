T = train('train\');
k=3;

testdir = 'test\';
acc=0;
for i = 3:length(dir(testdir))
    a = dir(testdir);
    b = dir(strcat(testdir,a(i).name,'\'));
     for j = 3:length(b)
        [s,fs] = audioread(strcat(testdir,a(i).name,'\',b(j).name));
        speaker = knn(s,fs,T,'Label',k);
        fprintf('Speaker %s matches with speaker %s \n', speaker, a(i).name);
        if speaker == a(i).name
            acc=acc+1;
        end
     end
end
accuracy = acc/(20) *100;
disp(accuracy);

