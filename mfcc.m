function r = mfcc(s, fs)
% MFCC
%
% Inputs: s  contains the signal to analize
%         fs is the sampling rate of the signal
%
% Output: r contains the transformed signal
%
%
%%%%%%%%%%%%%%%%%%

n = 2048;
m = n/2; % 50% Overlap
l = length(s);
nbFrame = floor((l - n) / m) + 1;

for i = 1:n
    for j = 1:nbFrame
        M(i, j) = s(((j - 1) * m) + i);
    end
end

h = hamming(n);
M2 = diag(h) * M;

for i = 1:nbFrame
    frame(:,i) = fft(M2(:, i));
end

m = melfb(13, n, fs);
n2 = 1 + floor(n / 2);
z = m * abs(frame(1:n2, :)).^2;
r = dct(log(z));
r = min(r,10000); %Saturating the transformed signal values to a max of 10000 instead of inf
r = max(r,-10000);
