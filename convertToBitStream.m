function stream = convertToBitStream(array_3d, N)
    % N is the number of blocks to be grouped together
    
    [m n numBlocks] = size(array_3d); % Rows, Columns, Number of Blocks
    reshapeSize = n * m * N;
    assert(mod(numBlocks,N)==0);  %make sure we can make N groups of blocks
    
    j=1;
    for i=1:N:numBlocks
       stream{j} = reshape(array_3d(:,:,i:i+N-1), [reshapeSize 1]);
       stream{j} = de2bi(stream{j});
       j=j+1;
    end
    
end