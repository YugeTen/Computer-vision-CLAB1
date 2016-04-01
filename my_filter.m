
function output_image = my_filter(input_image,filter_kernel)
im = uint8(zeros(514,514));
for i = 2:513
    for j = 2:513
        im(i,j) = input_image(i-1,j-1);
    end
end
kernel_conv = rot90(filter_kernel,2);


for i = 2:513
    for j = 2:513
        matrix33 = im((i-1):(i+1),(j-1):(j+1));
        pixel = im2double(matrix33)*255.*kernel_conv;
        output_image(i-1,j-1) = uint8(sum(sum(pixel)));
    end
end


end