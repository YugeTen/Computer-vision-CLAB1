function output_image = my_Gauss_filter(input_image,my_99_gausskernel)
% have the matrix ready for convolution
gauss = rot90(my_99_gausskernel,2);

% create edge of 4 pixels around the original image
im = uint8(zeros(520,520));
for i = 5:516
    for j = 5:516
        im(i,j) = input_image(i-4,j-4);
    end
end


% apply convolution
for i = 5:516 
    for j = 5:516
        matrix99 = im((i-4):(i+4),(j-4):(j+4));
        pixel = im2double(matrix99)*255.*gauss;
        output_image(i-4,j-4) = uint8(sum(sum(pixel)));
    end
end
    

end

            
