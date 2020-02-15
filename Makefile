
SRC1 = cpu.py
SRC2 = utils.py
SRC3 = brute.fut
EXE1 = brute


init: 
	virtualenv -p python3 annfield
	source annfield/bin/activate
	pip install -r requirements.txt


runpy:
	python $(SRC1)


bench: 
	futhark bench --backend=opencl -e $(EXE1) -r 2 $(SRC3)


compile-fut:
	futhark opencl $(SRC3)


compile-futlib: 
	futhark pyopencl --library $(SRC3)


profile-saved: compile-fut
	./$(EXE1) -P < data/dataset.in


# REMEMBER TO CHANGE DATASET
profile-auto-detailed:
	futhark dataget $(SRC3) "[35170][8]f32 [35170][8]f32" | ./$(EXE1) -D -e $(EXE1) > /dev/null


# REMEMBER TO CHANGE DATASET
profile-auto-simple:
	futhark dataget $(SRC3) "[35170][8]f32 [35170][8]f32" | ./$(EXE1) -P -e $(EXE1) > /dev/null


# REMEMBER TO CHANGE DATASET
profile-auto-runtime:
	futhark dataget $(SRC3) "[35170][8]f32 [35170][8]f32" | ./$(EXE1) -t /dev/stderr -r 10 -e > /dev/null


