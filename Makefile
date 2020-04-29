
SRC1 = cpu.py
SRC2 = utils.py
SRC3 = main.fut
SRC5 = main2.fut
EXE3 = main
EXE5 = main2
ENTRY = main
SRC4 = partition.fut
EXE4 = partition
SRC6 = brute.fut


virtual: 
	virtualenv -p python3 annfield

activate: 
	source annfield/bin/activate

install: 
	pip install -r requirements.txt

# Initial command to setup tools and requirements.
init: virtual activate install

# Run the main python program. 
runpy:
	python $(SRC1)


# Compile futhark brute-force implementation with opencl.
compile-fut:
	futhark opencl $(SRC3)
	futhark opencl $(SRC5)


# Run the futhark brute-force implementation.
runfut: compile-fut
	./$(EXE3) -e main < data/sorting/12test-k3-d16-eq.in > data/traverse/visit-all-k3-d16
	./$(EXE5) -e main < data/sorting/12test-k3-d16-eq.in > data/traverse/visit-one-k3-d16
	./$(EXE3) -e main < data/traverse/13test-k5-d6.in    > data/traverse/visit-all-k5-d6
	./$(EXE5) -e main < data/traverse/13test-k5-d6.in    > data/traverse/visit-one-k5-d6

# 	./$(EXE3) -e main < data/sorting/8test-k3-d8.in > data/traverse/visit-all-k3-d8
# 	./$(EXE5) -e main < data/sorting/8test-k3-d8.in > data/traverse/visit-one-k3-d8

# 	./$(EXE3) -e main < data/traverse/11test-k5-d16.in > data/traverse/visit-all-k5-d16
# 	./$(EXE5) -e main < data/traverse/11test-k5-d16.in > data/traverse/visit-one-k5-d16
# 	./$(EXE3) -e main < data/traverse/11test-k5-d1.in  > data/traverse/visit-all-k5-d1
# 	./$(EXE5) -e main < data/traverse/11test-k5-d1.in  > data/traverse/visit-one-k5-d1


# ./brute -e main < data/testinput.in  > data/validation.out


# Run tests of the futhark brute-force implementation.
runtestfut: 
	futhark test --backend=opencl $(SRC3)


# futhark bench --backend=opencl -r 1 main.fut
# Benchmark multiple datasets with the below, -e denotes the entrypoint.
benchmain: 
	futhark bench --backend=opencl -e $(ENTRY) -r 1 $(SRC3)

benchpar:
	futhark bench --backend=opencl -e $(ENTRY) -r 1 $(SRC3)
	futhark bench --backend=opencl -e $(ENTRY) -r 1 $(SRC4)

benchtrav:
	futhark bench --backend=opencl -e $(ENTRY) -r 1 $(SRC3)
	futhark bench --backend=opencl -e $(ENTRY) -r 1 $(SRC5)


benchbrute:
	futhark bench --backend=opencl -e $(ENTRY) -r 1 $(SRC3)
	futhark bench --backend=opencl -e $(ENTRY) -r 1 $(SRC6)


# Creating a Python module of the futhark brute-force implementation with pyopencl. 
compile-futlib: 
	futhark pyopencl --library $(SRC3)


makedata:
	./makedata.sh


# Profile info for a file-saved dataset.
profile-saved: compile-fut
	./$(EXE1) -P < data/dataset.in


# Detailed profile info for a autogenerated dataset of the futhark brute-force implementation.
# profile-auto-detailed:
# 	futhark dataget $(SRC3) "[35170][8]f32 [35170][8]f32" | ./$(EXE1) -D -e $(ENTRY) > /dev/null


# # Simple profile info for a autogenerated dataset of the futhark brute-force implementation.
# profile-auto-simple:
# 	futhark dataget $(SRC3) "[35170][8]f32 [35170][8]f32" | ./$(EXE1) -P -e $(ENTRY) > /dev/null


# # For printing the runtime without futhark bench of the futhark brute-force implementation.
# profile-auto-runtime:
# 	futhark dataget $(SRC3) "[35170][8]f32 [35170][8]f32" | ./$(EXE1) -t /dev/stderr -r 20 -e $(ENTRY) > /dev/null


profile:
	./runrandom.sh


