%% generate N random integers between [a,b]

clear, clc
rng('shuffle'); % avoid repeating the same random number arrays when MATLAB restarts

a = 1;
b = 90;

N = 6;
MaxCombinations = 100000;

attempt = MaxCombinations;

for k = 1:attempt

    r = round(a + (b-a)*rand(1,N));

    [uniqueR i j] = unique(r,'first');
    indexToDupes = find(not(ismember(1:numel(r),i)));

    while not(isempty(indexToDupes))
        if not(isempty(indexToDupes))
            for i = 1:length(indexToDupes)
                r(indexToDupes(i)) = round(a + rand*(b-a));
            end
        end

        [uniqueR i j] = unique(r,'first');
        indexToDupes = find(not(ismember(1:numel(r),i)));
    end

    R(k,:) = r;

end

a = unique(R);
out = [a,histc(R(:),a)];

out = sortrows(out,2,'descend');

combination = out(1:6,1)
