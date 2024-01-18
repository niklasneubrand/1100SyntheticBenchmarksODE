function [T,yExp] = artExpToVector(tT,y)

global ar

% Replace small and negative values
y(-1e-6<y & y<1e-8 & y~=0) = 1e-8;

% heuristic to further replace small values:
% If more data points below a threshold than the number of observables
% replace the data points below the threshold with the threshold

for exponent = -8:-3
    threshold = 10^(exponent);
    if length(y(y<threshold))<size(y,2)
        y(y<threshold)=threshold;
    end
end


% Order data all in one matrix
T = unique(sort(tT(~isnan(tT(:)))));
yExp = nan(size(T,1),size(tT,2));
for i=1:size(y,1)
    for j=1:size(y,2)
        for k=1:size(T,1)
            if tT(i,j)==T(k)
                yExp(k,j) = y(i,j);
            end
        end
    end
end
while all(isnan(yExp(end,:)))
    yExp(end,:) = [];
    T(end) = [];
end

end