function data = convertFromBitStream(bitStream, N)
    %N is number of blocks that were grouped together
    % assuming bitStream is cell array of length equal to the # of groups
    % of blocks
    
    n = 8; % number of rows of a block 
    m = 8; % number of columns of a block 
    data = cell([1 length(bitStream)]);
    
    for i=1:length(bitStream)
        data{i} = reshape(bitStream{i}, [n m N]);   %convert back to 3D array, N different arrays of 8x8 blocks
        data{i} = bi2de(bitStream{i});
    end
    
end