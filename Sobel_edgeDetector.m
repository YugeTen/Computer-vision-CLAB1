function output_image = Sobel_edgeDetector(input_image)
    % create edge of 1 pixel around the original image
    im = uint8(zeros(514,514));
    for i = 2:513
        for j = 2:513
            im(i,j) = input_image(i-1,j-1);
        end
    end

    sobel = [-1,0,1;-2,0,2;-1,0,1];
    % get the Sobel matrix ready for convolution
    % on both direction (horizontal & vertical)
    sobel_conv_h = rot90(sobel,2);
    sobel_conv_v = rot90(sobel,3);

    % apply convolution on both direction
    for i = 2:513
        for j = 2:513
            matrix33 = im((i-1):(i+1),(j-1):(j+1));
            horizontal = im2double(matrix33)*255.*sobel_conv_h;
            vertical = im2double(matrix33)*255.*sobel_conv_v;
            % combine the results of horizontal edge detection
            % and vertical detection to acquire the final result
            pixel = sqrt(sum(sum(horizontal))^2+sum(sum(vertical))^2);
            output_image(i-1,j-1) = uint8(pixel);
        end
    end


end