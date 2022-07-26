%% generate N random integers between [a,b]

a = 1;
b = 90;

N = 6;

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

r