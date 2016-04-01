function  output_image = my_Median_filter(input_image)
    for i = 2:511
        for j = 2:511
            a = [];
            % put all 9 pixel in the range in one vector
            for i_ker = -1:1
                for j_ker = -1:1
                   a = [a,input_image(i+i_ker,j+j_ker)];
                end
            end
            % sort the vector and find the mid-value pixel
            a = sort(a);
            input_image(i,j) = a(5);
        end
    end
    output_image = input_image;
end
