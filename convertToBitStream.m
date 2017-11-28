function stream = convertToBitStream(array_3d, N)
    % N is the number of blocks to be grouped together
    
    n = size(array_3d, 1); % number of rows of a block (8)
    m = size(array_3d, 2); % number of columns of a block (8)
    reshapeSize = n * m * N;
    numBlocks = size(array_3d, 3); %number of nxm blocks
    assert(mod(numBlocks,N)==0);  %make sure we can make N groups of blocks
    
    j=1;
    for i=1:N:numBlocks
       stream{j} = reshape(array_3d(:,:,i:i+N-1), [reshapeSize 1]);
       stream{j} = de2bi(stream{j});
       j=j+1;
        
    end
    
end