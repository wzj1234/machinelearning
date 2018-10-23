import sys
print("参数名",sys.argv[0])
print(len(sys.argv))
for i in range(1,len(sys.argv)):
	print("参数：",i,sys.argv[i])
x=input()
print("x是什么",x)