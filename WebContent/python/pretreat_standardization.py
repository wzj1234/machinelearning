import sys
import json

pythonPath = sys.argv[1]
with open(pythonPath+'/sample_X_final.json','r') as f:
	sample=json.load(f)
	f.close()
print(len(sample),len(sample[0]))
# print(len(sample[0]))

from sklearn.preprocessing import StandardScaler
sc = StandardScaler()
sc.fit(sample)
sample = sc.transform(sample).tolist()   #need to transfor array to list so can use json.dump()
print(len(sample),len(sample[0]))
with open(pythonPath+"/sample_X_final.json",'w') as fp:
	json.dump(sample,fp)

print("Standardization end")