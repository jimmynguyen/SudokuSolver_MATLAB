function message = assertEquals(input1,input2)

	if isequal(input1,input2)
		message = 'PASSED';
	else
		message = 'FAILED';
	end

end