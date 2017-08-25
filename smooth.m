function inputPoints=smooth(inputPoints)
for k=2:length(inputPoints)-1
    inputPoints(k) = (inputPoints(k-1)+inputPoints(k)+inputPoints(k+1)) / 3;
end

