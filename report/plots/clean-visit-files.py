#!/usr/bin/env python3

with open('../../data/visit-all-k3-d16') as f1:
	d1 = f1.read()

fd1 = d1.replace("i32", "").replace("f32", "").replace("[", "").replace("]", "").replace(",", " \n")

with open('../../report/plots/visit-all-k3-d16.csv', 'w+') as f11:
	f11.write(fd1)




with open('../../data/visit-one-k3-d16') as f2:
	d2 = f2.read()

fd2 = d2.replace("i32", "").replace("f32", "").replace("[", "").replace("]", "").replace(",", " \n")

with open('../../report/plots/visit-one-k3-d16.csv', 'w+')  as f21:
	f21.write(fd2)



with open('../../data/visit-all-k5-d6') as f3:
	d3 = f3.read()

fd3 = d3.replace("i32", "").replace("f32", "").replace("[", "").replace("]", "").replace(",", " \n")
# print(type(fd3))

with open('../../report/plots/visit-all-k5-d6.csv', 'w+') as f31:
	f31.write(fd3)


# fd12 = d1.replace("i32", "").replace("f32", "").replace("[", "").replace("]", "").replace(",", ", \n")

# with open('../../report/plots/visit2.csv', 'a+') as f:
# 	f.write(fd12)
# 	f.write(fd3)


with open('../../data/visit-one-k5-d6') as f4:
	d4 = f4.read()

fd4 = d4.replace("i32", "").replace("f32", "").replace("[", "").replace("]", "").replace(",", " \n")

with open('../../report/plots/visit-one-k5-d6.csv', 'w+') as f41:
	f41.write(fd4)







# visit-one-k5-d16
# visit-all-k5-d1
# visit-one-k5-d1


